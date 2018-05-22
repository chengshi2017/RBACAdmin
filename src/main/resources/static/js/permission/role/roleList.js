

function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post', '/role/retrieve', data, 'html', $("#page_data"))
}

function retrieve() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        roleName: $("#roleName"),
        status: $("#status")
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

$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

function role_batchDelete() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum == 0){
        layerOpen("请至少选择一项");
        return;
    }
    layer.confirm('确定要删除所选信息吗？', function (index) {
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