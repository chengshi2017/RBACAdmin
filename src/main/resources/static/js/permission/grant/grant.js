


$(function () {
    $("#role-panel").hide();
    $("#menu-panel").hide();
});

//layui的element
layui.use('element', function(){
    var element = layui.element;

    element.on('nav(user)', function (elem) {
        var id=$(elem).attr("id");
        var data={"userId": id};
        $.ajax({
            type: 'POST',
            data: data,
            dataType: 'json',
            url: '/permission/grant/showResources',
            success: function (result) {
                $("#role-panel").show();
                 var record= result.data;
                initRoleZtree(record);
                $("#userId").val(id);
            },
            error: function () {
                return false;
            }
        })

    })
});

function initRoleZtree(record) {
    var setting = {
        view: {
            selectedMulti: false           //不允许同时选中多个节点
        },
        check: {
            enable: true,          //设置ztree节点上是否显示checkbox / radio 节点
            chkboxType: {"Y":"p", "N":"s"}   //Y 属性定义 checkbox 被勾选后的情况
                                             //N 属性定义 checkbox 取消勾选后的情况；
                                             //"p" 表示操作会影响父级节点；
                                             //"s" 表示操作会影响子级节点。
                                             //请注意大小写，不要改变
        },
        data: {
            key: {
                name: "name",           //zTree 节点数据保存节点名称的属性名称。
                children: "children"    //zTree 节点数据中保存子节点数据的属性名称。
            },
            simpleData: {
                enable: true,           // 分别表示 使用 / 不使用 简单数据模式
                idKey: "id",            // 节点数据中保存唯一标识的属性名称。
                pIdKey: "pid",          // 节点数据中保存其父节点唯一标识的属性名称
                rootPId: null           // 用于修正根节点父节点数据，即 pIdKey 指定的属性值。
            }
        },
        callback: {
            onCheck: onCheck,
            onDblClick: dbClick
        }


    };

    /**
     * 折腾了两天才解决，必须写一篇博客
     */
    console.log(record);
    //设置数据
    var zNodes = eval("(" + record + ")");
    console.log(zNodes);
//
    $(document).ready(function(){
        $.fn.zTree.init($("#treeRole"), setting, zNodes);
    });

        
    function onCheck(e, treeId, treeNode) {
        var checked=treeNode.checked;
        var id=treeNode.id;
        var roleId = $("#roleId").val();
        if (treeNode.role){
            var userId = $("#userId").val();
            updateUserRole(userId, id, checked);
        }else{
            updateRoleMenu(roleId, id, checked);
        }

    }
    
    function dbClick(e, treeId, treeNode) {
        var id = treeNode.id;
        $("#roleId").val(id);
        var data={"roleId": id, "checked": treeNode.checked};
        $.ajax({
            data: data,
            type: "post",
            dataType: 'json',
            url: '/permission/grant/loadResources',
            success: function (result) {
                var record = result.data;
                $("#menu-panel").show();
                initMenuTree(record);
            },
            error: function () {
                layer.msg("系统故障，请与系统管理员联系", {icon :5, time: 2000});
            }
        })
    }
    
    function initMenuTree(record) {
        var setting={
            view: {
                selectedMulti: false
            },
            check: {
                enable: true,
                chkboxType: {"Y":"p", "N":"s"}
            },
            data: {
                key: {
                    name: "name",
                    chileren: "children"
                },
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid"
                }

            },
            callback: {
                onCheck: onCheck,
                beforeCheck: beforeCheck
            }
        };

        var zNodes= eval("("+ record +")");
        console.log(zNodes);
        $(document).ready(function () {
            var treeObj=$.fn.zTree.init($("#treeMenu"), setting, zNodes);
            treeObj.expandAll(true);
        })

    }

    function beforeCheck(treeId, treeNode) {
        //获取id  是否checked
        var id = treeNode.id;
        var checked = treeNode.checked;
        var roleId = $("#roleId").val();

        if(treeNode.role == false){  //如果该节点不是角色节点 是菜单（资源）节点
            if(treeNode.isParent){      //当前节点是父节点 而且 不是角色节点
                if(checked == true){            //父节点取消选中   子节点也要取消选中
                    var children = treeNode.children;
                    for(var i = 0;i < children.length; i++){
                        if(children[i].checked == true)         //子节点选中时需要取消选中
                            updateRoleMenu(roleId, children[i].id, false);
                    }
                }
            }else{  //如果当前节点是子节点
                if(checked == false){        //选中子节点  父节点也需要选中
                    var parentNode = treeNode.getParentNode();      //获取父节点
                    if(parentNode != null && parentNode.checked == false){     //父节点不为null  而且未选中  更新数据库
                        updateRoleMenu(roleId, parentNode.id, true);
                    }
                }
            }
        }
    }

    function updateRoleMenu(roleId, menuId, checked) {
        $.ajax({
            type: "post",
            data: {"roleId": roleId, "menuId": menuId, "checked": checked},
            dataType: "json",
            url: "/permission/grant/updateRoleMenu",
            async : false,
            success: function (result) {
               layer.msg(result.data, {icon: 6, time: 1000})
            },
            error: function () {
                layer.msg("系统异常，请与系统管理员联系", {icon: 5,time: 2000})
            }
        })
    }

    function updateUserRole(userId, id, checked) {
        $.ajax({
            type: "post",
            data: {"userId":userId, "roleId": id, "checked": checked},
            dataType: "json",
            url: '/permission/grant/updateUserRole',
            success: function (result) {
                layer.msg(result.data, {icon: 6, time: 2000});
            },
            error: function () {
                layer.msg("系统异常，请与系统管理员联系", {icon: 5,time: 2000})
            }
        })
    }

}