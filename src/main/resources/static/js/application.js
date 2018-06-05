/***
 * 封装常用的js
 * 以及模块内公共的方法
 */
var common={
    /**
     * 常用的获取数据ajax请求方法
     * @param _type
     * @param _url
     * @param _data
     * @param _dataType
     * @param _element
     */
    getData: function (_type, _url, _data, _dataType, _element) {
        $.ajax({
            type: _type,
            url: _url,
            data: _data,
            dataType: _dataType,
            error: function () {
                return false;
            },
            success: function (data) {
                var result= $(data).find("table");
                _element.html(result);
            }
        })
    }
};

function refresh() {
    window.location.reload();
}

/**
 * 错误信息弹出窗口
 * @param msg
 */
function layerOpen(msg) {
    var index = layer.open({
        skin: 'layui-layer-molv', //样式类名
        content: msg,
        btn: ['确定'],
        shade: 0.4,
        shadeClose: true,
        title: ['错误信息', 'text-align:center; color: red'],
        yes: function () {
            layer.close(index);
        }
    })
}

function distinct() {
    $("select").each(function(i,n){
        var options = "";
        $(n).find("option").each(function(j,m){
            if(options.indexOf($(m)[0].outerHTML) == -1)
            {
                options += $(m)[0].outerHTML;
            }
        });
        $(n).html(options);
    });
}