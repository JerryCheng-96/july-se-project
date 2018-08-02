package com.julyseproj.main;

import com.julyseproj.entity.Task;
import com.julyseproj.service.TaskService;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class TaskController {
    @Resource(name = "taskService")
    private TaskService es;

    @RequestMapping(value = "/manage/task/data",method = RequestMethod.GET)
    public void getAllTaskHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllTaskJson(req,res);
    }

    /*
    public void getAllTaskHandler(int page, int limit, HttpServletResponse res){
        es.getAllTaskJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/task/getOne",method = RequestMethod.GET)
    public void getTaskByIdHandler(int ID,HttpServletResponse res){
        es.getTaskByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/task/new",method = RequestMethod.POST)
    public void insertTaskByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertTaskByInstance(req,res);
    }

    @RequestMapping(value = "/manage/task/update",method = RequestMethod.POST)
    public void updateTaskByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateTaskByInstance(req,res);
    }

    @RequestMapping(value = "/manage/task/delete",method = RequestMethod.GET)
    public void deleteTaskByIdHandler(int ID,HttpServletResponse res){
        es.deleteTaskByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/getTask",method = RequestMethod.GET)
    public void getByEngineerHandler(int engineerID,HttpServletRequest req,HttpServletResponse res){
        es.getByEngineerJson(engineerID,req,res);
    }
}
