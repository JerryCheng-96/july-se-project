package com.julyseproj.entity;

import java.util.Date;

public class Log {
    private Integer logId;

    private Integer logUploader;

    private Integer logGroup;

    private Date logTime;

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

    public Date getLogTime() {
        return logTime;
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent == null ? null : logContent.trim();
    }
}