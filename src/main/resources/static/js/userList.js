

function reload() {
    var data={
        "pageNo": laypage_curr || 1,
        "pageSize": 10,
    };
    common.getData("post", "/permission/user/page", data, "html", $("#page_data"));
}

/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_update(userId){
    var url='/permission/user/'+userId+'/toUpdate';
    console.log(url);
    if (url == null || url == '') {
        url="404.html";
    };
    layer.open({
        type: 2,
        area: ['800px', '95%'],
        fix: false, //不固定
        maxmin: true,
        shade:0.4,
        shadeClose: true,
        skin: 'layui-layer-rim',
        title: '修改用户信息',
        content: url
    });
}

/**用户删除**/
// function admin_del(obj,id) {
//     var url='user/permission/'+id+'/delete';
//     console.log(url);
//     layer.confirm('确定要删除吗？',function (index) {
//         $.ajax({
//             type: 'POST',
//             url: url,
//             dataType: 'json',
//             success: function (result) {
//                 $(obj).parents("tr").remove();
//                 layer.msg(result.data, {icon: 6, time: 2000}, function () {
//                     //var index=parent.layer.getFrameIndex(window.name);
//                     //parent.$('.btn-refresh').click();
//                     window.parent.location.reload();//刷新父页面
//                     parent.layer.close(index);//关闭弹出层
//                 })
//             },
//             error: function (result) {
//                 layer.msg(result.data, {icon: 5, time: 2000}, function () {
//                     window.parent.location.reload();//刷新父页面
//                     parent.layer.close(index);//关闭弹出层
//                 })
//             }
//         })
//     })
// }

function admin_del(id) {
    var url='/permission/user/'+id+'/delete';
    console.log(url);
    var index=layer.open({
        content: '确定删除吗？',
        btn: ['确认', '取消'],
        shade: 0.4,
        shadeClose: false,
        yes: function () {
            $.post(url, {}, function (result) {
                layer.msg(result.data, {icon: 6, time: 2000}, function () {
                    reload();
                    layer.close(index);
                })
            },'json')
        },
        no: function () {
            layer.close(index);
        }

    })
}


