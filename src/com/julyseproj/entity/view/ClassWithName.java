package com.julyseproj.entity.view;

import com.julyseproj.entity.Class;

public class ClassWithName extends Class {
    private String engineerName;
    private String programName;

    public String getEngineerName() {
        return engineerName;
    }

    public String getProgramName() {
        return programName;
    }

    public void setEngineerName(String engineerName) {
        this.engineerName = engineerName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }
}
