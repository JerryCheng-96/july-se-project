package com.julyseproj.main;

import com.julyseproj.entity.Student;
import com.julyseproj.service.StudentService;

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
public class StudentController {
    @Resource(name = "studentService")
    private StudentService es;

    @RequestMapping(value = "/student",method = RequestMethod.GET)
    public ModelAndView getAll(){
        ModelAndView mnv = new ModelAndView();
        List<Student> allStudents = es.getAllStudent();
        System.out.println(allStudents.iterator().next().getStudentName());
        mnv.addObject("students",allStudents);
        mnv.setViewName("allStudents");
        return mnv;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.POST)
    public void getAllStudentHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllStudentJson(req,res);
        return;
    }

    @RequestMapping(value = "/manage/student/getOne",method = RequestMethod.GET)
    public void getStudentByIdHandler(int ID,HttpServletResponse res){
        es.getStudentByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/student/new",method = RequestMethod.GET)
    public void insertStudentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertStudentByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student/update",method = RequestMethod.GET)
    public void updateStudentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateStudentByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student/delete",method = RequestMethod.GET)
    public void deleteStudentByIdHandler(int ID,HttpServletResponse res){
        es.deleteStudentByInstance(ID,res);
    }
}
