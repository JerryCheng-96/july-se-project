package com.julyseproj.service;

import com.julyseproj.entity.EngineerAccount;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface EngineerAccountService {
    public String getByOwner(int engineerID,HttpServletResponse res);
    public String getEngineerAccountByInstance(int ID,HttpServletResponse res);
    public void updateEngineerAccountByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertEngineerAccountByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteEngineerAccountByInstance(int ID,HttpServletResponse res);
}