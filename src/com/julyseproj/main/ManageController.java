package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageController {

    @RequestMapping(value = "/manage/student", method = RequestMethod.GET)
    public String student_manage() {
        return "list_student";
    }

    @RequestMapping(value = "/manage/class", method = RequestMethod.GET)
    public String class_manage() {
        return "list_class";
    }

    @RequestMapping(value = "/manage/engineer", method = RequestMethod.GET)
    public String engineer_manage() {
        return "list_engineer";
    }

    @RequestMapping(value = "/manage/project", method = RequestMethod.GET)
    public String project_manage() {
        return "list_project";
    }


}
