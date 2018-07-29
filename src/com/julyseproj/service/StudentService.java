package com.julyseproj.service;

import com.julyseproj.entity.Student;
import org.springframework.mock.web.MockHttpServletResponse;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface StudentService {
    public List<Student> getAllStudent();
    public String getAllStudentJson(int page, int maxrow, HttpServletResponse res);

    public Student getStudentByPrimaryKey(int studentid);
    public String getStudentByPrimaryKeyJson(int studentid, HttpServletResponse res);

    public Student deletetStudentByPrimaryKey(int studentid, HttpServletResponse res);

    public Student insertStudent(Student student,  HttpServletResponse res);

    public Student insertSelectiveStudent(Student student,  HttpServletResponse res);

    public Student updateStudentByPrimaryKeySelective(Student student,  HttpServletResponse res);

    public Student updateStudentByPrimaryKey(Student student,  HttpServletResponse res);


}