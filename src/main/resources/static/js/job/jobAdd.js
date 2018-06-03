$(function () {
    distinct();
});

$(function () {
    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });
    $("#form-job-add").validate({
        rules:{
            jobName: {
                required: true
            },
            remark: {
                required: true,
                minlength: 4,
                maxlength: 100
            },
        },
        message: {
            jobName: "职位名称不能为空",
            remark: {
                required: "职位描述不能为空",
                minlength: "至少需要输入4个字符",
                maxlength: "最多只能输入100个字符"
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function (form) {
            $(form).ajaxSubmit({
                type: 'post',
                url: '/job/toUpdate',
                data: $("#form-job-add").serialize(),
                dataType: 'json',
                success: function (result) {
                    layer.msg(result.data,{icon: 6, time: 2000},function () {
                        var index=parent.layer.getFrameIndex(window.name);
                        //parent.$('.btn-refresh').click();
                        parent.retrieve();//刷新父页面
                        parent.layer.close(index);//关闭弹出层
                    })
                },
                error: function(result){
                    layer.msg(result.data,{icon:5, time:2000});
                }
            })
        }

    })
});