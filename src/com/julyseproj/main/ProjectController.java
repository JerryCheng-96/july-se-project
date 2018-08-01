package com.julyseproj.main;

import com.julyseproj.entity.Project;
import com.julyseproj.service.ProjectService;

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
public class ProjectController {
    @Resource(name = "projectService")
    private ProjectService es;

    @RequestMapping(value = "/manage/project/data",method = RequestMethod.POST)
    public void getAllProjectHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllProjectJson(req,res);
    }

    @RequestMapping(value = "/manage/project/approve",method = RequestMethod.GET)
    public void setApprovedByIDHandler(int ID, HttpServletResponse res){
        es.setApproved(ID,res);
    }

    /*
    public void getAllProjectHandler(int page, int limit, HttpServletResponse res){
        es.getAllProjectJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/project/getOne",method = RequestMethod.GET)
    public void getProjectByIdHandler(int ID,HttpServletResponse res){
        es.getProjectByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/project/new",method = RequestMethod.GET)
    public void insertProjectByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertProjectByInstance(req,res);
    }

    @RequestMapping(value = "/manage/project/update",method = RequestMethod.GET)
    public void updateProjectByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateProjectByInstance(req,res);
    }

    @RequestMapping(value = "/manage/project/delete",method = RequestMethod.GET)
    public void deleteProjectByIdHandler(int ID,HttpServletResponse res){
        es.deleteProjectByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/project",method = RequestMethod.POST)
    public void getByCreatorHandler(int engineerID,HttpServletRequest req,HttpServletResponse res){
        es.getByCreatorJson(engineerID,req,res);
    }
}
