/**
 * 刷新数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post','/emp/retrieve',data,'html',$("#search_data"));
}

/**
 * 条件查询时调用的方法
 */
function retrieve() {
    var startYear = $("#startYear").val();
    var endYear = $("#endYear").val();
    if (startYear>=endYear){
        layerOpen("最高年限不得低于最低年限");
        return;
    }
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        empName: $("#empName").val(),
        startYear: $("#startYear").val(),
        endYear: $("#endYear").val(),
        deptName: $("#deptName").val(),
        jobName: $("#jobName").val()
    };
    $.ajax({
        type: 'post',
        url: '/emp/retrieve',
        dataType: 'html',
        data: data,
        success: function (result) {
            var data=$(result).find("div");
            $("#search_data").html(data);
        },
        error: function () {
            layer.msg("系统故障，请与系统管理员联系", {icon: 5, time:2000});
        }
    })
}

function batch_delete() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum==0){
        layerOpen("请至少选择一项");
        return;
    }
    layer.confirm('确定要删除选中内容吗？' ,function (index) {
        var option=$("input[name='subCheck']:checked");
        var checkedId="";
        var flag=true;
        for (var i=0,length=option.length; i<length; i++){
            if (flag){
                if (option[i].id == 'subCheck'){
                    flag = true;
                }else{
                    flag = false;
                    checkedId += option[i].value;
                }
            }else{
                checkedId += ','+option[i].value;
            }
        }
        $.ajax({
            type: 'post',
            url: '/emp/batchDelete',
            data: {empId: checkedId},
            dataType: 'json',
            success: function (result) {
                layer.msg(result.data, {icon: 6, time: 2000}, function () {
                    reload();
                })
            },
            error: function () {
                layer.msg('系统错误，请与系统管理员联系', {icon: 5, time: 2000})
            }
        })
    })
}

function layerOpen(msg) {
    var index = layer.open({
        skin: 'layui-layer-molv', //样式类名
        content: msg,
        btn: ['确定'],
        shade: 0.4,
        shadeClose: false,
        title: ['错误信息', 'text-align:center; color: red'],
        yes: function () {
            layer.close(index);
        }
    })
}

$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

function emp_stop(obj,id) {
    $.ajax({
        type: 'post',
        url: '/emp/start',
        data: {empId: id},
        dataType: 'json',
        success: function (result) {
            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="emp_start(this,id)" href="javascript:;" title="正常" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label radius">请假</span>');
            $(obj).remove();
            layer.msg('员工状态异常!',{icon: 5,time:2000});
        },
        error: function () {
            layer.msg('系统错误，请与系统管理员联系', {icon: 5, time:2000})
        }
    })
}

function emp_start(obj,id) {
    $.ajax({
        type: 'post',
        url: '/emp/start',
        data: {empId: id},
        dataType: 'json',
        success: function (result) {
            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="emp_stop(this,id)" href="javascript:;" title="请假" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label radius">正常</span>');
            $(obj).remove();
            layer.msg('员工状态正常!',{icon: 5,time:2000});
        }
    })
}

function layer_update(id) {
    var url = '/emp/'+id+'/toUpdate';
    var index=layer.open({
        type: 2,
        area: ['800px', '95%'],
        skin: 'layui-layer-rim',
        shade: 0.4,
        shadeClose: true,
        minmax: true,
        fix: false, //不固定
        scrollbar: false,
        title: '修改员工信息',
        content: url
    })
}

function admin_del(id) {
    $.ajax({
        type: 'post',
        data: {empId: id},
        dataType: 'json',
        url: '/emp/delete',
        success:function (result) {
            layer.msg(result.data, {icon: 6, time:2000}, function () {
                reload();
            })
        },
        error: function () {
            layer.msg('系统故障，请与系统管理员联系', {icon: 5, time: 2000})
        }
    })
}

function emp_show(id) {
    var url = '/emp/'+id+'/check';
    if (url == null || url ==''){
        url = '404.html';
    }
    var index = layer.open({
        type: 2,
        area: ['800px','95%'],
        fix: false, //不固定
        scrollbar: false,
        btn: ['知道了'],
        shade: 0.4,
        //skin: 'layui-layer-rim',
        title: '查看员工详细信息',
        content: url
    })
}


