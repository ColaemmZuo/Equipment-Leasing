package cn.zuo.controller;

import cn.zuo.pojo.Equip;
import cn.zuo.service.EquipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/27 - 20:49
 */
@Controller
@RequestMapping("/equip")
public class EquipController {
    @Autowired
    @Qualifier("equipServiceImpl")
    private EquipService equipService;


    @RequestMapping("/allEquip")
    @ResponseBody
    public List<Equip> allEquip(){
        List<Equip> equips = equipService.queryAllEquip();
        System.out.println(equips);
        return equips;
    }

    @RequestMapping("/queryEquip")
    @ResponseBody
    public Equip queryEquipByUsername(String equipName){
        Equip equip = equipService.queryEquipByName(equipName);
        System.out.println(equip);
        return equip;
    }

    @RequestMapping("/updateEquip")
    @ResponseBody
    public int updateEquip(Equip equip){
        System.out.println("即将更改的equip=>"+equip);
        int result = equipService.updateEquip(equip);
        return result;
    }

    @RequestMapping("/insertEquip")
    @ResponseBody
    public int insertEquip(Equip equip){
        System.out.println("即将新增的equip=>"+equip);
        int result = equipService.addEquip(equip);
        return result;
    }

    @RequestMapping("/deleteEquip")
    @ResponseBody
    public int deleteEquip(String equipName){
        System.out.println("即将删除的的equip=>"+equipName);
        int result = equipService.deleteEquipByName(equipName);
        return result;
    }



}
