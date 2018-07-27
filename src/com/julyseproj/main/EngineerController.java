package com.julyseproj.main;

import com.julyseproj.entity.Engineer;
import com.julyseproj.service.EngineerService;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
public class EngineerController {
    @Resource(name = "engineerService")
    private EngineerService es;

    @RequestMapping(value = "/engineer",method = RequestMethod.GET)
    public ModelAndView getAll(){
        ModelAndView mnv = new ModelAndView();
        List<Engineer> allEngineers = es.getAllEngineer();
        System.out.println(allEngineers.iterator().next().getEngineerName());
        mnv.addObject("engineers",allEngineers);
        mnv.setViewName("allEngineers");
        return mnv;
    }
}
