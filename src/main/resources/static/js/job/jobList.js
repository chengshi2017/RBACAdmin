/**
 * 刷新数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
    };
    common.getData('post','/job/retrieve',data,'html',$("#page_data"));
}

function retrieve() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        status: $("#status").val(),
        jobName: $("#jobName").val()
    };
    $.ajax({
        type: 'POST',
        url: '/job/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data=$(result).find("div");
            $("#search_data").html(data);
        },
        error: function () {
            layer.msg('系统错误，请与系统管理员联系', {icon: 5, time: 2000});
        }
    })
}

function batch_delete() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum==0){
        layerOpen("请至少选择一项");
        return;
    }
    layer.confirm('确定要删除吗？' ,function (index) {
        var option=$("input[name='subCheck']:checked");
        var checkedId="";
        var flag=true;
        for (var i=0, length=option.length; i<length; i++) {
            if (flag) {
                if (option[i].id == 'subCheck') {
                    flag = true;
                } else {
                    checkedId += option[i].value;
                    flag = false;
                }
            } else {
                checkedId += ',' + option[i].value;
            }
        }
        $.ajax({
            type: 'post',
            data: {checkedId: checkedId},
            dataType: 'json',
            url: '/job/batchDelete',
            success: function (result) {
                if (result.code==0){
                    layer.msg(result.data ,{icon: 6, time: 2000}, function () {
                        retrieve();
                    })
                }else {
                    layer.msg(result.data ,{icon: 5, time:2000})
                }

            },
            error: function () {
                layer.msg('系统异常，请与系统管理员联系', {icon: 5, time: 2000});
            }
        })
    })

}

function job_stop(obj,id) {
    $.ajax({
        type: 'post',
        url: '/job/start',
        data: {jobId: id},
        dataType: 'json',
        success: function (result) {
            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="job_start(this,id)" href="javascript:;" title="组建" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label radius">空缺</span>');
            $(obj).remove();
            reload()
            layer.msg('该职位已空缺!',{icon: 5,time:2000});
        },
        error: function () {
            layer.msg('系统故障，请与系统管理员联系' ,{icon: 5, time: 2000})
        }
    })
}

function job_start(obj,id) {
    $.ajax({
        type: 'post',
        url: '/job/start',
        data: {jobId: id},
        dataType: 'json',
        success: function (result) {
            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="job_stop(this,id)" href="javascript:;" title="解散" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">在职</span>');
            $(obj).remove();
            reload()
            layer.msg('职位已在职!', {icon: 6,time:2000});
        },
        error: function () {
            layer.msg('系统故障，请与系统管理员联系', {icon: 5,time: 2000})
        }
    })
}

function job_del(id) {

        var index=layer.open({
            content: "确定要删除吗？",
            btn: ['确定', '取消'],
            shade: 0.4,
            shadeClose: true,
            yes: function () {
                $.ajax({
                    type: "POST",
                    url: "/job/delete",
                    dataType: 'json',
                    data: {"jobId":id},
                    success: function (result) {
                        layer.msg(result.data, {icon: 6, time: 2000}, function () {
                            retrieve();
                            layer.close(index);
                        })
                    },
                    error: function () {
                        layer.msg('系统故障，请与系统管理员联系', {icon: 5, time: 2000})
                    }
                })
            },
            no: function () {
                layer.close(index);
            }
        })



}

function layer_update(id) {
    var url='/job/'+id+'/toUpdate';
    var index=layer.open({
        type: 2,
        area: ['800px', '95%'],
        skin: 'layui-layer-rim',
        shade: 0.4,
        shadeClose: true,
        minmax: true,
        fix: false, //不固定
        scrollbar: false,
        title: '修改职位信息',
        content: url
    });
}

$(function () {
    $("#search").click(function () {
        retrieve();
    })
});
