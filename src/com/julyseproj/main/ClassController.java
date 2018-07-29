package com.julyseproj.main;

import com.julyseproj.entity.Class;
import com.julyseproj.service.ClassService;

import java.util.List;
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
public class ClassController {
    @Resource(name = "clService")
    private ClassService es;

    @RequestMapping(value = "/cl",method = RequestMethod.GET)
    public ModelAndView getAll(){
        ModelAndView mnv = new ModelAndView();
        List<Class> allClasss = es.getAllClass();
        System.out.println(allClasss.iterator().next().getClassName());
        mnv.addObject("cls",allClasss);
        mnv.setViewName("allClasss");
        return mnv;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void test(int page, int limit, HttpServletResponse res){
        es.getAllClassJson(page,limit,res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void getByPrimaryKeyJson(int clid, HttpServletResponse res){
        es.getClassByPrimaryKeyJson(clid, res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void deleteByPrimaryKey(int clid, HttpServletResponse res){
        es.deletetClassByPrimaryKey(clid, res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void insert(Class cl, HttpServletResponse res){
        es.insertClass(cl, res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void insertSelective(Class cl, HttpServletResponse res){
        es.insertSelectiveClass(cl, res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void updateSelective(Class cl, HttpServletResponse res){
        es.updateClassByPrimaryKeySelective(cl, res);
        return;
    }

    @RequestMapping(value = "/manage/class/data",method = RequestMethod.GET)
    public void update(Class cl, HttpServletResponse res){
        es.updateClassByPrimaryKey(cl, res);
        return;
    }

}
