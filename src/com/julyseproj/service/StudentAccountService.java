package com.julyseproj.service;

import com.julyseproj.entity.StudentAccount;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface StudentAccountService {
    public String getByOwner(int studentID,HttpServletResponse res);
    public String getStudentAccountByInstance(int ID,HttpServletResponse res);
    public void updateStudentAccountByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertStudentAccountByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteStudentAccountByInstance(int ID,HttpServletResponse res);
}