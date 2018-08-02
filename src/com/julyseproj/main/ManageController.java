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

    @RequestMapping(value = "/manage/class",method = RequestMethod.GET)
    public String class_manage(){
        return "list_class";
    }

    @RequestMapping(value = "/manage/class/new",method = RequestMethod.GET)
    public String class_create(){
        return "create_class";
    }

    @RequestMapping(value = "/manage/group/new",method = RequestMethod.GET)
    public String group_create(){
        return "create_group";
    }

    @RequestMapping(value = "/manage/engineer", method = RequestMethod.GET)
    public String engineer_manage() {
        return "list_engineer";
    }

    @RequestMapping(value = "/manage/project", method = RequestMethod.GET)
    public String project_manage() {
        return "list_project";
    }

    @RequestMapping(value = "/manage/program", method = RequestMethod.GET)
    public String program_manage() {
        return "list_program";
    }

    @RequestMapping(value = "/manage/project/edit", method = RequestMethod.GET)
    public String project_edit() {
        return "edit_project";
    }

    @RequestMapping(value = "/manage/docs", method = RequestMethod.GET)
    public String docs_manage() {
        return "list_docs";
    }

    @RequestMapping(value = "/manage/tasks", method = RequestMethod.GET)
    public String task_manage() {
        return "list_task";
    }

}
