package com.julyseproj.service.impl;

import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Class;
import com.julyseproj.service.ClassService;
import com.julyseproj.IDao.ClassMapper;

import javax.annotation.Resource;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("classService")
public class ClassServiceImpl implements ClassService{
    @Resource
    private ClassMapper em;

    @Override
    public List<Class> getAllClass() {
        return em.selectAll();
    }

    @Override
    public String getAllClassJson(int page, int maxrow, HttpServletResponse res) {
        res.setContentType("text/html;charset=UTF-8");
        ClassListJson response = new ClassListJson();
        response.code=0;
        response.msg="";
        List<Class> allClass = getAllClass();
        response.count = allClass.size();
        response.data = allClass.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return responseJson;
    }

    @Override
    public Class getClassByPrimaryKey(int clid){
        return em.selectByPrimaryKey(clid);
    }

    @Override
    public String getClassByPrimaryKeyJson(int clid, HttpServletResponse res){
        ClassListJson response = new ClassListJson();
        response.code=0;
        response.msg="";
        Class selectedcl = getClassByPrimaryKey(clid);
        List<Class> OutList = new ArrayList<Class>();
        OutList.add(selectedcl);
        response.data = OutList;
        response.count=1;
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return responseJson;
    }

    @Override
    public Class deletetClassByPrimaryKey(int clid, HttpServletResponse res){
        Class selectedcl = getClassByPrimaryKey(clid);
        em.deleteByPrimaryKey(clid);
        return selectedcl;
    }

    @Override
    public Class insertClass(Class cl,  HttpServletResponse res){
        em.insert(cl);
        return cl;
    }

    @Override
    public Class insertSelectiveClass(Class cl,  HttpServletResponse res){
        em.insertSelective(cl);
        return cl;
    }

    @Override
    public Class updateClassByPrimaryKeySelective(Class cl,  HttpServletResponse res){
        em.updateByPrimaryKeySelective(cl);
        return cl;
    }

    @Override
    public Class updateClassByPrimaryKey(Class cl,  HttpServletResponse res){
        em.updateByPrimaryKey(cl);
        return cl;
    }

    private class ClassListJson{
        int code;
        String msg;
        int count;
        List<Class> data;
    }
}
