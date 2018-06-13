$(function () {

    distinct();

    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });

    $('#form-menu-add').validate({
        rules:{
            menuName: "required",
            menuIndex: "required",
            remark: {
                required: true,
                minlength: 4,
                maxlength: 100,
            }
        },
        message: {
            menuName: "菜单名不能为空",
            menuIndex: "展示顺序不能为空",
            remark: {
                required: "菜单描述不能为空",
                minlength: '至少需要输入4个字符',
                maxlength: '最多只能输入100个字符',
            }
        },
        onkeyup: false,
        focusCleanup: true,
        success: "valid",
        submitHandler:function (form) {
            $(form).ajaxSubmit({
                type: 'POST',
                data: $("#form-menu-add").serialize(),
                dataType: 'json',
                url: '/permission/menu/update',
                success: function (result) {
                    layer.msg(result.data, {icon:6, time:2000}, function () {
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.retrieve();
                        parent.layer.close(index);
                    })
                },
                error: function () {
                    layer.msg('系统故障，请与系统管理员联系', {icon: 5,time: 2000});
                }
            })
        }
    })

});

// function distinct() {
//     $("select option").each(function () {
//         text=$(this).text();
//         if($("select option:contains("+text+")").length > 1)
//             $("select option:contains("+text+"):gt(0)").remove();
//     });
// }