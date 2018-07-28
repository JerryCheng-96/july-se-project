package com.julyseproj.service.impl;

import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;
import com.julyseproj.IDao.EngineerMapper;

import javax.annotation.Resource;
import java.util.List;
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

    private class EngineerListJson{
        int code;
        String msg;
        int count;
        List<Engineer> data;
    }
}
