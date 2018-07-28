package com.julyseproj.main;

import com.julyseproj.entity.Student;
import com.julyseproj.service.StudentService;

import java.util.List;
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

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void test(int page, int limit, HttpServletResponse res){
        es.getAllStudentJson(page,limit,res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void getByPrimaryKeyJson(int studentid, HttpServletResponse res){
        es.getStudentByPrimaryKeyJson(studentid, res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void deleteByPrimaryKey(int studentid, HttpServletResponse res){
        es.deletetStudentByPrimaryKey(studentid, res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void insert(Student student, HttpServletResponse res){
        es.insertStudent(student, res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void insertSelective(Student student, HttpServletResponse res){
        es.insertSelectiveStudent(student, res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void updateSelective(Student student, HttpServletResponse res){
        es.updateStudentByPrimaryKeySelective(student, res);
        return;
    }

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void update(Student student, HttpServletResponse res){
        es.updateStudentByPrimaryKey(student, res);
        return;
    }

}
