package cn.zuo.controller;

import cn.zuo.pojo.Leaser;
import cn.zuo.pojo.Leasing;
import cn.zuo.service.LeasingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 17:30
 */
@Controller
@RequestMapping("/leasing")
public class LeasingController {

    @Autowired
    @Qualifier("LeasingServiceImpl")
    private LeasingService leasingService;

    @RequestMapping("/addLeasing")
    public String addLease(Leasing leasing, Model model){
        leasingService.addLeasing(leasing);
        model.addAttribute("msg","承租方注册成功");
        return "transit";
    }

    @RequestMapping("/leasingLogin")
    public String leasingLogin(Leasing leasing,Model model, HttpServletRequest request){
        Leasing leasing1 = leasingService.queryLeasingByUsername(leasing.getUsername());
        String welcome = "您好，承租方"+ leasing.getUsername();
        HttpSession session = request.getSession(true);

        if (leasing.getPassword().equals(leasing1.getPassword())){
            System.out.println("welcome========>"+welcome);
            model.addAttribute("msg",welcome);
            session.setAttribute("USERNAME",leasing.getUsername());
            System.out.println("username========>"+session.getAttribute("USERNAME"));
            return "transit";
        }else {
            model.addAttribute("msg","login wrong");
            return "userLogin";
        }
    }
}
