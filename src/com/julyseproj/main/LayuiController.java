package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/spring.do")
public class LayuiController {
    @RequestMapping(method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        return "spring";
    }
}
