package com.julyseproj.entity;

public class Log {
    private Integer logId;

    private Integer logUploader;

    private Integer logGroup;

    private String logContent;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getLogUploader() {
        return logUploader;
    }

    public void setLogUploader(Integer logUploader) {
        this.logUploader = logUploader;
    }

    public Integer getLogGroup() {
        return logGroup;
    }

    public void setLogGroup(Integer logGroup) {
        this.logGroup = logGroup;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent == null ? null : logContent.trim();
    }
}