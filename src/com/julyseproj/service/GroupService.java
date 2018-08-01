package com.julyseproj.service;

import com.julyseproj.entity.Group;
import sun.awt.HeadlessToolkit;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface GroupService {
    public List<Group> getAllGroup();
    public String getAllGroupJson(HttpServletRequest req, HttpServletResponse res);
    //public String getAllGroupJsonSortedByField(int page, int maxrow, String fieldName, boolean isAsc,HttpServletResponse res);
    public String getGroupByInstance(int ID,HttpServletResponse res);
    public void updateGroupByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertGroupByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteGroupByInstance(int ID,HttpServletResponse res);
    public void getGroupByClass(int classID, HttpServletRequest req, HttpServletResponse res);
    public void getGroupByProject(int projectID, HttpServletRequest req, HttpServletResponse res);
}
