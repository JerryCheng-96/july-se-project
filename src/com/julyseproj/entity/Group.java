package com.julyseproj.entity;

public class Group {
    private Integer groupId;

    private String groupName;

    private Integer groupFromclass;

    private Integer groupOnproject;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public Integer getGroupFromclass() {
        return groupFromclass;
    }

    public void setGroupFromclass(Integer groupFromclass) {
        this.groupFromclass = groupFromclass;
    }

    public Integer getGroupOnproject() {
        return groupOnproject;
    }

    public void setGroupOnproject(Integer groupOnproject) {
        this.groupOnproject = groupOnproject;
    }
}