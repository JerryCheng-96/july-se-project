package com.julyseproj.service.impl;

import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Project;
import com.julyseproj.service.ProjectService;
import com.julyseproj.IDao.ProjectMapper;
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

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{
    @Resource
    private ProjectMapper em;

    @Override
    public List<Project> getAllProject() {
        return em.selectAll();
    }

    @Override
    public void setApproved(int ID,HttpServletResponse res){
        Byte approved = 1;
        em.setApprovedByID(ID,approved);
    }

    /*
    @Override
    public String getAllProjectJson(int page, int maxrow, HttpServletResponse res) {
        res.setContentType("text/html;charset=UTF-8");
        ProjectListJson response = new ProjectListJson();
        response.code=0;
        response.msg="";
        List<Project> allEnginner = getAllProject();
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
    */

    @Override
    public String getAllProjectJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        ProjectListJson response = new ProjectListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Project> allProject = getAllProject();
        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allProject, isAsc, fieldName);
        }
        response.count = allProject.size();
        response.data = allProject.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
        return responseJson;
    }

    @Override
    public List<Project> getByCreator(int engineerID) {
        return em.selectByCreator(engineerID);
    }

    @Override
    public String getByCreatorJson(int engineerID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        ProjectListJson response = new ProjectListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Project> allClass = getByCreator(engineerID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allClass, isAsc, fieldName);
        }
        response.count = allClass.size();
        response.data = allClass.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getProjectByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Project response = em.selectByPrimaryKey(ID);
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
    public void insertProjectByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Project toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Project.class);
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
    public void updateProjectByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Project toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Project.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (Exception e) {
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteProjectByInstance(int ID,HttpServletResponse res){
        try {
            em.deleteByPrimaryKey(ID);
        } catch (DataIntegrityViolationException e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    private class ProjectListJson{
        int code;
        String msg;
        int count;
        List<Project> data;
    }
}
