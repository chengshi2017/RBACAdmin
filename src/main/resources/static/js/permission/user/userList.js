/***
 * ajax 异步请求刷新页面
 */
function reload() {
    var data={
        "pageNo": laypage_curr || 1,
        "pageSize": 10,
        "userName": $("#userName").val(),
        "phone": $("#phone").val(),
    };
    common.getData("post", "/permission/user/page", data, "html", $("#page_data"));
}

/***
 * 用户更新页面弹出层
 * @param userId
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

/***
 * 用户删除
 * @param id
 */
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

function datadel() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum == 0){
        layerOpen('请选择至少一项');
        return false;
    }
    //批量选择
    layer.confirm('确定要删除吗？', function (index) {
        //获取所有选中的checked框
        var option = $(":checked");
        var checkedId = "";
        var flag=true;
        //拼接除全选框外所有选中的id
        for (var i=0, len = option.length; i < len; i++){
            if (flag){
                if (option[i].id == 'subCheck'){
                    flag = true;
                }else {
                    flag = false;
                    checkedId += option[i].value;
                }
            }else {
                checkedId += "," +option[i].value
            }
        }
        $.ajax({
            type: "post",
            url: "/permission/user/batchDelete",
            dataType: "json",
            data: {"checkedId":checkedId},
            success: function (result) {
                layer.msg(result.data, {icon: 6, time: 2000}, function () {
                    reload();
                })
            },
            error: function (reslut) {
                layer.msg(reslut.data, {icon: 5, time: 2000});
            }
        })
    })
}

function layerOpen(msg) {
    var index=layer.open({
        skin: 'layui-layer-molv',//样式类名,
        content: msg,
        btn: ['确定'],
        shade: 0.4,
        shadeClose: false,
        title: ['错误信息'],
        yes: function () {
            layer.close(index);
        }
    })
}

/*管理员-停用*/
function admin_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        var url='/permission/user/'+id+'/update';
        $.ajax({
            type: 'post',
            dateType: 'json',
            url: url,
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label radius">已禁用</span>');
                $(obj).remove();
                layer.msg('已停用!',{icon: 5,time:1000});
            },
            error: function () {
                layer.msg('系统故障，请联系管理员', {icon: 5, time: 1000});
                layer.close(index);
            }
        });

    });
}

/*管理员-启用*/
function admin_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
        //此处请求后台程序，下方是成功后的前台处理……
        var url='/permission/user/'+id+'/update';
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: url,
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                $(obj).remove();
                layer.msg('已启用!', {icon: 6,time:1000});
            },
            error: function () {
                layer.msg('程序出现错误', {icon: 5, time: 1000});
                layer.close(index);
            }
        })


    });
}

$(function () {
    $("#retrieve").click(function () {
        var data = {
            "pageNo": laypage_curr || 1,
            "pageSize": 10,
            "userName": $("#userName").val(),
            "startTime": $("#datemin").val(),
            "endTime": $("#datemax").val(),
        };
        $.ajax({
            type: 'post',
            data: data,
            dateType: 'html',
            url: '/permission/user/page',
            async: false,
            success: function (result) {
                var table=$(result).find("table");
                console.log(table);
                $("#page_data").html(table);
            }
        })
    })
});



