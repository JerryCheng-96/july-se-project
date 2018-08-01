package com.julyseproj.service;

import com.julyseproj.entity.Student;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface StudentService {
    public List<Student> getAllStudent();
    public String getAllStudentJson(HttpServletRequest req, HttpServletResponse res);
    public String getStudentByInstance(int ID,HttpServletResponse res);
    public void updateStudentByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertStudentByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteStudentByInstance(int ID,HttpServletResponse res);
    public void getStudentByClass(Integer classID, HttpServletRequest req, HttpServletResponse res);
    public void getStudentByGroup(Integer classID,Integer groupID, HttpServletRequest req, HttpServletResponse res);
}