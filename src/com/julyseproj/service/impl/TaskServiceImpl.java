package com.julyseproj.service.impl;

import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Task;
import com.julyseproj.service.TaskService;
import com.julyseproj.IDao.TaskMapper;
import com.julyseproj.utils.ListSorter;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("taskService")
public class TaskServiceImpl implements TaskService{
    @Resource
    private TaskMapper em;

    @Override
    public List<Task> getAllTask() {
        return em.selectAll();
    }

    @Override
    public String getAllTaskJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        TaskListJson response = new TaskListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Task> allTask = getAllTask();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allTask, isAsc, fieldName);
        }
        response.count = allTask.size();
        response.data = allTask.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public List<Task> getByEngineer(int engineerID) {
        return em.selectByEngineer(engineerID);
    }

    @Override
    public String getByEngineerJson(int engineerID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        TaskListJson response = new TaskListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Task> selectedTask = getByEngineer(engineerID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(selectedTask, isAsc, fieldName);
        }
        response.count = selectedTask.size();
        response.data = selectedTask.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getTaskByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Task response = em.selectByPrimaryKey(ID);
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
    public void insertTaskByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Task toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Task.class);
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
    public void updateTaskByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Task toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Task.class);
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

    public void deleteTaskByInstance(int ID,HttpServletResponse res){
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

    private class TaskListJson{
        int code;
        String msg;
        int count;
        List<Task> data;
    }
}
