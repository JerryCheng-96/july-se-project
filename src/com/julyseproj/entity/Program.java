package com.julyseproj.entity;

public class Program {
    private Integer programId;

    private String programName;

    private String programDescription;

    private Integer programAuthor;

    public Integer getProgramId() {
        return programId;
    }

    public void setProgramId(Integer programId) {
        this.programId = programId;
    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName == null ? null : programName.trim();
    }

    public String getProgramDescription() {
        return programDescription;
    }

    public void setProgramDescription(String programDescription) {
        this.programDescription = programDescription == null ? null : programDescription.trim();
    }

    public Integer getProgramAuthor() {
        return programAuthor;
    }

    public void setProgramAuthor(Integer programAuthor) {
        this.programAuthor = programAuthor;
    }
}