var myChart = echarts.init(document.getElementById('attend_list'));
var dataShadow = [];
option = null;
var yMax = 8;
var dateNum = [];  //日期数组，用来放请求的日期
var timeNum = [];  //考勤时长，用来放用来的考勤时间
var id;
$(function () {

    //加载事件
    var collection = $(".layui-btn");
    $.each(collection, function () {
        $(this).addClass("start");
    });
    $("#month").addClass("end");

    dateNum =[];
    timeNum = [];
    $.ajax({
        type: 'post', //异步请求(同步请求将会锁住浏览器，用户必须等待其他的操作完成后才能进行其它的操作)
        url: '/attend/data',
        dataType: 'json',
        success: function (result) {
            var data = result.data;
            for (var i = 0, length = data.length; i < length; i++) {
                var array1 = data[i].attendDate.split("-");
                dateNum.push(array1[2]);
                timeNum.push(data[i].workHours);
            }

            myChart.hideLoading();  //隐藏加载动画

            loadTable();
        }
    });
});

function loadTable() {
    for (var i = 0; i < timeNum.length; i++) {
        dataShadow.push(yMax);
    }

    option=({

        title: {
            left: 'center',
            text: "5月考勤信息展示图"
        },

        xAxis: {
            name: '日期',
            data: dateNum,
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#000000'
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 8
        },
        yAxis: {
            name: '考勤时长/h',
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#000000'
                }
            }
        },
        dataZoom: [
            {
                type: 'inside'
            }
        ],
        series: [
            { // For shadow
                type: 'bar',
                itemStyle: {
                    normal: {color: 'rgba(0,0,0,0.05)'}
                },
                barGap:'-100%',
                barCategoryGap:'40%',
                data: dataShadow,
                animation: false
            },
            {
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#83bff6'},
                                {offset: 0.5, color: '#188df0'},
                                {offset: 1, color: '#188df0'}
                            ]
                        )
                    },
                    emphasis: {
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                {offset: 0, color: '#2378f7'},
                                {offset: 0.7, color: '#2378f7'},
                                {offset: 1, color: '#83bff6'}
                            ]
                        )
                    }
                },
                data: timeNum
            }
        ]
    });

    myChart.showLoading(); //数据加载完之前先显示一段简单的loading

    var zoomSize = 6;
    myChart.on('click', function (params) {
        console.log(dateNum[Math.max(params.dataIndex - zoomSize / 2, 0)]);
        myChart.dispatchAction({
            type: 'dataZoom',
            startValue: dateNum[Math.max(params.dataIndex - zoomSize / 2, 0)],
            endValue: dateNum[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
        });
    });
    if (option && typeof option === "object"){
        myChart.setOption(option,true);
    }
}

function dj(dom) {
    var collection = $(".layui-btn");
    $.each(collection, function () {
        $(this).removeClass("end");
        $(this).addClass("start");
    });
    $(dom).removeClass("start");
    $(dom).addClass("end");
    console.log(id);

    var data = {
        id: dom.id
    };
    console.log(data);

    dateNum =[];
    timeNum = [];
    $.ajax({
        type: 'post', //异步请求(同步请求将会锁住浏览器，用户必须等待其他的操作完成后才能进行其它的操作)
        url: '/attend/data',
        dataType: 'json',
        data: data,
        async: true,
        success: function (result) {
            var data = result.data;
            for (var i = 0, length = data.length; i < length; i++) {
                var array1 = data[i].attendDate.split("-");
                dateNum.push(array1[2]);
                timeNum.push(data[i].workHours);
            }
            myChart.hideLoading();  //隐藏加载动画
            loadTable();
        }
    });



}


