package com.julyseproj.main;

import com.julyseproj.entity.Log;
import com.julyseproj.service.LogService;

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
public class LogController {
    @Resource(name = "logService")
    private LogService es;

    /*
    public void getAllLogHandler(int page, int limit, HttpServletResponse res){
        es.getAllLogJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/log/getOne",method = RequestMethod.GET)
    public void getLogByIdHandler(int ID,HttpServletResponse res){
        es.getLogByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/log/new",method = RequestMethod.POST)
    public void insertLogByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertLogByInstance(req,res);
    }

    @RequestMapping(value = "/manage/log/update",method = RequestMethod.POST)
    public void updateLogByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateLogByInstance(req,res);
    }

    @RequestMapping(value = "/manage/log/delete",method = RequestMethod.GET)
    public void deleteLogByIdHandler(int ID,HttpServletResponse res){
        es.deleteLogByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/student/log",method = RequestMethod.GET)
    public void getByUploaderHandler(int studentID,HttpServletRequest req,HttpServletResponse res){
        es.getByUploaderJson(studentID,req,res);
    }

    @RequestMapping(value = "/manage/group/log",method = RequestMethod.GET)
    public void getByGroupHandler(int groupID,HttpServletRequest req,HttpServletResponse res){
        es.getByGroupJson(groupID,req,res);
    }

    @RequestMapping(value = "/manage/log/data",method = RequestMethod.GET)
    public void getAllLogHandler(HttpServletRequest req,HttpServletResponse res){
        es.getAllLogJson(req,res);
    }
}
