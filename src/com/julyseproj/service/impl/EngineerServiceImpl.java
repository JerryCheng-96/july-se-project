package com.julyseproj.service.impl;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;
import com.julyseproj.IDao.EngineerMapper;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

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
        List<Engineer> allEnginner = getAllEngineer();
        response.count = allEnginner.size();
        response.data = allEnginner.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
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
    public void insertEngineerByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Engineer toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Engineer.class);
            em.insert(toInsert);
        }catch (IOException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return;
        }catch (DuplicateKeyException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    @Override
    public void updateEngineerByInstance(HttpServletRequest req, HttpServletResponse res) {

    }

    private class EngineerListJson{
        int code;
        String msg;
        int count;
        List<Engineer> data;
    }
}
