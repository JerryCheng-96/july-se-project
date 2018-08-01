package com.julyseproj.service;

import com.julyseproj.entity.Engineer;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface EngineerService {
    public List<Engineer> getAllEngineer();
    public String getAllEngineerJson(HttpServletRequest req, HttpServletResponse res);
    //public String getAllEngineerJsonSortedByField(int page, int maxrow, String fieldName, boolean isAsc,HttpServletResponse res);
    public String getEngineerByInstance(int ID,HttpServletResponse res);
    public void updateEngineerByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertEngineerByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteEngineerByInstance(int ID,HttpServletResponse res);
}
