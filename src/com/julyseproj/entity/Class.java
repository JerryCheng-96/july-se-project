package com.julyseproj.entity;

public class Class {
    private Integer classId;

    private String className;

    private String classDescription;

    private Integer classManager;

    private Integer classProgram;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getClassDescription() {
        return classDescription;
    }

    public void setClassDescription(String classDescription) {
        this.classDescription = classDescription == null ? null : classDescription.trim();
    }

    public Integer getClassManager() {
        return classManager;
    }

    public void setClassManager(Integer classManager) {
        this.classManager = classManager;
    }

    public Integer getClassProgram() {
        return classProgram;
    }

    public void setClassProgram(Integer classProgram) {
        this.classProgram = classProgram;
    }
}