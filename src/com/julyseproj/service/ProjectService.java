package com.julyseproj.service;

import com.julyseproj.entity.Engineer;
import com.julyseproj.entity.Project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ProjectService {
    public List<Project> getAllProject();
    public String getAllProjectJson(HttpServletRequest req, HttpServletResponse res);
    //public String getAllProjectJsonSortedByField(int page, int maxrow, String fieldName, boolean isAsc,HttpServletResponse res);
    public String getProjectByInstance(int ID,HttpServletResponse res);
    public void updateProjectByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertProjectByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteProjectByInstance(int ID,HttpServletResponse res);
}
