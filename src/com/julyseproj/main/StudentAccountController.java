package com.julyseproj.main;

import com.julyseproj.entity.StudentAccount;
import com.julyseproj.service.StudentAccountService;

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
public class StudentAccountController {
    @Resource(name = "student_accountService")
    private StudentAccountService es;

    /*
    public void getAllStudentAccountHandler(int page, int limit, HttpServletResponse res){
        es.getAllStudentAccountJson(page,limit,res);
        return;
    }
    */

    @RequestMapping(value = "/manage/student_account/getOne",method = RequestMethod.GET)
    public void getStudentAccountByIdHandler(int ID,HttpServletResponse res){
        es.getStudentAccountByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/student_account/new",method = RequestMethod.POST)
    public void insertStudentAccountByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertStudentAccountByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student_account/update",method = RequestMethod.POST)
    public void updateStudentAccountByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateStudentAccountByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student_account/delete",method = RequestMethod.GET)
    public void deleteStudentAccountByIdHandler(int ID,HttpServletResponse res){
        es.deleteStudentAccountByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/student/student_account",method = RequestMethod.GET)
    public void getByOwnerHandler(int studentID,HttpServletResponse res){
        es.getByOwner(studentID,res);
    }
}
