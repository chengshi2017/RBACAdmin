$(function () {
    $("#upload_excel").hide();
});
/**
 * 分页及筛选时调用的方法
 */
function retrieve() {
    var data = {
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        attendStatus: $("#attendStatus").val(),
        userName: $("#userName").val()
    };
    $.ajax({
        type: 'post',
        url: '/system/attend/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data=$(result).find("div");
            $("#search_data").html(data);
        }
    })
}

$("#search").click(function () {
   retrieve();
});

/**
 * 刷新数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post','/system/attend/retrieve',data,'html',$("#page_data"));
}


function upload_excel() {
    var url = '/emp/skip';
    var index = layer.open({
        type: 2,
        title: '导入excel',
        fix: true,
        shade: 0.4,
        shadeClose: true,
        maxmin: true,
        skin: 'layui-layer-rim', //加上边框
        area: ['520px', '440px'], //宽高
        content: url
    })
}
var index;
function download_excel() {
    var url = '/system/attend/toSkip';
    index = layer.open({
        type: 2,
        title: ['考勤时间段', 'text-align:center'],
        fix: true,
        skin: 'layui-layer-molv',
        area: ['300px', '230px'],
        content: url
    })
}

function refer() {
    var date = $("input[name='radio']:checked").val();
    console.log(date);
    var url = '/excel/' + date + '/attendExcel';
    var index=parent.layer.getFrameIndex(window.name);
    parent.download(url);
    parent.layer.close(index);//关闭弹出层


}

function download(url) {
    layer.msg("正在导出Excel数据格式模板，请稍等...", {icon: 1,time:1000},function () {
        location.href = url;
    });
}
