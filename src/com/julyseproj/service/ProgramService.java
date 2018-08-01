package com.julyseproj.service;

import com.julyseproj.entity.Program;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface ProgramService {
    public List<Program> getAllProgram();
    public String getAllProgramJson(HttpServletRequest req, HttpServletResponse res);
    public List<Program> getByAuthor(int engineerID);
    public String getByAuthorJson(int engineerID, HttpServletRequest req, HttpServletResponse res);
    public String getProgramByInstance(int ID,HttpServletResponse res);
    public void updateProgramByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertProgramByInstance(HttpServletRequest req,HttpServletResponse res);
    public void deleteProgramByInstance(int ID,HttpServletResponse res);
}