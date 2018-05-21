
$(function () {
    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });

    $("#form-emp-add").validate({
        rules: {
            empName: "required",
            sex: "required",
            age: "required",
            address: "required",
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true,
                isPhone: true
            },
            pace: "required",
            deptName: "required",
            jobName: "required",
            remark: {
                minlength: 4,
                maxlength: 100
            }
        },
        message:{
            empName: "请输入员工姓名",
            sex: "请输入员工性别",
            age: "请输入员工年龄",
            address: "请输入员工家庭住址",
            email: {
                required: "员工email不能为空",
                email: "请输入正确的email"
            },
            phone: {
                required: "电话号码不能为空",
                isPhone: "请输入正确的电话号码"
            },
            pace: "请输入员工所属民族",
            deptName: "请选择部门名称",
            jobName: "请选择职位名称",
            remark: {
                minlength: "备注信息最少4个字符",
                maxlength: "备注信息最多100个字符"
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function (form) {
            $(form).ajaxSubmit({
                type: 'post',
                url: '/emp/update',
                data: $("#form-emp-add").serialize(),
                dataType: 'json',
                success: function (result) {
                    layer.msg(result.data, {icon:6 , time:2000},function () {
                        var index=parent.layer.getFrameIndex(window.name);
                        parent.retrieve();
                        parent.layer.close(index);
                    })
                },
                error: function (result) {
                    layer.msg('系统故障，请与系统管理员联系', {icon: 5,time: 2000})
                }
            })
        }
    })
});