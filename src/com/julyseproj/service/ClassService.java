package com.julyseproj.service;

import com.julyseproj.entity.Class;
import org.springframework.mock.web.MockHttpServletResponse;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface ClassService {
    public List<Class> getAllClass();
    public String getAllClassJson(int page, int maxrow, HttpServletResponse res);

    public Class getClassByPrimaryKey(int clid);
    public String getClassByPrimaryKeyJson(int clid, HttpServletResponse res);

    public Class deletetClassByPrimaryKey(int clid, HttpServletResponse res);

    public Class insertClass(Class cl,  HttpServletResponse res);

    public Class insertSelectiveClass(Class cl,  HttpServletResponse res);

    public Class updateClassByPrimaryKeySelective(Class cl,  HttpServletResponse res);

    public Class updateClassByPrimaryKey(Class cl,  HttpServletResponse res);


}
