package com.julyseproj.entity;

public class StudentAccount {
    private Integer accountSId;

    private Integer accountSPassword;

    private Integer accountSOwner;

    private String accountSSession;

    public Integer getAccountSId() {
        return accountSId;
    }

    public void setAccountSId(Integer accountSId) {
        this.accountSId = accountSId;
    }

    public Integer getAccountSPassword() {
        return accountSPassword;
    }

    public void setAccountSPassword(Integer accountSPassword) {
        this.accountSPassword = accountSPassword;
    }

    public Integer getAccountSOwner() {
        return accountSOwner;
    }

    public void setAccountSOwner(Integer accountSOwner) {
        this.accountSOwner = accountSOwner;
    }

    public String getAccountSSession() {
        return accountSSession;
    }

    public void setAccountSSession(String accountSSession) {
        this.accountSSession = accountSSession == null ? null : accountSSession.trim();
    }
}