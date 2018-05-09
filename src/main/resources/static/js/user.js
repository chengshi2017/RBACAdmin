
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

/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_update(userId){
    var url='/permission/user/'+userId+'/toUpdate';
    console.log(url);
    if (url == null || url == '') {
        url="404.html";
    };
    layer.open({
        type: 2,
        area: ['800'+'px', '510' +'px'],
        fix: false, //不固定
        maxmin: true,
        shade:0.4,
        title: '修改用户信息',
        content: url
    });
}