package com.julyseproj.main;

import com.julyseproj.entity.Group;
import com.julyseproj.service.GroupService;

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
public class GroupController {
    @Resource(name = "groupService")
    private GroupService es;

//    @RequestMapping(value = "/Group",method = RequestMethod.GET)
//    public ModelAndView getAll(){
//        ModelAndView mnv = new ModelAndView();
//        List<Group> allGroups = es.getAllGroup();
//        System.out.println(allGroups.iterator().next().getGroupName());
//        mnv.addObject("Groups",allGroups);
//        mnv.setViewName("allGroups");
//        return mnv;
//    }


    @RequestMapping(value = "/manage/group/data",method = RequestMethod.GET)
    public void getAllGroupHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllGroupJson(req,res);
    }

    /*
    public void getAllGroupHandler(int page, int limit, HttpServletResponse res){
        es.getAllGroupJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/group/getOne",method = RequestMethod.GET)
    public void getGroupByIdHandler(int ID,HttpServletResponse res){
        es.getGroupByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/group/new",method = RequestMethod.POST)
    public void insertGroupByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertGroupByInstance(req,res);
    }

    @RequestMapping(value = "/manage/group/update",method = RequestMethod.POST)
    public void updateGroupByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateGroupByInstance(req,res);
    }

    @RequestMapping(value = "/manage/group/delete",method = RequestMethod.GET)
    public void deleteGroupByIdHandler(int ID,HttpServletResponse res){
        es.deleteGroupByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/class/getGroup",method = RequestMethod.GET)
    public void getGroupByClassHandler(int classID, HttpServletRequest req, HttpServletResponse res){
        es.getGroupByClass(classID,req,res);
    }

    @RequestMapping(value = "/manage/project/getGroup",method = RequestMethod.GET)
    public void getGroupByProjectHandler(int projectID, HttpServletRequest req, HttpServletResponse res){
        es.getGroupByProject(projectID,req,res);
    }
}
