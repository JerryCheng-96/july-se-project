package com.julyseproj.entity.view;

import com.julyseproj.entity.Student;

public class StudentWithName extends Student {
    private String className;
    private String groupName;

    public String getClassName() {
        return className;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
