package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController {
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String login() {
        return "dashboard";
    }

    @RequestMapping(value = "/pg", method = RequestMethod.GET)
    public String pg() {
        return "playground";
    }

    @RequestMapping(value = "/dashboard/engineer", method = RequestMethod.GET)
    public String dashboard_engineer() {
        return "dashboard_engineer";
    }

    @RequestMapping(value = "/dashboard/student", method = RequestMethod.GET)
    public String dash_student() {
        return "dashboard_student";
    }

    @RequestMapping(value = "/dashboard/class", method = RequestMethod.GET)
    public String dash_class() {
        return "detail_class";
    }

    @RequestMapping(value = "/dashboard/person", method = RequestMethod.GET)
    public String dash_person() {
        return "dashboard_person";
    }

    @RequestMapping(value = "/dashboard/team", method = RequestMethod.GET)
    public String dash_team() {
        return "detail_team";
    }

    @RequestMapping(value = "/dashboard/project", method = RequestMethod.GET)
    public String dash_project() {
        return "detail_project";
    }

    @RequestMapping(value = "/dashboard/doc", method = RequestMethod.GET)
    public String dash_doc() {
        return "detail_doc";
    }



    @RequestMapping(value = "/edit/project", method = RequestMethod.GET)
    public String edit_project() {
        return "edit_project";
    }
}
