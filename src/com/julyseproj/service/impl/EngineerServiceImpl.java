package com.julyseproj.service.impl;

import org.springframework.stereotype.Service;
import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;
import com.julyseproj.IDao.EngineerMapper;

import javax.annotation.Resource;
import java.util.List;
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
    public String getAllEngineerJson(int page, int maxrow) {
        EngineerListJson response = new EngineerListJson();
        response.code=0;
        response.msg="";
        List<Engineer> allEnginner = getAllEngineer();
        response.count = allEnginner.size();
        response.data = allEnginner.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        return responseJson;
    }

    private class EngineerListJson{
        int code;
        String msg;
        int count;
        List<Engineer> data;
    }
}
