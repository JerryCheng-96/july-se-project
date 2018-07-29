package com.julyseproj.service.impl;

import com.julyseproj.entity.DocumentKey;
import com.mysql.jdbc.MysqlDataTruncation;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Service;
import com.julyseproj.entity.Document;
import com.julyseproj.service.DocumentService;
import com.julyseproj.IDao.DocumentMapper;
import com.julyseproj.utils.ListSorter;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import com.google.gson.Gson;

@Service("documentService")
public class DocumentServiceImpl implements DocumentService{
    @Resource
    private DocumentMapper em;

    @Override
    public List<Document> getAllDocument() {
        return em.selectAll();
    }

    @Override
    public String getAllDocumentJson(HttpServletRequest req,HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        DocumentListJson response = new DocumentListJson();
        response.code=0;
        response.msg="";

        int page = new Integer(req.getParameter("page"));
        int limit = new Integer(req.getParameter("limit"));
        String fieldName = req.getParameter("field");

        List<Document> allDocument = getAllDocument();

        if (fieldName!=null) {
            boolean isAsc = new Boolean(req.getParameter("isAsc"));
            ListSorter.sort(allDocument, isAsc, fieldName);
        }
        response.count = allDocument.size();
        response.data = allDocument.subList((page-1)*limit,(page*limit)<response.count?page*limit:response.count);
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
    public String getDocumentByInstance(DocumentKey dk, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        Document response = em.selectByPrimaryKey(dk);
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
    public void insertDocumentByInstance(HttpServletRequest req, HttpServletResponse res) {
        try {
            Gson gson = new Gson();
            String requestContent = req.getReader().readLine();
            Document toInsert = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Document.class);
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

    public void deleteDocumentByInstance(DocumentKey dk,HttpServletResponse res){
        try {
            em.deleteByPrimaryKey(dk);
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

    private class DocumentListJson{
        int code;
        String msg;
        int count;
        List<Document> data;
    }
}