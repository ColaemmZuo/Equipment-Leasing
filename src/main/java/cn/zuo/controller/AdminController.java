package cn.zuo.controller;

import cn.zuo.pojo.Admin;
import cn.zuo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 19:52
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    @Qualifier("adminServiceImpl")
    private AdminService adminService;

    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin, Model model, HttpServletRequest request){
        Admin admin1 = adminService.queryAdminByUsername(admin.getUsername());
        String welcome = "您好，"+ admin.getUsername();

        HttpSession session = request.getSession(true);

        if (admin.getPassword().equals(admin1.getPassword())){
            System.out.println("welcome========>"+welcome);
            model.addAttribute("msg",welcome);
            session.setAttribute("USERNAME",admin.getUsername());
            System.out.println("username========>"+session.getAttribute("USERNAME"));
            return "transit";

        }else {
            model.addAttribute("msg","login wrong");
            return "userLogin";
        }
    }
}
