package com.julyseproj.service;

import com.julyseproj.entity.Engineer;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface EngineerService {
    public List<Engineer> getAllEngineer();
    public String getAllEngineerJson(int page, int maxrow, HttpServletResponse res);

    public Engineer getEngineerByPrimaryKey(int engineerid);
    public String getEngineerByPrimaryKeyJson(int engineerid, HttpServletResponse res);

    public Engineer deletetEngineerByPrimaryKey(int engineerid, HttpServletResponse res);

    public Engineer insertEngineer(Engineer engineer,  HttpServletResponse res);

    public Engineer insertSelectiveEngineer(Engineer engineer,  HttpServletResponse res);

    public Engineer updateEngineerByPrimaryKeySelective(Engineer engineer,  HttpServletResponse res);

    public Engineer updateEngineerByPrimaryKey(Engineer engineer,  HttpServletResponse res);


}
