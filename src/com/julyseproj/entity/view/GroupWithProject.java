package com.julyseproj.entity.view;

import com.julyseproj.entity.Group;

public class GroupWithProject extends Group {
    private String projectName;

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
}
