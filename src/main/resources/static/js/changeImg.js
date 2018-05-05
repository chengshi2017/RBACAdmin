/***
 * 点击更换验证码js
 * @param obj
 */
function changeImg(obj) {
    var src = $(obj).attr("src")
    src += '?p'+Math.random();
    $(obj).attr("src",src)
}