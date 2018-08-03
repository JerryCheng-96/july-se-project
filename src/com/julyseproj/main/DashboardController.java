package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class DashboardController {
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(HttpSession session) {
        String theUsername = session.getAttribute("userType").toString();
        String theUserType = session.getAttribute("userType").toString();

        System.out.println(theUsername);
        System.out.println(theUserType);

        if (theUserType.equals("engineer")) {
            return "redirect:/dashboard/engineer?id=" + theUsername;
        }
        return "redirect:/dashboard/student?id=" + theUsername;
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

    @RequestMapping(value = "/dashboard/group", method = RequestMethod.GET)
    public String dash_team() {
        return "detail_group";
    }

    @RequestMapping(value = "/dashboard/project", method = RequestMethod.GET)
    public String dash_project() {
        return "detail_project";
    }

    @RequestMapping(value = "/dashboard/program", method = RequestMethod.GET)
    public String dash_program() {
        return "detail_program";
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
