package cn.zuo.service;

import cn.zuo.dao.LeasingMapper;
import cn.zuo.pojo.Leasing;
import cn.zuo.pojo.User;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 17:24
 */
public class LeasingServiceImpl implements LeasingService {

    private LeasingMapper leasingMapper;

    public LeasingMapper getLeasingMapper() {
        return leasingMapper;
    }

    public void setLeasingMapper(LeasingMapper leasingMapper) {
        this.leasingMapper = leasingMapper;
    }

    public int addLeasing(Leasing leasing) {
        return leasingMapper.addLeasing(leasing);
    }

    public int deleteLeasingById(int id) {
        return leasingMapper.deleteLeasingById(id);
    }

    public int updateLeasing(Leasing leasing) {
        return leasingMapper.updateLeasing(leasing);
    }

    public Leasing queryLeasingByUsername(String username) {
        return leasingMapper.queryLeasingByUsername(username);
    }

    public List<Leasing> queryAllLeasing() {
        return leasingMapper.queryAllLeasing();
    }
}
