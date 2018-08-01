package com.julyseproj.service.impl;

import com.julyseproj.entity.view.StudentWithName;
import com.julyseproj.utils.RequestExceptionResolver;
import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Student;
import com.julyseproj.service.StudentService;
import com.julyseproj.IDao.StudentMapper;
import com.julyseproj.utils.ListSorter;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("studentService")
public class StudentServiceImpl implements StudentService{
    @Resource
    private StudentMapper em;

    @Override
    public List<Student> getAllStudent() {
        return em.selectAll();
    }

    @Override
    public String getAllStudentJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentListJson response = new StudentListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Student> allStudent = getAllStudent();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allStudent, isAsc, fieldName);
        }
        response.count = allStudent.size();
        response.data = allStudent.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return "";
        }
        return responseJson;
    }

    @Override
    public String getAllStudentJsonWithName(HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentListJsonWithName response = new StudentListJsonWithName();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<StudentWithName> allStudent = em.selectAllWithName();
        Iterator<StudentWithName> i = allStudent.iterator();
        while(i.hasNext()){
            StudentWithName curr = i.next();
            if (curr.getStudentClass()!=null) {
                curr.setClassName(em.selectClassNameById(curr.getStudentClass()));
            }
            if(curr.getStudentGroup()!=null) {
                curr.setGroupName(em.selectGroupNameById(curr.getStudentGroup()));
            }
        }

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allStudent, isAsc, fieldName);
        }
        response.count = allStudent.size();
        response.data = allStudent.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return "";
        }
        return responseJson;
    }

    @Override
    public String getStudentByInstance(int ID,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Student response = em.selectByPrimaryKey(ID);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return "";
        }
        return responseJson;
    }

    @Override
    public void insertStudentByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Student toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Student.class);
            em.insertSelective(toInsert);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    @Override
    public void updateStudentByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Student toUpdate = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Student.class);
            em.updateByPrimaryKey(toUpdate);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    public void deleteStudentByInstance(int ID,HttpServletResponse res){
        try {
            em.deleteByPrimaryKey(ID);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        res.setStatus(200);
        return;
    }

    @Override
    public void getStudentByClass(Integer classID, HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentListJson response = new StudentListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Student> allStudent = em.selectByClass(classID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allStudent, isAsc, fieldName);
        }
        response.count = allStudent.size();
        response.data = allStudent.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
    }

    @Override
    public void getStudentByGroup(Integer classID,Integer groupID, HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        StudentListJson response = new StudentListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Student> allStudent = em.selectByGroup(classID,groupID);

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allStudent, isAsc, fieldName);
        }
        response.count = allStudent.size();
        response.data = allStudent.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
        Gson gson = new Gson();
        String responseJson = gson.toJson(response);
        System.out.println(responseJson);
        try {
            res.getWriter().write(responseJson);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
    }

    private class StudentListJson{
        int code;
        String msg;
        int count;
        List<Student> data;
    }

    private class StudentListJsonWithName{
        int code;
        String msg;
        int count;
        List<StudentWithName> data;
    }
}
