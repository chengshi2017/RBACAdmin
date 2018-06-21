/**
 * 分页及筛选时调用的方法
 */
function retrieve() {
    var data = {
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10,
        attendStatus: $("#attendStatus").val(),
        userName: $("#userName").val()
    };
    $.ajax({
        type: 'post',
        url: '/system/attend/retrieve',
        data: data,
        dataType: 'html',
        success: function (result) {
            var data=$(result).find("div");
            $("#search_data").html(data);
        }
    })
}

$("#search").click(function () {
   retrieve();
});

/**
 * 刷新数据
 */
function reload() {
    var data={
        pageNo: laypage_curr || 1,
        pageSize: laypage_limit || 10
    };
    common.getData('post','/system/attend/retrieve',data,'html',$("#page_data"));
}
