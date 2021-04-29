package cn.zuo.dao;

import cn.zuo.pojo.Equip;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/27 - 19:37
 */
public interface EquipMapper {
    //addequip
    int addEquip(Equip equip);

    //delete
    int deleteEquipById(@Param("equipID") String  equipID);
    int deleteEquipByName(@Param("equipName") String  equipName);

    //update
    int updateEquip(Equip equip);

    //queryone
    Equip queryEquipById(@Param("equipID") String equipID);

    Equip queryEquipByName(@Param("equipName") String equipName);

    //query*
    List<Equip> queryAllEquip();

}
