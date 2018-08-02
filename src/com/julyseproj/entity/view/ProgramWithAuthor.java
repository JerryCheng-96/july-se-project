package com.julyseproj.entity.view;

import com.julyseproj.entity.Program;

public class ProgramWithAuthor extends Program {
    private String engineerName;

    public String getEngineerName() {
        return engineerName;
    }

    public void setEngineerName(String engineerName) {
        this.engineerName = engineerName;
    }
}
