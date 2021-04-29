package cn.zuo.controller;

import cn.zuo.pojo.User;
import cn.zuo.service.UserService;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/*
 *Author Pass_Z
 *Date 2021/4/17 - 16:39
 */
@Controller
@RequestMapping("/user")
public class UserController {
    //调用service
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    //跳转到用户登录页面toUserLogin
    @RequestMapping("/toUserLogin")
    public String toUserLogin(){
        return "userLogin";
    }


    //跳转到注册用户页面
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "addUser";
    }

    //注册并添加用户的请求
    @RequestMapping("/addUser")
    public String addUser(User user,Model model){
        //System.out.println(user);
        userService.addUser(user);
        model.addAttribute("msg","注册成功");
        return "transit";
    }



    //登录判断
    @RequestMapping("/userLogin")
    public String userLogin(User user,Model model){
        //System.out.println(user.getPassword());
        User user1 = userService.queryUserByUsername(user.getUsername());
        //System.out.println("user1=>"+user1);
        if (user.getPassword().equals(user1.getPassword())){
            model.addAttribute("msg","登录成功");
            return "transit";
        }else {
            model.addAttribute("msg","login wrong");
            return "userLogin";
        }
    }


    //注销
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }


    //跳转
    @RequestMapping("/toDashboard")
    public String toDashboard(){
        return "dashboard";
    }
}
