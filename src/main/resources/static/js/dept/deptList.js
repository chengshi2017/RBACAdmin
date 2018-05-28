/**
 * 分页时加载数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        startTime: $("#datemin").val(),
        endTime: $("#datemax").val(),
        deptName: $("#deptName").val()
    };
    common.getData("post", "/dept/retrieve", data, "html", $("#page_data"));
}

/**
 * 批量删除
 */
function batch_delete() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum==0){
        layerOpen("请至少选择一项");
        return;
    }
    //批量选择
    layer.confirm('确定要删除吗？', function (index) {
        var option = $("input[name='subCheck']:checked");
        var checkedId = "";
        var flag = true;
        for (var i=0, len=option.length; i<len; i++){
            if (flag){
                if (option[i].id == 'subCheck'){
                    flag = true;
                }else {
                    checkedId += option[i].value;
                    flag =false;
                }
            }else {
                checkedId += "," +option[i].value;
            }
        }
        $.ajax({
            type: "POST",
            url: "/dept/batchDelete",
            dataType: 'json',
            data: {"checkedId":checkedId},
            success: function (result) {
                if (result.code==0){
                    layer.msg(result.data, {icon: 6, time: 2000}, function () {
                        retrieve();
                    })
                }else{
                    layer.msg(result.data, {icon: 5, time: 2000}, function () {
                        window.location.reload();
                    })
                }
            },
            error: function () {
                layer.msg('系统故障,请与系统管理员联系', {icon: 5, time: 2000});
            }
        })
    })
}

/**
 * 部门信息的修改
 * @param id
 */
function layer_update(id) {
    var url='/dept/'+id+'/toUpdate';
    var index=layer.open({
        type: 2,
        area: ['800px', '95%'],
        shade: 0.4,
        shadeClose: true,
        fix: false, //不固定
        scrollbar: false,
        maxmin: true,
        skin: 'layui-layer-rim',
        title: '修改部门信息',
        content: url
    })
}

/**
 * 部门信息的删除
 * @param id
 */
function dept_del(id) {
    var index= layer.open({
        content: "确定要删除吗？",
        btn: ['确定', '取消'],
        shade: 0.4,
        shadeClose: false,
        yes: function () {
            $.ajax({
                type: "POST",
                url: "/dept/delete",
                dataType: 'json',
                data: {"deptId":id},
                success: function (result) {
                    if (result.code == 0){
                        layer.msg(result.data, {icon:6, time: 2000}, function () {
                            retrieve();
                        })
                    }else{
                        layer.msg(result.data, {icon: 5,time: 2000})
                    }
                },
                error: function () {
                    layer.msg("系统故障，请与系统管理员联系", {icon: 5, time: 2000})
                }
            })
        },
        no: function () {
            layer.close(index);
        }
    })
}

function dept_stop(obj,id) {
    layer.confirm('确定将部门解散吗？' ,function (index) {
        $.ajax({
            type: 'post',
            url: '/dept/start',
            dateType: 'json',
            data: {"deptId": id},
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="dept_start(this,id)" href="javascript:;" title="组建" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label radius">已解散</span>');
                $(obj).remove();
                reload();
                layer.msg('部门已解散!',{icon: 5,time:2000});
            },
            error: function () {
                layer.msg('系统故障，请联系管理员', {icon: 5, time: 2000});
            }
        })
    })
}

function dept_start(obj,id) {
    layer.confirm('确定重新组建此部门吗？', function (index) {
        $.ajax({
            type: 'POST',
            url: '/dept/start',
            dateType: 'json',
            data: {"deptId": id},
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="dept_stop(this,id)" href="javascript:;" title="解散" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
                $(obj).remove();
                reload();
                layer.msg('部门组建成功!', {icon: 6,time:2000});
            },
            error: function () {
                layer.msg('程序出现错误', {icon: 5, time: 2000});
            }
        })
    })
}

$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

function retrieve() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        startTime: $("#datemin").val(),
        endTime: $("#datemax").val(),
        deptName: $("#deptName").val(),
    };
    $.ajax({
        type: 'post',
        url: '/dept/retrieve',
        dataType: 'html',
        data: data,
        success: function (result) {
            var filter= $(result).find("div");
            $("#search_data").html(filter);
        },
        error: function () {
            layer.msg('系统错误，请与系统管理员联系', {icon:5, time: 2000})
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
        {"orderable":false,"aTargets":[0,2,3,5,6]}// 制定列不参与排序
    ]
});



