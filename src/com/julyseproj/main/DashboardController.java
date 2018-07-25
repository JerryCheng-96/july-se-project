package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

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

    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String person() {
        return "person_temp";
    }

    @RequestMapping(value = "/class", method = RequestMethod.GET)
    public String class_class() {
        return "class_temp";
    }

    @RequestMapping(value = "/team", method = RequestMethod.GET)
    public String team() {
        return "team_temp";
    }
}
