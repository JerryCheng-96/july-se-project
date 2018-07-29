package com.julyseproj.main;

import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;

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
public class EngineerController {
    @Resource(name = "engineerService")
    private EngineerService es;

    @RequestMapping(value = "/engineer",method = RequestMethod.GET)
    public ModelAndView getAll(){
        ModelAndView mnv = new ModelAndView();
        List<Engineer> allEngineers = es.getAllEngineer();
        System.out.println(allEngineers.iterator().next().getEngineerName());
        mnv.addObject("engineers",allEngineers);
        mnv.setViewName("allEngineers");
        return mnv;
    }

    @RequestMapping(value = "/manage/engineer/data",method = RequestMethod.GET)
    public void getAllEngineerHandler(int page, int limit, HttpServletResponse res){
        es.getAllEngineerJson(page,limit,res);
        return;
    }

    @RequestMapping(value = "/manage/engineer/getOne",method = RequestMethod.GET)
    public void getEngineerByIdHandler(int ID,HttpServletResponse res){
        es.getEngineerByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/new",method = RequestMethod.POST)
    public void insertEngineerByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertEngineerByInstance(req,res);
    }

    @RequestMapping(value = "/manage/engineer/update",method = RequestMethod.POST)
    public void updateEngineerByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateEngineerByInstance(req,res);
    }

    @RequestMapping(value = "/manage/engineer/delete",method = RequestMethod.GET)
    public void deleteEngineerByIdHandler(int ID,HttpServletResponse res){
        es.deleteEngineerByInstance(ID,res);
    }
}
