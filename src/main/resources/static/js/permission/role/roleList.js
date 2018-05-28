/**
 * 更新表格中的数据信息
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post', '/permission/role/retrieve', data, 'html', $("#page_data"))
}

/**
 * 更新页面中信息
 */
function retrieve() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        roleName: $("#roleName").val(),
        status: $("#status").val()
    };
    $.ajax({
        type: 'POST',
        data: data,
        dataType: 'html',
        url: '/permission/role/retrieve',
        success: function (result) {
            var data= $(result).find("div");
            $("#search_data").html(data);
        },
        error: function () {
            layer.msg('系统错误，请与系统管理员联系', {icon: 5, time:2000});
        }
    })
}

/**
 * 条件晒选
 */
$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

/**
 * 批量删除角色信息
 */
function role_batchDelete() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum == 0){
        layerOpen("请至少选择一项");
        return;
    }

    var checkedId = '';
    var flag = true;
    var option= $("input[name='subCheck']:checked");
    for (var i=0, length=option.length; i<length; i++){
        if (flag){
            if (option[i].id == 'subCheck'){
                flag = true;
            }else{
                checkedId += option[i].value;
                flag = false;
            }
        }else {
            checkedId += ','+option[i].value;
        }
    }
    var attr=checkedId.split(",");
    for (var i=0,len=attr.length; i<len; i++){
        var roleId=attr[i];
        if (roleId == '809281289969467392'){
            layerOpen("所选角色包含系统管理员角色，无法删除");
            return;
        }
    }
    layer.confirm('确定要删除所选信息吗？', function (index) {
        $.ajax({
            type: 'POST',
            data: {"checkedId": checkedId},
            dataType: 'json',
            url: '/permission/role/batchDelete',
            success: function (result) {
                layer.msg(result.data, {icon: 6, time: 2000}, function () {
                    retrieve();
                })
            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系', {icon: 5, time: 2000})
            }
        })
    })
}

/**
 * 禁用当前角色
 * @param obj
 * @param id
 */
function role_stop(obj, id) {
    if (id == '809281289969467392'){
        layerOpen("无法禁用系统管理员角色");
        return;
    }
    layer.confirm('确定要禁用此角色吗？', function (index) {
        $.ajax({
            type: "POST",
            data: {"roleId": id},
            dataType: 'json',
            url: '/permission/role/start',
            success:function (result) {
                $(obj).parent("tr").find(".td-manage").prepend('<a onClick="role_start(this,id)" href="javascript:;" title="有效" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parent("tr").find(".td-status").html('<span class="label radius">无效</span>');
                $(obj).remove();
                reload();
                layer.msg('此角色已禁用',{icon: 5, time: 2000});
            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系', {icon: 5, time:2000});
            }
        })
    })
}

/**
 * 启用当前角色
 * @param obj
 * @param id
 */
function role_start(obj,id) {
    layer.confirm('确定要启用此角色吗？', function (index) {
        $.ajax({
            type: "POST",
            data: {"roleId": id},
            dataType: 'json',
            url: '/permission/role/start',
            success: function (result) {
                $(obj).parent("tr").find(".td-manage").prepend('<a style="text-decoration:none" onclick="role_stop(this,id)" href="javascript:;" title="无效"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parent("tr").find(".td-status").html('<span class="label label-success radius">有效</span>');
                $(obj).remove();
                reload();
                layer.msg('此角色已启用', {icon: 6, time: 2000});
            },
            error: function () {
                layer.msg('系统错误，请与系统管理员联系', {icon: 5, time: 2000})
            }
        })
    })
}

/**
 * 加载用户更新页面
 * @param id
 */
function layer_update(id) {
    if (id == '809281289969467392'){
        layerOpen("系统管理员角色信息无法修改");
        return;
    }
    var url= '/permission/role/' +id+ '/toUpdate';
    console.log(url);
    var index=layer.open({
        type: 2,
        area: ['800px', '95%'],
        fix: false, //不固定
        maxmin: true,
        scrollbar: false,
        shade:0.4,
        shadeClose: true,
        skin: 'layui-layer-rim',
        title: '修改角色信息',
        content: url
    })
}

/**
 * 删除当前角色信息
 * @param id
 */
function role_del(id) {
    if (id == '809281289969467392'){
        layerOpen("无法删除系统管理员角色");
        return;
    }
    var index=layer.open({
        content: '确定要删除此角色吗？',
        btn: ['确定', '取消'],
        shade: 0.4,
        shadeClose: true,
        yes: function () {
           $.ajax({
               type: "POST",
               data: {"roleId": id},
               url: '/permission/role/delete',
               dataType: 'json',
               success: function (result) {
                   layer.msg(result.data, {icon:6, time:2000}, function () {
                       retrieve();
                       layer.close(index);

                   })
               },
               error: function () {
                   layer.msg('系统异常，请与系统管理员联系', {icon:5, time:2000})
               }
           })
        },
        no:function () {
            layer.close(index);
        }
    })
}

$('.table-sort').dataTable({
    "lengthMenu":false,//显示数量选择
    "bFilter": false,//过滤功能
    "bPaginate": false,//翻页信息
    "bInfo": false,//数量信息
    "aaSorting": [[ 1, "asc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,2,4,5,6]}// 制定列不参与排序
    ]
});