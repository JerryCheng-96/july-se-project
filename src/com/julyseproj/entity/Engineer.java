package com.julyseproj.entity;

public class Engineer {
    private Integer engineerId;

    private String engineerName;

    private String engineerSex;

    private String engineerCompany;

    private String engineerDepartment;

    private String engineerJob;

    public Integer getEngineerId() {
        return engineerId;
    }

    public void setEngineerId(Integer engineerId) {
        this.engineerId = engineerId;
    }

    public String getEngineerName() {
        return engineerName;
    }

    public void setEngineerName(String engineerName) {
        this.engineerName = engineerName == null ? null : engineerName.trim();
    }

    public String getEngineerSex() {
        return engineerSex;
    }

    public void setEngineerSex(String engineerSex) {
        this.engineerSex = engineerSex == null ? null : engineerSex.trim();
    }

    public String getEngineerCompany() {
        return engineerCompany;
    }

    public void setEngineerCompany(String engineerCompany) {
        this.engineerCompany = engineerCompany == null ? null : engineerCompany.trim();
    }

    public String getEngineerDepartment() {
        return engineerDepartment;
    }

    public void setEngineerDepartment(String engineerDepartment) {
        this.engineerDepartment = engineerDepartment == null ? null : engineerDepartment.trim();
    }

    public String getEngineerJob() {
        return engineerJob;
    }

    public void setEngineerJob(String engineerJob) {
        this.engineerJob = engineerJob == null ? null : engineerJob.trim();
    }
}