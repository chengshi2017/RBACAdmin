/***
 * ajax 异步请求刷新页面
 */
function reload() {
    var data = {
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        startTime: $("#datemin").val(),
        endTime: $("#datemax").val(),
        logTypeId: $("#logTypeId").val()
    };
   common.getData("post", "/log/retrieve", data, "html", $("#page_data"));
}

/**
 * 批量删除
 * @returns {boolean}
 */
function datadel() {
    var checkNum=$("input[name='subCheck']:checked").length;
    if (checkNum == 0){
        layerOpen('请选择至少一项');
        return false;
    }
    //批量选择
    layer.confirm('确定要删除吗？', function (index) {
        //获取所有选中的checked框
        var option = $("input[name='subCheck']:checked");
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
            url: "/log/batchDelete",
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

/***
 * 用户删除
 * @param id
 */
function admin_del(id) {
    var url='/log/'+id+'/delete';
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

function layerOpen(msg) {
    var index=layer.open({
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

$('.table-sort').dataTable({
    "lengthMenu":false,//显示数量选择
    "bFilter": false,//过滤功能
    "bPaginate": false,//翻页信息
    "bInfo": false,//数量信息
    "aaSorting": [[ 1, "asc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,2,3,5,6,7,8,9]}// 制定列不参与排序
    ]
});

function log_show(id) {
    var url = '/log/'+id+'/check';
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
        title: '查看日志信息',
        content: url
    })
}

$(function () {
    $("#query").click(function () {
        refresh();
    })
});

function refresh() {
    var data = {
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        startTime: $("#datemin").val(),
        endTime: $("#datemax").val(),
        logTypeId: $("#logTypeId").val()
    };
    $.ajax({
        type: 'POST',
        url: '/log/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data = $(result).find("div");
            console.log(data);
            $("#retrieve_data").html(data);
        },
        error: function () {
            layer.msg('系统访问出错，请与系统管理员联系', {icon: 5, time: 2000});
        }
    })
}


