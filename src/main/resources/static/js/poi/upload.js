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