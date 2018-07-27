package com.julyseproj.entity;

public class Task {
    private Integer taskId;

    private String taskName;

    private String taskDescription;

    private Integer taskEngineer;

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName == null ? null : taskName.trim();
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription == null ? null : taskDescription.trim();
    }

    public Integer getTaskEngineer() {
        return taskEngineer;
    }

    public void setTaskEngineer(Integer taskEngineer) {
        this.taskEngineer = taskEngineer;
    }
}