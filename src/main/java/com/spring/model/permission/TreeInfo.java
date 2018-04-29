package com.spring.model.permission;

import java.util.List;

/**
 * @Author Sunny
 * @Date 2018/2/22
 * @time 21:46
 * @Describe:
 */
public class TreeInfo {

    private String id;                  //id

    private String pid;                 //父级id

    private String name;                //名称

    private boolean open;               //是否打开节点

    private boolean checked;            //是否选中

    private boolean chkDisabled;        //是否禁用

    //private boolean isParent;           //是否是父级节点
    private boolean role;               //是否是角色节点

    private List<TreeInfo> children;    //子集集合

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isChkDisabled() {
        return chkDisabled;
    }

    public void setChkDisabled(boolean chkDisabled) {
        this.chkDisabled = chkDisabled;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    public List<TreeInfo> getChildren() {
        return children;
    }

    public void setChildren(List<TreeInfo> children) {
        this.children = children;
    }
}
