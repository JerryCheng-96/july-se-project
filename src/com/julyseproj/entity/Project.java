package com.julyseproj.entity;

public class Project {
    private Integer projectId;

    private String projectName;

    private Integer projectCreator;

    private Byte projectApproved;

    private String projectDescription;

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public Integer getProjectCreator() {
        return projectCreator;
    }

    public void setProjectCreator(Integer projectCreator) {
        this.projectCreator = projectCreator;
    }

    public Byte getProjectApproved() {
        return projectApproved;
    }

    public void setProjectApproved(Byte projectApproved) {
        this.projectApproved = projectApproved;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription == null ? null : projectDescription.trim();
    }
}