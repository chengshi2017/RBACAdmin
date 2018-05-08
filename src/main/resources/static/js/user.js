
// $(function () {
//     var data={
//         "pageNo": $(".laypage_curr").text() || 1,
//         "pageSize": 10,
//     };
//     common.getData("post", "/permission/user/data", data, "html", $("#form_data"));
// });
// $(function(){
//     fresh();
// });

function fresh() {
    var data={
        "pageNo": $(".laypage_curr").text() || 1,
        "pageSize": 10,
        "email": $("#email").val(),
        "userName": $("#userName").val()
    };
    common.getData("post", "/permission/user/page", data, "text", $("#page_data"))
}


function reload(obj) {
    var data={
        "pageNo": $(obj).attr("curr") || 1,
        "pageSize": 10,
    };
    common.getData("post", "/permission/user/page", data, "html", $("#page_data"));
}
