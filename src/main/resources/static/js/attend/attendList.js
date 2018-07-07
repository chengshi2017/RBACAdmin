var myChart = echarts.init(document.getElementById('attend_list'));
var dataShadow = [];
option = null;
var yMax = 8;
var dateNum = [];  //日期数组，用来放请求的日期
var timeNum = [];  //考勤时长，用来放用来的考勤时间
var id;
var variable ;
var year;
var month;
$(function () {

    //加载事件
    var collection = $(".layui-btn");
    $.each(collection, function () {
        $(this).addClass("start");
    });
    $("#month").addClass("end");

    var gather = $(".cut");
    $.each(gather, function () {
        $(this).addClass("start");
    });
    $("#bar").addClass("end1");
    document.getElementById("pages").style.display = "none";

    dateNum =[];
    timeNum = [];
    $.ajax({
        type: 'post', //异步请求(同步请求将会锁住浏览器，用户必须等待其他的操作完成后才能进行其它的操作)
        url: '/attend/data',
        dataType: 'json',
        success: function (result) {
            var data = result.data;
            console.log(data);
            for (var i = 0, length = data.length; i < length; i++) {
                var array1 = data[i].attendDate.split("-");
                year = array1[0];
                month = array1[1];
                dateNum.push(array1[2]);
                console.log(dateNum);
                timeNum.push(data[i].workHours);
                console.log(timeNum);
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

    myChart.on('click', function (params) {
        console.log(params);
        var clickDate=params.name;
        console.log(clickDate);
        console.log(year);
        console.log(month);
        detailed(clickDate);
    });

    option=({

        title: {
            left: 'center',
            text: "考勤信息展示图"
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

    myChart.hideLoading();  //隐藏加载动画

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
                year=array1[0];
                month=array1[1];
                dateNum.push(array1[2]);
                timeNum.push(data[i].workHours);
            }

            myChart.showLoading(); //数据加载完之前先显示一段简单的loading
            loadTable();
        }
    });
}

function detailed(clickDate) {
    var date = year+"-"+month+"-"+clickDate;
    console.log(date);
    var url = '/attend/'+date+'/information';

    if (url == null || url == ''){
        url = '404.html';
    }
    var index=layer.open({
        type: 2,
        title: '考勤详细信息',
        area: ['800px','95%'],
        fix: false, //不固定
        scrollbar: false,
        btn: ['知道了'],
        shade: 0.4,
        skin: 'layui-layer-rim',
        content: url
    })
}

function cut(dom) {
    var gather = $(".cut");
    $.each(gather, function () {
        $(this).removeClass("end1");
        $(this).addClass("start");
    });
    $(dom).removeClass("start");
    $(dom).addClass("end1");
    var id=dom.id;
    console.log(id);
    if (id == 'bar'){
        document.getElementById("attend_list").style.display = "block";
        document.getElementById("page_data").style.display = "none";
        document.getElementById("pages").style.display = "none";
    }else {
        document.getElementById("attend_list").style.display = "none";
        document.getElementById("page_data").style.display = "block";
        document.getElementById("pages").style.display = "block";
    }
}


function reload() {
    var data = {
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post', '/attend/page', data, 'html', $("#page_data"));
}

function attend_show(id) {

    var url = '/attend/'+id+'/message';
    if (url == null || url == ''){
        url = '404.html';
    }
    var index = layer.open({
        type: 2,
        title: '考勤详细信息',
        area: ['800px','95%'],
        fix: false, //不固定
        scrollbar: false,
        btn: ['知道了'],
        shade: 0.4,
        skin: 'layui-layer-rim',
        content: url
    })
}

function reAttend(id) {
    var url = '/attend/'+id+'/reAttend';
    if (url == null || url == ''){
        url = '404.html';
    }
    layer.alert("补签功能正在完善中，可以去看看我的博客哦。。。", {icon: 5});

}




