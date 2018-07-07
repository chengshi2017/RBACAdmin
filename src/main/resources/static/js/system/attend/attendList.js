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

var index;
function upload_excel() {
    index = layer.open({
        type: 1,
        title: '导入excel',
        fix: true,
        shade: 0.4,
        shadeClose: true,
        maxmin: true,
        skin: 'layui-layer-rim', //加上边框
        area: ['520px', '440px'], //宽高
        content: $("#upload_excel")
    })
}

layui.use('element', function () {
    var element = layui.element;
});
layui.use('upload', function () {
    var $ = layui.jquery
        , upload = layui.upload;
    //拖拽上传
    upload.render({
        elem: '#upload_onclick'
        ,url: '/excel/doImport'
        ,method: 'post'
        ,accept: 'file'
        ,size: 20*1024
        ,before: function () {
            layer.load();
        }
        ,done: function (res,index,upload) {
            layer.closeAll('loading');
            if (res.code == 0){
                layer.confirm(res.data.msg,{icon: 6, title: '恭喜你，文件上传成功', btn: ['知道了']}, function () {
                    layer.close(index);
                })
            }
            else{
                layer.msg(res.data.msg, {icon: 5,time: 1000});
            }
        },
        error: function (index, upload) {
            layer.closeAll('loading'); //关闭loading
            layer.alert("导入功能正在完善中。。。", {icon: 5});
        }
    })



});
