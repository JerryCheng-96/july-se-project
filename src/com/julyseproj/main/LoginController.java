package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录认证的控制器
 */
@Controller
public class LoginController {

    /**
     * 登录
     *
     * @param session  HttpSession
     * @param username 用户名
     * @return
     */
    @RequestMapping(value = "/login.do")
    public String login_do(HttpSession session, String username, String userType) throws Exception {
        //在Session里保存信息
        session.setAttribute("username", username);
        session.setAttribute("userType", userType);
        //重定向

        System.out.println("userType: " + userType);

        if (userType.equals("student")) {
            return "redirect:/dashboard/student?id=" + username;
        } else if (userType.equals("engineer")) {
            return "redirect:/dashboard/engineer?id=" + username;
        }

        return "redirect:dashboard";
    }

    public String login() throws Exception {
        return "login";
    }

    /**
     * 退出系统
     *
     * @param session Session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) throws Exception {
        //清除Session
        session.invalidate();

        return "redirect:dashboard";
    }


    @ResponseBody
    @RequestMapping(value = "/getCurrentUser", method = RequestMethod.GET)
    public String getCurrUser(HttpSession session) throws Exception {
        return "{" +
                "\"username\":" + session.getAttribute("username") + "," +
                "\"userType\":\"" + session.getAttribute("userType") + "\"" +
                "}";
    }


}