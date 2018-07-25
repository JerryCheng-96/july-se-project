package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {

    @RequestMapping(value = "/manage/student", method = RequestMethod.GET)
    public String student_manage() {
        return "manage_student";
    }

    @RequestMapping(value = "/manage/class", method = RequestMethod.GET)
    public String class_manage() {
        return "manage_class";
    }

    @RequestMapping(value = "/manage/engineer", method = RequestMethod.GET)
    public String engineer_manage() {
        return "manage_engineer";
    }

}
