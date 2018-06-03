/***
 * 通用方法
 * 新增用户信息和修改用户信息
 * 包括数据的校验
 */
$(function(){

    //下拉框去重
    distinct();

    $('.skin-minimal input').iCheck({
        checkboxClass: 'icheckbox-blue',
        radioClass: 'iradio-blue',
        increaseArea: '20%'
    });

    $("#form-admin-add").validate({
        rules:{
            userName:{
                required:true,
                minlength:4,
                maxlength:16
            },
            userPassword:{
                required:true,
                minlength: 6,
                maxlength: 18
            },
            userPassword2:{
                required:true,
                minlength: 6,
                maxlength: 18,
                equalTo: "#userPassword"
            },
            email:{
                required:true,
                email:true
            },
            phone:{
                required:true,
                isPhone:true
            }

        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",

        submitHandler:function(form){
            $(form).ajaxSubmit({
                type: 'post',
                url: "/permission/user/update" ,
                dataType: 'json',
                data: $('#form-admin-add').serialize(),
                success: function(result){
                    layer.msg(result.data, {icon:6, time:2000},function () {

                        var index=parent.layer.getFrameIndex(window.name);
                        //parent.$('.btn-refresh').click();
                        parent.retrieve();//刷新父页面
                        parent.layer.close(index);//关闭弹出层
                    });
                },
                error: function(result){
                    layer.msg(result.data,{icon:5, time:2000});
                }
            });
        }
    });
});