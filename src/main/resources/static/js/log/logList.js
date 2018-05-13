/***
 * ajax 异步请求刷新页面
 */
function reload() {
    var data={
        "pageNo": laypage_curr || 1,
        "pageSize": 10
    };
    common.getData("post", "/log/page", data, "html", $("#page_data"));
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
        title: ['错误信息'],
        yes: function () {
            layer.close(index);
        }
    })
}

$('.table-sort').dataTable({
    "lengthMenu":true,//显示数量选择
    "bFilter": false,//过滤功能
    "bPaginate": false,//翻页信息
    "bInfo": true,//数量信息
    "aaSorting": [[ 1, "asc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,2,3,7,5,6,7,8,9]}// 制定列不参与排序
    ]
});