package com.julyseproj.entity;

public class EngineerAccount {
    private Integer accountEId;

    private Integer accountEPassword;

    private Integer accountEOwner;

    private String accountESession;

    public Integer getAccountEId() {
        return accountEId;
    }

    public void setAccountEId(Integer accountEId) {
        this.accountEId = accountEId;
    }

    public Integer getAccountEPassword() {
        return accountEPassword;
    }

    public void setAccountEPassword(Integer accountEPassword) {
        this.accountEPassword = accountEPassword;
    }

    public Integer getAccountEOwner() {
        return accountEOwner;
    }

    public void setAccountEOwner(Integer accountEOwner) {
        this.accountEOwner = accountEOwner;
    }

    public String getAccountESession() {
        return accountESession;
    }

    public void setAccountESession(String accountESession) {
        this.accountESession = accountESession == null ? null : accountESession.trim();
    }
}