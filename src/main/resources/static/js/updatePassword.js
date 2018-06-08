
var index;
function showEdit() {
    index = layer.open({
        type: 1,
        title: '修改密码',
        fix: false,  //不固定
        maxmin: true,   //开启最大最小化
        shade: 0.4,    //遮罩
        shadeClose: true,    //遮罩关闭
        skin: 'layui-layer-rim', //加上边框
        area: ['510px', '300px'], //宽高
        content: $('#updatePwd')
    });
};

// function submit1() {
function layer_close() {
    layer.close(index);
}

$(function () {
    $("#submit1").click(function () {
        var oldPassword = $("#oldPassword").val();
        var userPassword = $("#userPassword").val();
        var repassword = $("#repassword").val();
        if (oldPassword==null || oldPassword==""){
            $("#msg").html("原密码不能为空");
            return;
        }
        if (userPassword==null || userPassword==""){
            $("#msg").html("请输入要修改的密码");
            return;
        }
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


function attendance() {
    var url = '/attend/signPage';
    var index = layer.open({
        title: ['今日打卡'],
        type: 2,
        fix: false,
        shade: 0.4,
        shadeClose: false,
        skin: 'layui-layer-rim', //加上边框
        area: ['400px', '300px'], //宽高
        scrollbar: false,
        content: url
    })
}





