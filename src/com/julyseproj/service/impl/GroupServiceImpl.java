package com.julyseproj.service.impl;

import com.julyseproj.entity.view.GroupWithProject;
import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Group;
import com.julyseproj.service.GroupService;
import com.julyseproj.IDao.GroupMapper;
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

@Service("groupService")
public class GroupServiceImpl implements GroupService{
    @Resource
    private GroupMapper em;

    @Override
    public List<Group> getAllGroup() {
        return em.selectAll();
    }

    /*
    @Override
    public String getAllGroupJson(int page, int maxrow, HttpServletResponse res) {
        res.setContentType("text/html;charset=UTF-8");
        GroupListJson response = new GroupListJson();
        response.code=0;
        response.msg="";
        List<Group> allGroup = getAllGroup();
        response.count = allGroup.size();
        response.data = allGroup.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
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
    public String getAllGroupJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        GroupListJson response = new GroupListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Group> allGroup = getAllGroup();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allGroup, isAsc, fieldName);
        }
        response.count = allGroup.size();
        response.data = allGroup.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getGroupByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Group response = em.selectByPrimaryKey(ID);
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
    public void insertGroupByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Group toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Group.class);
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
    public void updateGroupByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Group toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Group.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (Exception e) {
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteGroupByInstance(int ID,HttpServletResponse res){
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

    @Override
    public void getGroupByClass(int classID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        GroupListJson response = new GroupListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Group> allGroup = em.selectByClass(classID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allGroup, isAsc, fieldName);
        }
        response.count = allGroup.size();
        response.data = allGroup.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
    }

    @Override
    public void getGroupByProject(int projectID, HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        GroupListJson response = new GroupListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Group> allGroup = em.selectByProject(projectID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allGroup, isAsc, fieldName);
        }
        response.count = allGroup.size();
        response.data = allGroup.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
    }

    @Override
    public void getGroupByProjectWithName(int projectID, HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        GroupListJsonWithProject response = new GroupListJsonWithProject();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<GroupWithProject> allGroup = em.selectByProjectWithName(projectID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allGroup, isAsc, fieldName);
        }
        response.count = allGroup.size();
        response.data = allGroup.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
    }

    private class GroupListJson{
        int code;
        String msg;
        int count;
        List<Group> data;
    }

    private class GroupListJsonWithProject{
        int code;
        String msg;
        int count;
        List<GroupWithProject> data;
    }
}
