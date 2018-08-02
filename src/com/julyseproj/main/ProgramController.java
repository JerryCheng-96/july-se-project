package com.julyseproj.main;

import com.julyseproj.entity.Program;
import com.julyseproj.service.ProgramService;

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
public class ProgramController {
    @Resource(name = "programService")
    private ProgramService es;

    @RequestMapping(value = "/manage/program/data",method = RequestMethod.GET)
    public void getAllProgramHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllProgramJson(req,res);
    }

    @RequestMapping(value = "/manage/program/moreData",method = RequestMethod.GET)
    public void getAllProgramWithAuthorHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllProgramJsonWithAuthor(req,res);
        return;
    }

    /*
    public void getAllProgramHandler(int page, int limit, HttpServletResponse res){
        es.getAllProgramJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/program/getOne",method = RequestMethod.GET)
    public void getProgramByIdHandler(int ID,HttpServletResponse res){
        es.getProgramByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/program/new",method = RequestMethod.POST)
    public void insertProgramByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertProgramByInstance(req,res);
    }

    @RequestMapping(value = "/manage/program/update",method = RequestMethod.POST)
    public void updateProgramByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateProgramByInstance(req,res);
    }

    @RequestMapping(value = "/manage/program/delete",method = RequestMethod.GET)
    public void deleteProgramByIdHandler(int ID,HttpServletResponse res){
        es.deleteProgramByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/getProgram",method = RequestMethod.GET)
    public void getByAuthorHandler(int engineerID,HttpServletRequest req,HttpServletResponse res){
        es.getByAuthorJson(engineerID,req,res);
    }
}
