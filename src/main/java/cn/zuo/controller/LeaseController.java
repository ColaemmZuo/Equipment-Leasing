package cn.zuo.controller;


import cn.zuo.pojo.Leaser;
import cn.zuo.service.LeaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.applet.resources.MsgAppletViewer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:39
 */
@Controller
@RequestMapping("/lease")
public class LeaseController {

    @Autowired
    @Qualifier("LeaseServiceImpl")
    private LeaseService leaseService;

    @RequestMapping("/addLease")
    public String addLease(Leaser lease, Model model){
        leaseService.addLease(lease);
        model.addAttribute("msg","租赁方注册成功");
        return "transit";
    }

    @RequestMapping("/leaseLogin")
    public String leaseLogin(Leaser leaser, Model model, HttpServletRequest request){
        Leaser leaser1 = leaseService.queryLeaseByUsername(leaser.getUsername());
        String welcome = "您好，租赁方"+ leaser.getUsername();
        HttpSession session = request.getSession(true);

        if (leaser.getPassword().equals(leaser1.getPassword())){
            System.out.println("welcome========>"+welcome);
            model.addAttribute("msg",welcome);
            session.setAttribute("USERNAME",leaser.getUsername());
            System.out.println("username========>"+session.getAttribute("USERNAME"));
            return "transit";
        }else {
            model.addAttribute("msg","login wrong");
            return "userLogin";
        }
    }


}
