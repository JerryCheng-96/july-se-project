package com.julyseproj.service;

import com.julyseproj.entity.Task;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface TaskService {
    public List<Task> getAllTask();
    public String getAllTaskJson(HttpServletRequest req, HttpServletResponse res);
    public List<Task> getByEngineer(int engineerID);
    public String getByEngineerJson(int engineerID, HttpServletRequest req, HttpServletResponse res);
    public String getTaskByInstance(int ID,HttpServletResponse res);
    public void updateTaskByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertTaskByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteTaskByInstance(int ID,HttpServletResponse res);
}