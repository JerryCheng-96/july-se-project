package com.julyseproj.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
     * @param password 密码
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(HttpSession session, String username, String password) throws Exception {
        //在Session里保存信息
        session.setAttribute("username", username);
        //重定向
        return "redirect:dashboard";
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

        return "redirect:login";
    }


}