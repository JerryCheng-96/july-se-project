package com.julyseproj.service.impl;

import com.julyseproj.entity.Student;
import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.StudentAccount;
import com.julyseproj.service.StudentAccountService;
import com.julyseproj.IDao.StudentAccountMapper;
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

@Service("student_accountService")
public class StudentAccountServiceImpl implements StudentAccountService{
    @Resource
    private StudentAccountMapper em;

    @Override
    public String getByOwner(int studentID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentAccount response = em.selectByOwner(studentID);
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
    public String getStudentAccountByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentAccount response = em.selectByPrimaryKey(ID);
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
    public void insertStudentAccountByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            StudentAccount toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),StudentAccount.class);
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
    public void updateStudentAccountByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            StudentAccount toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),StudentAccount.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (Exception e) {
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteStudentAccountByInstance(int ID,HttpServletResponse res){
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

    private class StudentAccountListJson{
        int code;
        String msg;
        int count;
        List<StudentAccount> data;
    }
}
