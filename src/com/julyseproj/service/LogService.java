package com.julyseproj.service;

import com.julyseproj.entity.Log;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface LogService {
    public List<Log> getAllLog();

    public String getAllLogJson(HttpServletRequest req, HttpServletResponse res);

    public List<Log> getByUploader(int studentID);

    public String getByUploaderJson(int studentID, HttpServletRequest req, HttpServletResponse res);

    public List<Log> getByGroup(int groupID);

    public String getByGroupJson(int groupID, HttpServletRequest req, HttpServletResponse res);

    public String getLogByInstance(int ID,HttpServletResponse res);

    public void updateLogByInstance(HttpServletRequest req,HttpServletResponse res);
    
    public void insertLogByInstance(HttpServletRequest req,HttpServletResponse res);
    
    public void deleteLogByInstance(int ID,HttpServletResponse res);
}