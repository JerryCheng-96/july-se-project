package com.julyseproj.service.impl;

import com.julyseproj.entity.Engineer;
import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.EngineerAccount;
import com.julyseproj.service.EngineerAccountService;
import com.julyseproj.IDao.EngineerAccountMapper;
import com.julyseproj.utils.ListSorter;
import com.julyseproj.utils.RequestExceptionResolver;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("engineer_accountService")
public class EngineerAccountServiceImpl implements EngineerAccountService{
    @Resource
    private EngineerAccountMapper em;

    @Override
    public String getByOwner(int engineerID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        EngineerAccount response = em.selectByOwner(engineerID);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return "";
        }
        return responseJson;
    }

        @Override
        public String getEngineerAccountByInstance(int ID,HttpServletResponse res){
                res.setContentType("text/html;charset=UTF-8");
                EngineerAccount response = em.selectByPrimaryKey(ID);
                Gson gson = new Gson();
                String responseJson = gson.toJson(response);
                System.out.println(responseJson);
                try {
                        res.getWriter().write(responseJson);
                }catch (Exception e){
                        e.printStackTrace();
                        RequestExceptionResolver.handle(e,res);
                        return "";
                }
                return responseJson;
        }
    
@Override
public void insertEngineerAccountByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
        Gson gson = new Gson();
        String requestContent = req.getReader().readLine();
        EngineerAccount toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),EngineerAccount.class);
        em.insert(toInsert);
        }catch (Exception e) {
        e.printStackTrace();
        RequestExceptionResolver.handle(e,res);
        return;
        }
        res.setStatus(200);
        return;
        }

@Override
public void updateEngineerAccountByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
        Gson gson = new Gson();
        String requestContent = req.getReader().readLine();
        EngineerAccount toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),EngineerAccount.class);
        em.updateByPrimaryKey(toUpdate);
        }catch (Exception e) {
        e.printStackTrace();
        RequestExceptionResolver.handle(e,res);
        return;
        }
        res.setStatus(200);
        return;
        }

public void deleteEngineerAccountByInstance(int ID,HttpServletResponse res){
        try {
        em.deleteByPrimaryKey(ID);
        } catch (Exception e){
        e.printStackTrace();
        RequestExceptionResolver.handle(e,res);
        return;
        }
        res.setStatus(200);
        return;
        }

private class EngineerAccountListJson{
    int code;
    String msg;
    int count;
    List<EngineerAccount> data;
}
}
