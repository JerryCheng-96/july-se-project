package com.julyseproj.service.impl;

import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Program;
import com.julyseproj.service.ProgramService;
import com.julyseproj.IDao.ProgramMapper;
import com.julyseproj.utils.ListSorter;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("programService")
public class ProgramServiceImpl implements ProgramService{
    @Resource
    private ProgramMapper em;

    @Override
    public List<Program> getAllProgram() {
        return em.selectAll();
    }

    @Override
    public String getAllProgramJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        ProgramListJson response = new ProgramListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Program> allProgram = getAllProgram();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allProgram, isAsc, fieldName);
        }
        response.count = allProgram.size();
        response.data = allProgram.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public List<Program> getByAuthor(int engineerID) {
        return em.selectByAuthor(engineerID);
    }

    @Override
    public String getByAuthorJson(int engineerID, HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        ProgramListJson response = new ProgramListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Program> selectedProgram = getByAuthor(engineerID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(selectedProgram, isAsc, fieldName);
        }
        response.count = selectedProgram.size();
        response.data = selectedProgram.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getProgramByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Program response = em.selectByPrimaryKey(ID);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return "";
        }
        return responseJson;
    }

    @Override
    public void insertProgramByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Program toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Program.class);
            em.insert(toInsert);
        }catch (IOException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return;
        }catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    @Override
    public void updateProgramByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Program toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Program.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (IOException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            res.setStatus(500);
            return;
        }catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteProgramByInstance(int ID,HttpServletResponse res){
        try {
            em.deleteByPrimaryKey(ID);
        } catch (DataIntegrityViolationException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            //Throwable cause = e.getCause();
            res.setStatus(148);
            return;
        }
        res.setStatus(200);
        return;
    }

    private class ProgramListJson{
        int code;
        String msg;
        int count;
        List<Program> data;
    }
}
