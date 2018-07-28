package com.julyseproj.service;

import com.julyseproj.entity.Engineer;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface EngineerService {
    public List<Engineer> getAllEngineer();
    public String getAllEngineerJson(int page, int maxrow, HttpServletResponse res);
    public void updateEngineerByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertEngineerByInstance(HttpServletRequest req,HttpServletResponse res);
}
