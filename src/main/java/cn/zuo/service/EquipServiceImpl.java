package cn.zuo.service;

import cn.zuo.dao.EquipMapper;
import cn.zuo.pojo.Equip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/27 - 20:37
 */
@Service
public class EquipServiceImpl implements EquipService {

    @Autowired
    private EquipMapper equipMapper;

    public int addEquip(Equip equip) {
        return equipMapper.addEquip(equip);
    }

    public int deleteEquipById(String equipID) {
        return equipMapper.deleteEquipById(equipID);
    }

    public int deleteEquipByName(String equipName) {
        return equipMapper.deleteEquipByName(equipName);
    }

    public int updateEquip(Equip equip) {
        return equipMapper.updateEquip(equip);
    }

    public Equip queryEquipById(String equipID) {
        return equipMapper.queryEquipById(equipID);
    }

    public Equip queryEquipByName(String equipName) {
        return equipMapper.queryEquipByName(equipName);
    }

    public List<Equip> queryAllEquip() {
        return equipMapper.queryAllEquip();
    }
}
