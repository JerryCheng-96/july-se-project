package com.julyseproj.service;

import com.julyseproj.entity.Document;
import com.julyseproj.entity.DocumentKey;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

public interface DocumentService {
    public List<Document> getAllDocument();
    public String getAllDocumentJson(HttpServletRequest req, HttpServletResponse res);
    public List<Document> getByUploader(int studentID);
    public String getByUploaderJson(int studentID, HttpServletRequest req, HttpServletResponse res);
    public List<Document> getByGroup(int groupID);
    public String getByGroupJson(int groupID, HttpServletRequest req, HttpServletResponse res);
    //public String getAllDocumentJsonSortedByField(int page, int maxrow, String fieldName, boolean isAsc,HttpServletResponse res);
    public String getDocumentByInstance(DocumentKey dk, HttpServletResponse res);
    public Document getDocumentByInstance(DocumentKey dk);
    public void insertDocumentByInstance(HttpServletRequest req,HttpServletResponse res);
    public void insertDocumentByInstance(Document doc);
    public void updateDocumentByInstance(Document doc);
    public void evaluateDocumentByInstance(String docName,String docUrl,Float docEval,HttpServletResponse res);
    public void deleteDocumentByInstance(DocumentKey dk,HttpServletResponse res);
    public void deleteDocumentByInstance(DocumentKey dk);
}
