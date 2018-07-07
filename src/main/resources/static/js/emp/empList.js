$(function () {
   distinct();
    $("#upload_excel").hide();
});
/**
 * 刷新数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post','/emp/retrieve',data,'html',$("#page_data"));
}

/**
 * 条件查询时调用的方法
 */
function retrieve() {
    var startYear = $("#startYear").val();
    var endYear = $("#endYear").val();
    if (parseInt(startYear)<parseInt(endYear)){
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
    var option=$("input[name='subCheck']:checked");
    for (var i=0,length=option.length; i<length; i++){
        var record=option[i];
        var flag=$("record").parent();
        console.log(flag);
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
                if (result.code==0){
                    layer.msg(result.data, {icon: 6, time: 2000}, function () {
                        reload();
                    });
                }else {
                    layer.msg(result.data, {icon: 5, time:2000}, function () {
                        reload();
                    });
                }
            },
            error: function () {
                layer.msg('系统错误，请与系统管理员联系', {icon: 5, time: 2000})
            }
        })
    })
}

$(function () {
    $("#search").click(function () {
        retrieve();
    })
});

function emp_stop(obj,id) {
    var record=$(obj).parents("tr").find(".flag").text();
    var flag=record.substring(record.length-3,record.length);
    if (flag == '管理员' || flag =='未分配'){
        layerOpen("您没有权限操作此员工");
        return;
    }

    layer.confirm('确定要将状态定为异常吗？', function (index) {
        $.ajax({
            type: 'post',
            url: '/emp/start',
            data: {empId: id},
            dataType: 'json',
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="emp_start(this,id)" href="javascript:;" title="正常" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label radius">异常</span>');
                $(obj).remove();
                reload();
                layer.msg('员工状态异常!',{icon: 5,time:2000});
            },
            error: function () {
                layer.msg('系统错误，请与系统管理员联系', {icon: 5, time:2000})
                layer.close(index);
            }
        });
    })
}

function emp_start(obj,id) {
    var record=$(obj).parents("tr").find(".flag").text();
    var flag=record.substring(record.length-3,record.length);
    if (flag == '管理员' || flag == '未分配'){
        layerOpen("您没有权限操作此用户");
        return;
    }

    layer.confirm('确定要将状态修改为正常吗？' , function (index) {
        $.ajax({
            type: 'post',
            url: '/emp/start',
            data: {empId: id},
            dataType: 'json',
            success: function (result) {
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="emp_stop(this,id)" href="javascript:;" title="异常" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
                $(obj).remove();
                reload();
                layer.msg('员工状态正常!',{icon: 6,time:2000});
            }
        });
    })
}

function layer_update(obj,id) {
    var flag=$(obj).parents("tr").find(".flag").text();
    console.log(flag);
    var record=flag.substr(flag.length-3,flag.length);
    console.log(record);
    if (record == '管理员' || record == '未分配'){
        layerOpen("你没有权限修改管理员信息");
        return;
    }
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

function emp_del(obj, id) {
    var record=$(obj).parents("tr").find(".flag").text();
    var flag=record.substring(record.length-3,record.length);
    if (flag =='管理员' || flag == '未分配'){
        layerOpen("您没有权限操作此用户");
        return;
    }
    var index=layer.open({
        content: "确定要删除吗？",
        btn: ['确定', '取消'],
        shade: 0.4,
        shadeClose: true,
        yes: function () {
            $.ajax({
                type: 'post',
                data: {empId: id},
                dataType: 'json',
                url: '/emp/delete',
                success:function (result) {
                    layer.msg(result.data, {icon: 6, time:2000}, function () {
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

$('.table-sort').dataTable({
    "lengthMenu":false,//显示数量选择
    "bFilter": false,//过滤功能
    "bPaginate": false,//翻页信息
    "bInfo": false,//数量信息
    "aaSorting": [[ 1, "asc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,3,4,6,7,8,9]}// 制定列不参与排序
    ]
});

function download_excel() {
    layer.msg("正在导出Excel数据格式模板，请稍等...", {icon: 1,time:1000},function () {
        location.href='http://localhost:9000/excel/empExcel';
    });
}

var index;
function upload_excel() {
    index = layer.open({
        type: 1,
        title: '导入excel',
        fix: true,
        shade: 0.4,
        shadeClose: true,
        maxmin: true,
        skin: 'layui-layer-rim', //加上边框
        area: ['520px', '440px'], //宽高
        content: $("#upload_excel")
    })
}

layui.use('element', function () {
    var element = layui.element;
});
layui.use('upload', function () {
    var $ = layui.jquery
        , upload = layui.upload;
    //拖拽上传
    upload.render({
        elem: '#upload_onclick'
        ,url: '/excel/doImport'
        ,method: 'post'
        ,accept: 'file'
        ,size: 20*1024
        ,before: function () {
            layer.load();
        }
        ,done: function (res,index,upload) {
            layer.closeAll('loading');
            if (res.code == 0){
                layer.confirm(res.data.msg,{icon: 6, title: '恭喜你，文件上传成功', btn: ['知道了']}, function () {
                    layer.close(index);
                })
            }
            else{
                layer.msg(res.data.msg, {icon: 5,time: 1000});
            }
        },
        error: function (index, upload) {
            layer.closeAll('loading'); //关闭loading
            layer.alert("导入功能正在完善中。。。", {icon: 5});
        }
    })
});

