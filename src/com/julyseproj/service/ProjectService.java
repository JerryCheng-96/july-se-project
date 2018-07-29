package com.julyseproj.service;

import com.julyseproj.entity.Project;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface ProjectService {
    public List<Project> getAllProject();
    public void setApproved(int ID,HttpServletResponse res);
    public String getAllProjectJson(HttpServletRequest req, HttpServletResponse res);
    //public String getAllProjectJsonSortedByField(int page, int maxrow, String fieldName, boolean isAsc,HttpServletResponse res);
    public String getProjectByInstance(int ID,HttpServletResponse res);
    public void updateProjectByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertProjectByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteProjectByInstance(int ID,HttpServletResponse res);
}
