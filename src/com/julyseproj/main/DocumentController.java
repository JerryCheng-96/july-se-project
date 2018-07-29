package com.julyseproj.main;

import com.julyseproj.entity.Document;
import com.julyseproj.entity.DocumentKey;
import com.julyseproj.service.DocumentService;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
public class DocumentController {
    @Resource(name = "documentService")
    private DocumentService es;

    @RequestMapping(value = "/document",method = RequestMethod.GET)
    public ModelAndView getAll(){
        ModelAndView mnv = new ModelAndView();
        List<Document> allDocuments = es.getAllDocument();
        System.out.println(allDocuments.iterator().next().getDocName());
        mnv.addObject("documents",allDocuments);
        mnv.setViewName("allDocuments");
        return mnv;
    }

    @RequestMapping(value = "/manage/document/data",method = RequestMethod.GET)
    public void getAllDocumentHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllDocumentJson(req,res);
        return;
    }

    @RequestMapping(value = "/manage/document/getOne",method = RequestMethod.GET)
    public void getDocumentByIdHandler(DocumentKey dk, HttpServletResponse res){
        es.getDocumentByInstance(dk,res);
    }

    @RequestMapping(value = "/manage/document/new",method = RequestMethod.POST)
    public void insertDocumentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertDocumentByInstance(req,res);
    }

    @RequestMapping(value = "/manage/document/delete",method = RequestMethod.GET)
    public void deleteDocumentByIdHandler(DocumentKey dk,HttpServletResponse res){
        es.deleteDocumentByInstance(dk,res);
    }
}
