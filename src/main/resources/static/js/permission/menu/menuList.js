/**
 * 刷新表格中的数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    $.ajax({
        type: 'POST',
        url: '/permission/menu/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data= $(result).find("table");
            $("#page_data").html(data);
        },
        error: function () {
            layer.msg('系统错误，请与系统管理员联系', {icon: 5, time:2000});
        }
    })
}

/**
 * 出现数据变动时刷新页面数据
 */
function retrieve() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        menuName: $("#menuName").val(),
        status: $("#status").val(),
    };
    $.ajax({
        type: 'POST',
        url: '/permission/menu/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data = $(result).find("div");
            $("#search_data").html(data);
        },
        error: function () {
            layer.msg('系统故障，请与系统管理员联系', {icon: 5,time:2000});
        }
    })
}

/**
 * 条件筛选时调用方法
 */
$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

/**
 * 批量删除菜单信息
 */
function datadel() {
    var checkNum=$("input[name= 'subCheck']:checked").length;
    if (checkNum == 0){
        layerOpen("请至少选择一项");
        return;
    }
    layer.confirm('确定要删除已选中的信息吗？', function (index) {
        var option = $("input[name = 'subCheck']:checked");
        var flag = true;
        var checkedId = '';
        for (var i = 0, length = option.length; i<length; i++){
            if (flag){
                if (option[i].id == 'subCheck'){
                    flag = true;
                }else {
                    checkedId += option[i].value;
                    flag = false;
                }
            }else {
                checkedId += ','+option[i].value;
            }
        }
        $.ajax({
            type: 'POST',
            url: '/permission/menu/batchDelete',
            data: {"checkedId": checkedId},
            dataType: 'json',
            success: function (result) {
                if (result.code==0){
                    layer.msg(result.data, {icon: 6,time: 2000}, function () {
                        retrieve();
                    })
                }else {
                    layer.msg(result.data, {icon:5 ,time:2000}, function () {
                        retrieve();
                    })
                }
            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系', {icon: 5, time: 2000});
            }
        })
    })
}

function menu_stop(obj,id) {
    layer.confirm('确定禁用此菜单吗？', function (index) {
        $.ajax({
            type: 'POST',
            data: {"menuId": id},
            dataType: 'json',
            url: '/permission/menu/start',
            success: function (result) {
                $(obj).parent("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="menu_start(this,id)" href="javascript:;" title="已启用"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parent("tr").find(".td-status").html('<span class="label radius">禁用</span>');
                $(obj).remove();
                reload();
                layer.msg('禁用菜单成功', {icon: 5,time: 2000})

            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系', {icon: 5,time:2000})
            }
        })
    })
}

function menu_start(obj,id) {
    layer.confirm('确定启用此菜单吗？', function (index) {
        $.ajax({
            type: 'POST',
            data: {"menuId": id},
            dataType: 'json',
            url: '/permission/menu/start',
            success: function (result) {
                $(obj).parent("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="menu_stop(this,id)" href="javascript:;" title="禁用"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parent("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                $(obj).remove();
                reload();
                layer.msg('启用菜单成功', {icon:6, time:2000});
            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系',{icon: 5, time:2000})
            }
        })
    })
}

function layer_update(id) {
    var url= '/permission/menu/'+id+'/toUpdate';
    var index=layer.open({
        type: 2,
        area: ['800px', '95%'],
        skin: 'layui-layer-rim',
        shade: 0.4,
        shadeClose: true,
        minmax: true,
        fix: false, //不固定
        scrollbar: false,
        title: '修改菜单信息',
        content: url
    })
}

function menu_del(id) {
    var index=layer.open({
        content: '确定删除菜单信息吗？',
        btn: ['确定', '取消'],
        shade: 0.4,
        shadeClose: true,
        yes: function () {
            $.ajax({
                type: 'POST',
                url: '/permission/menu/delete',
                data: {"menuId": id},
                dataType: 'json',
                success: function (result) {
                    if (result.code == 0){
                        layer.msg(result.data, {icon: 6, time:2000}, function (index) {
                            retrieve();
                            layer.close(index);
                        })
                    }else {
                        layer.msg(result.data, {icon: 5, time:2000}, function (index) {
                            retrieve();
                            layer.close(index)
                        })

                    }                },
                error: function () {
                    layer.msg('系统异常，请与系统管理员联系',{icon: 5,time: 2000});
                }
            })
        }
    })
}

