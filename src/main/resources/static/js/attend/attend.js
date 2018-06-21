
$(function () {
    var a = new Date();
    var hh = a.getHours();
    var mm = a.getMinutes();
    var ss = a.getSeconds();
    var c = a.toLocaleDateString();
    $("#LocalTime").html(c+"&nbsp"+hh+":"+mm+":"+ss);
});

$("#attend").click(function () {
    $.ajax({
        type: 'post',
        url: '/attend/sign',
        dataType: 'json',
        async: true,
        success: function (result) {
            if (result.code == 0){
                layer.msg(result.data, {icon: 6, time: 2000},function () {
                    var index=parent.layer.getFrameIndex(window.name);
                    parent.refresh();
                    parent.layer.close(index);
                })
            }
        },
        error: function () {
            layer.msg("打卡失败，请与系统管理员联系", {icon: 5, time: 2000});
        }
    })
});