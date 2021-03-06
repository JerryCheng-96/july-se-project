package com.julyseproj.main;

import com.julyseproj.entity.Student;
import com.julyseproj.service.StudentService;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.julyseproj.utils.RequestExceptionResolver;
import org.apache.felix.ipojo.transaction.Transactional;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
public class StudentController {
    @Resource(name = "studentService")
    private StudentService es;

    @RequestMapping(value = "/manage/student/data",method = RequestMethod.GET)
    public void getAllStudentHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllStudentJson(req,res);
        return;
    }

    @RequestMapping(value = "/manage/student/moreData",method = RequestMethod.GET)
    public void getAllStudentWithNameHandler(HttpServletRequest req ,HttpServletResponse res){
        es.getAllStudentJsonWithName(req,res);
        return;
    }

    @RequestMapping(value = "/manage/student/getOne",method = RequestMethod.GET)
    public void getStudentByIdHandler(int ID,HttpServletResponse res){
        es.getStudentByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/student/new",method = RequestMethod.POST)
    public void insertStudentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.insertStudentByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student/update",method = RequestMethod.POST)
    public void updateStudentByInstanceHandler(HttpServletRequest req,HttpServletResponse res){
        es.updateStudentByInstance(req,res);
    }

    @RequestMapping(value = "/manage/student/import",method = RequestMethod.GET)
    public String importStudentHandler(){
        return "testimport";
    }
    @RequestMapping(value = "/manage/student/doImport",method = RequestMethod.POST)
    public void doImportStudentHandler(@RequestParam MultipartFile file, HttpServletRequest req, HttpServletResponse res)throws Exception{
        if(file.isEmpty()){
            res.setStatus(400);
            return;
        }else {
            String realRootPath = req.getSession().getServletContext().getRealPath("/cache");
            System.out.println(realRootPath);
            String fileName = file.getOriginalFilename();
            File f = new File(realRootPath, fileName);
            try {
                if (!f.exists()) {
                    f.mkdirs();
                }
                file.transferTo(f);
                es.importStudentByXlsx(f, req, res);
            }catch (Exception e){
                e.printStackTrace();
                RequestExceptionResolver.handle(e,res);
                if(f.exists()&&f.isFile()) {
                    f.delete();
                }
                throw e;
            }
        }
    }

    @RequestMapping(value = "/manage/student/delete",method = RequestMethod.GET)
    public void deleteStudentByIdHandler(int ID,HttpServletResponse res){
        es.deleteStudentByInstance(ID,res);
    }

    @RequestMapping(value = "/manage/class/getStudent",method = RequestMethod.GET)
    public void getStudentByClassHandler(Integer classID,HttpServletRequest req,HttpServletResponse res){
        es.getStudentByClass(classID, req, res);
    }

    @RequestMapping(value = "/manage/group/getStudent",method = RequestMethod.GET)
    public void getStudentByGroupHandler(Integer classID, Integer groupID,HttpServletRequest req,HttpServletResponse res){
        es.getStudentByGroup(classID,groupID, req, res);
    }
}
