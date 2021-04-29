package cn.zuo.service;

import cn.zuo.pojo.Equip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/27 - 20:30
 */
public interface EquipService {
    //addequip
    int addEquip(Equip equip);

    //delete
    int deleteEquipById( String  equipID);
    int deleteEquipByName(String  equipName);

    //update
    int updateEquip(Equip equip);

    //queryone
    Equip queryEquipById(String equipID);

    Equip queryEquipByName(String equipName);

    //query*
    List<Equip> queryAllEquip();
}
