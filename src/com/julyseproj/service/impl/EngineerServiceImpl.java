package com.julyseproj.service.impl;

import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;
import com.julyseproj.IDao.EngineerMapper;

import javax.annotation.Resource;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("engineerService")
public class EngineerServiceImpl implements EngineerService{
    @Resource
    private EngineerMapper em;

    @Override
    public List<Engineer> getAllEngineer() {
        return em.selectAll();
    }

    @Override
    public String getAllEngineerJson(int page, int maxrow, HttpServletResponse res) {
        res.setContentType("text/html;charset=UTF-8");
        EngineerListJson response = new EngineerListJson();
        response.code=0;
        response.msg="";
        List<Engineer> allEngineer = getAllEngineer();
        response.count = allEngineer.size();
        response.data = allEngineer.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
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
    public Engineer getEngineerByPrimaryKey(int engineerid){
        return em.selectByPrimaryKey(engineerid);
    }

    @Override
    public String getEngineerByPrimaryKeyJson(int engineerid, HttpServletResponse res){
        EngineerListJson response = new EngineerListJson();
        response.code=0;
        response.msg="";
        Engineer selectedengineer = getEngineerByPrimaryKey(engineerid);
        List<Engineer> OutList = new ArrayList<Engineer>();
        OutList.add(selectedengineer);
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
    public Engineer deletetEngineerByPrimaryKey(int engineerid, HttpServletResponse res){
        Engineer selectedengineer = getEngineerByPrimaryKey(engineerid);
        em.deleteByPrimaryKey(engineerid);
        return selectedengineer;
    }

    @Override
    public Engineer insertEngineer(Engineer engineer,  HttpServletResponse res){
        em.insert(engineer);
        return engineer;
    }

    @Override
    public Engineer insertSelectiveEngineer(Engineer engineer,  HttpServletResponse res){
        em.insertSelective(engineer);
        return engineer;
    }

    @Override
    public Engineer updateEngineerByPrimaryKeySelective(Engineer engineer,  HttpServletResponse res){
        em.updateByPrimaryKeySelective(engineer);
        return engineer;
    }

    @Override
    public Engineer updateEngineerByPrimaryKey(Engineer engineer,  HttpServletResponse res){
        em.updateByPrimaryKey(engineer);
        return engineer;
    }

    private class EngineerListJson{
        int code;
        String msg;
        int count;
        List<Engineer> data;
    }
}
