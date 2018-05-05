
var index;
function showEdit() {
    index = layer.open({
        type: 1,
        title: '修改密码',
        fix: false,
        maxmin: true,
        skin: 'layui-layer-rim', //加上边框
        area: ['800px', '300px'], //宽高
        content: $('#updatePwd')
    });
};

// function submit1() {


    console.log("submit");
    $(function () {
        $("#submit1").click(function () {
            var oldPassword = $("#oldPassword").val();
            var userPassword = $("#userPassword").val();
            var repassword = $("#repassword").val();
            if (oldPassword == userPassword){
                $("#msg").html("新密码不能与原密码相同");
                console.log("111");
                return;
            }

            if (userPassword != repassword){
                $("#msg").html("两次输入的密码不一致");
                console.log("222");
                return;
            }
            $.ajax({
                url: "/user/updatePassword",
                type: "POST",
                dataType: "json",
                data: $("#updatePwd form").serialize(),
                success:function (result) {
                    console.log(result.code);
                    if(result.code == 0){
                        layer.msg(result.data, {icon: 6, time: 2000}, function () {
                            console.log("333");
                            layer.close(index);
                            window.location="/loginOut";

                        })
                    }else {
                        layer.msg(result.data, {icon: 5, time: 2000});
                        console.log("444");
                    }
                },
                error: function () {
                    $("#msg").html("请求出错");
                }
            });
        });
    });


    // $.post("/user/updatePassword", $('#changefrom').serialize(), function (result) {
    //     if (result.code == 0){
    //         console.log(result.data);
    //         layer.msg(result.data , {icon: 6 , time: 2000}, function () {
    //             layer.close();
    //         })
    //     }else{
    //         layer.msg(result.data, {icon: 5, time:2000});
    //         console.log(result.data);
    //     }
    // },"json");



