package com.julyseproj.entity;

public class Document extends DocumentKey {
    private String docDescription;

    private Integer docUploader;

    private Integer docGroup;

    public String getDocDescription() {
        return docDescription;
    }

    public void setDocDescription(String docDescription) {
        this.docDescription = docDescription == null ? null : docDescription.trim();
    }

    public Integer getDocUploader() {
        return docUploader;
    }

    public void setDocUploader(Integer docUploader) {
        this.docUploader = docUploader;
    }

    public Integer getDocGroup() {
        return docGroup;
    }

    public void setDocGroup(Integer docGroup) {
        this.docGroup = docGroup;
    }
}