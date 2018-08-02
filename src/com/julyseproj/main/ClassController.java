package com.julyseproj.main;

import com.julyseproj.entity.Class;
import com.julyseproj.service.ClassService;

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
public class ClassController {
    @Resource(name = "classService")
    private ClassService es;


    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void getAllClassHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllClassJson(req,res);
        return;
    }

    @RequestMapping(value = "/manage/class/add_student",method = RequestMethod.GET)
    public String addStudentToClass(){
        return "add_student";
    }

    @RequestMapping(value = "/manage/class/moreData",method = RequestMethod.GET)
    public void getAllClassWithNameHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllClassJsonWithName(req,res);
        return;
    }

    @RequestMapping(value = "/manage/class/getOne",method = RequestMethod.GET)
    public void getClassByIdHandler(int ID,HttpServletResponse res){
        es.getClassByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/class/new",method = RequestMethod.POST)
    public void insertClassByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertClassByInstance(req,res);
    }

    @RequestMapping(value = "/manage/class/update",method = RequestMethod.POST)
    public void updateClassByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateClassByInstance(req,res);
    }

    @RequestMapping(value = "/manage/class/delete",method = RequestMethod.GET)
    public void deleteClassByIdHandler(int ID,HttpServletResponse res){
        es.deleteClassByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/getClass",method = RequestMethod.GET)
    public void getByManagerHandler(int engineerID,HttpServletRequest req,HttpServletResponse res){
        es.getByManagerJson(engineerID,req,res);
    }

    @RequestMapping(value = "/manage/program/getClass",method = RequestMethod.GET)
    public void getByProgramHandler(int programID,HttpServletRequest req,HttpServletResponse res){
        es.getByProgramJson(programID,req,res);
    }
}
