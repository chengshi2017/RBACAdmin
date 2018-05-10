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
    },




}