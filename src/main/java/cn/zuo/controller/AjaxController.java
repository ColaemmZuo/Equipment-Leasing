package cn.zuo.controller;

import cn.zuo.pojo.Equip;
import cn.zuo.pojo.Leaser;
import cn.zuo.pojo.Leasing;
import cn.zuo.service.EquipService;
import cn.zuo.service.LeaseService;
import cn.zuo.service.LeasingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 21:31
 */
@RestController
public class AjaxController {

    @Autowired
    @Qualifier("LeaseServiceImpl")
    private LeaseService leaseService;


    @Autowired
    @Qualifier("LeasingServiceImpl")
    private LeasingService leasingService;


    @Autowired
    @Qualifier("equipServiceImpl")
    private EquipService equipService;


    //租赁方
    @RequestMapping("/a1")
    public String a1(String username){
        Leaser leaser_test = leaseService.queryLeaseByUsername(username);
        System.out.println(username);
        String msg = "";
        if (username == ""){
            msg = "别忘记输入用户名噢~~";
        }
        else if (leaser_test!=null){
            msg = "用户名已被注册QAQ";
        }else {
            msg = "用户名允许被注册(◍´꒳`◍)";
        }
        return msg;
    }

    //承租方
    @RequestMapping("/a2")
    public String a2(String username){
        Leasing leasing_test = leasingService.queryLeasingByUsername(username);
        System.out.println(username);
        String msg = "";
        if (username == ""){
            msg = "别忘记输入用户名噢~~";
        }
        else if (leasing_test!=null){
            msg = "用户名已被注册QAQ";
        }else {
            msg = "用户名允许被注册(◍´꒳`◍)";
        }
        return msg;
    }


}
