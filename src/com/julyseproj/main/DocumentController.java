package com.julyseproj.main;

import com.google.gson.Gson;
import com.julyseproj.entity.Document;
import com.julyseproj.entity.DocumentKey;
import com.julyseproj.service.DocumentService;

import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.julyseproj.utils.RequestExceptionResolver;
import org.apache.commons.io.FileUtils;
import org.apache.felix.ipojo.transaction.Transactional;
import org.omg.CORBA.portable.InputStream;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

//    @RequestMapping(value = "/document",method = RequestMethod.GET)
//    public ModelAndView getAll(){
//        ModelAndView mnv = new ModelAndView();
//        List<Document> allDocuments = es.getAllDocument();
//        System.out.println(allDocuments.iterator().next().getDocName());
//        mnv.addObject("documents",allDocuments);
//        mnv.setViewName("allDocuments");
//        return mnv;
//    }

    @RequestMapping(value = "/manage/document/data",method = RequestMethod.GET)
    public void getAllDocumentHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllDocumentJson(req,res);
        return;
    }

    @RequestMapping(value = "/manage/document/getOne",method = RequestMethod.GET)
    public void getDocumentByIdHandler(String docName, String docUrl, HttpServletResponse res){
        DocumentKey dk = new DocumentKey();
        dk.setDocName(docName);
        dk.setDocUrl(docUrl);
        es.getDocumentByInstance(dk,res);
    }

    @RequestMapping(value = "/manage/document/new",method = RequestMethod.POST)
    public void insertDocumentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertDocumentByInstance(req,res);
    }


    @RequestMapping(value = "/manage/document/upload",method = RequestMethod.GET)
    public String documentListHandler(){
        return "testupload";
    }

    @RequestMapping(value = "/manage/document/doUpload", method = RequestMethod.POST)
    public void doUploadHandler(@RequestParam MultipartFile file,@RequestParam(value = "teamID") Integer teamID, HttpServletRequest req, HttpServletResponse res) throws Exception{
        Gson gson = new Gson();
        String requestContent = req.getReader().readLine();
        Document doc = gson.fromJson(new String(requestContent.getBytes("ISO-8859-1"),"UTF-8"),Document.class);
        DocumentKey dk = new DocumentKey();
        dk.setDocUrl(doc.getDocUrl());
        dk.setDocName(doc.getDocName());
        try {
            //todo
            if(es.getDocumentByInstance(dk)!=null){
                es.updateDocumentByInstance(doc);
            }else {
                es.insertDocumentByInstance(doc);
            }
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
        try {
            if (!file.isEmpty()) {
                String realRootPath = req.getSession().getServletContext().getRealPath("/");
                System.out.println(realRootPath);
                String fileName = file.getOriginalFilename();
                File f = new File(realRootPath + "/docs/" + teamID.toString() + "/", fileName);
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(f);

                res.getWriter().write("{\"status\":\"done\"}");
                res.setStatus(200);
            }
        }catch (Exception e){
            e.printStackTrace();
            es.deleteDocumentByInstance(dk);
            RequestExceptionResolver.handle(e,res);
        }

    }

    @RequestMapping(value = "/manage/document/download", method = RequestMethod.GET)
    public void downloadHandler(String docName, String docUrl, HttpServletRequest req, HttpServletResponse res){
        try {
            String path = req.getSession().getServletContext().getRealPath("/docs/" + docUrl) + "/" + docName;
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
            docName = URLEncoder.encode(docName,"UTF-8");
            res.addHeader("Content-Disposition","attachment;filename="+docName);
            res.setContentType("multipart/form-data");
            BufferedOutputStream down = new BufferedOutputStream(res.getOutputStream());
            int len=0;
            while((len=bis.read())!=-1){
                down.write(len);
                down.flush();
            }
            down.close();
        }catch (IOException e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
        }
    }

    @RequestMapping(value = "/manage/document/delete",method = RequestMethod.GET)
    public void deleteDocumentByIdHandler(String docName, String docUrl, HttpServletRequest req, HttpServletResponse res) throws Exception{
        try {
            DocumentKey dk = new DocumentKey();
            dk.setDocName(docName);
            dk.setDocUrl(docUrl);
            es.deleteDocumentByInstance(dk,res);
        }catch (Exception e){
            e.printStackTrace();
            RequestExceptionResolver.handle(e,res);
            return;
        }
        String realRootPath = req.getSession().getServletContext().getRealPath("/");
        System.out.println(realRootPath);
        File f = new File(realRootPath+"/docs/"+docUrl+"/",docName);
        if(f.exists()&&f.isFile()){
            f.delete();
        }
    }
}
