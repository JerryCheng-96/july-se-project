package com.julyseproj.main;

import com.julyseproj.entity.EngineerAccount;
import com.julyseproj.service.EngineerAccountService;

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
public class EngineerAccountController {
    @Resource(name = "engineer_accountService")
    private EngineerAccountService es;

    /*
    public void getAllEngineerAccountHandler(int page, int limit, HttpServletResponse res){
        es.getAllEngineerAccountJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/engineer_account/getOne",method = RequestMethod.GET)
    public void getEngineerAccountByIdHandler(int ID,HttpServletResponse res){
        es.getEngineerAccountByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer_account/new",method = RequestMethod.POST)
    public void insertEngineerAccountByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertEngineerAccountByInstance(req,res);
    }

    @RequestMapping(value = "/manage/engineer_account/update",method = RequestMethod.POST)
    public void updateEngineerAccountByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateEngineerAccountByInstance(req,res);
    }

    @RequestMapping(value = "/manage/engineer_account/delete",method = RequestMethod.GET)
    public void deleteEngineerAccountByIdHandler(int ID,HttpServletResponse res){
        es.deleteEngineerAccountByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/engineer/engineer_account",method = RequestMethod.GET)
    public void getByOwnerHandler(int engineerID,HttpServletResponse res){
        es.getByOwner(engineerID,res);
    }
}
