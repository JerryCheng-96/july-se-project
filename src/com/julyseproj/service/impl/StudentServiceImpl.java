package com.julyseproj.service.impl;

import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Student;
import com.julyseproj.service.StudentService;
import com.julyseproj.IDao.StudentMapper;

import javax.annotation.Resource;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("studentService")
public class StudentServiceImpl implements StudentService{
    @Resource
    private StudentMapper em;

    @Override
    public List<Student> getAllStudent() {
        return em.selectAll();
    }

    @Override
    public String getAllStudentJson(int page, int maxrow, HttpServletResponse res) {
        res.setContentType("text/html;charset=UTF-8");
        StudentListJson response = new StudentListJson();
        response.code=0;
        response.msg="";
        List<Student> allStudent = getAllStudent();
        response.count = allStudent.size();
        response.data = allStudent.subList((page-1)*maxrow,(page*maxrow)<response.count?page*maxrow:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return responseJson;
    }

    @Override
    public Student getStudentByPrimaryKey(int studentid){
        return em.selectByPrimaryKey(studentid);
    }

    @Override
    public String getStudentByPrimaryKeyJson(int studentid, HttpServletResponse res){
        StudentListJson response = new StudentListJson();
        response.code=0;
        response.msg="";
        Student selectedstudent = getStudentByPrimaryKey(studentid);
        List<Student> OutList = new ArrayList<Student>();
        OutList.add(selectedstudent);
        response.data = OutList;
        response.count=1;
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return responseJson;
    }

    @Override
    public Student deletetStudentByPrimaryKey(int studentid, HttpServletResponse res){
        Student selectedstudent = getStudentByPrimaryKey(studentid);
        em.deleteByPrimaryKey(studentid);
        return selectedstudent;
    }

    @Override
    public Student insertStudent(Student student,  HttpServletResponse res){
        em.insert(student);
        return student;
    }

    @Override
    public Student insertSelectiveStudent(Student student,  HttpServletResponse res){
        em.insertSelective(student);
        return student;
    }

    @Override
    public Student updateStudentByPrimaryKeySelective(Student student,  HttpServletResponse res){
        em.updateByPrimaryKeySelective(student);
        return student;
    }

    @Override
    public Student updateStudentByPrimaryKey(Student student,  HttpServletResponse res){
        em.updateByPrimaryKey(student);
        return student;
    }

    private class StudentListJson{
        int code;
        String msg;
        int count;
        List<Student> data;
    }
}
