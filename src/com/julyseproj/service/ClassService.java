package com.julyseproj.service;

import com.julyseproj.entity.Class;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface ClassService {
    public List<Class> getAllClass();
    public String getAllClassJson(HttpServletRequest req, HttpServletResponse res);
    public List<Class> getByManager(int engineerID);
    public String getByManagerJson(int engineerID, HttpServletRequest req, HttpServletResponse res);
    public List<Class> getByProgram(int programID);
    public String getByProgramJson(int programID,HttpServletRequest req, HttpServletResponse res);
    public String getClassByInstance(int ID,HttpServletResponse res);
    public void updateClassByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertClassByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteClassByInstance(int ID,HttpServletResponse res);
}