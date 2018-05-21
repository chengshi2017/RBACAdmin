/**
 * 通用方法 部门信息的修改
 * 包括数据的校验
 */
$(function () {
    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });

    $('#form-dept-add').validate({
        rules:{
            deptName:{
                required: true
            },
            remark: {
                required: true,
                maxlength: 100,
                minlength: 4
            }
        },
        message: {
            deptName: "部门名称不能为空",
            remark: {
                required: "部门描述不能为空",
                maxlength: "最多只能输入100个字符",
                minlength: "至少需要输入四个字符"
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function (form) {
            $(form).ajaxSubmit({
                type: 'POST',
                url: '/dept/toUpdate',
                dataType: 'json',
                data: $("#form-dept-add").serialize(),
                success: function (result) {
                    layer.msg(result.data, {icon: 6, time: 2000}, function () {
                        var index=parent.layer.getFrameIndex(window.name);
                        //parent.$('.btn-refresh').click();
                        parent.retrieve();//刷新父页面
                        parent.layer.close(index);//关闭弹出层
                    })
                },
                error: function () {
                    layer.msg("系统错误，请与系统管理员联系", {icon: 5, time:2000});
                }
            })
        }
    })
});