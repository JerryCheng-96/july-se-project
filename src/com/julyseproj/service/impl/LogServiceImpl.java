package com.julyseproj.service.impl;

import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Log;
import com.julyseproj.service.LogService;
import com.julyseproj.IDao.LogMapper;
import com.julyseproj.utils.ListSorter;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("logService")
public class LogServiceImpl implements LogService{
    @Resource
    private LogMapper em;

    @Override
    public List<Log> getAllLog() {
        return em.selectAll();
    }

    @Override
    public String getAllLogJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        LogListJson response = new LogListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Log> allLog = getAllLog();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allLog, isAsc, fieldName);
        }
        response.count = allLog.size();
        response.data = allLog.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public List<Log> getByUploader(int studentID) {
        return em.selectByUploader(studentID);
    }

    @Override
    public String getByUploaderJson(int studentID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        LogListJson response = new LogListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Log> selectedLog = getByUploader(studentID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(selectedLog, isAsc, fieldName);
        }
        response.count = selectedLog.size();
        response.data = selectedLog.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public List<Log> getByGroup(int engineerID) {
        return em.selectByGroup(engineerID);
    }

    @Override
    public String getByGroupJson(int studentID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        LogListJson response = new LogListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Log> selectedLog = getByGroup(studentID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(selectedLog, isAsc, fieldName);
        }
        response.count = selectedLog.size();
        response.data = selectedLog.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getLogByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Log response = em.selectByPrimaryKey(ID);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return "";
        }
        return responseJson;
    }

    @Override
    public void insertLogByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Log toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Log.class);
            em.insert(toInsert);
        }catch (IOException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return;
        }catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    @Override
    public void updateLogByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Log toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Log.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (IOException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return;
        }catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteLogByInstance(int ID,HttpServletResponse res){
        try {
            em.deleteByPrimaryKey(ID);
        } catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    private class LogListJson{
        int code;
        String msg;
        int count;
        List<Log> data;
    }
}
