/**
 * 调用通用的方法新增或修改角色信息
 */
$(function () {
    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });
    $("#form-role-add").validate({
        rules: {
            roleName: "required",
            remark: {
                required: true,
                maxlength: 100,
                minlength: 4
            }
        },
        message: {
            roleName: "角色名称不能为空",
            remark: {
                required: "角色描述不能为空",
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
                url: '/permission/role/update',
                data: $("#form-role-add").serialize(),
                dataType: 'json',
                success: function (result) {
                    layer.msg(result.data, {icon: 6,time: 2000}, function () {
                        var index=parent.layer.getFrameIndex(window.name);
                        //parent.$('.btn-refresh').click();
                        parent.retrieve();//刷新父页面
                        parent.layer.close(index);//关闭弹出层
                    })
                },
                error: function () {
                    layer.msg('系统错误，请与系统管理员联系', {icon:5, time: 2000}, function () {
                        var index=parent.layer.getFrameIndex();
                        parent.layer.close(index);
                    })
                }

            })
        }


    })
});