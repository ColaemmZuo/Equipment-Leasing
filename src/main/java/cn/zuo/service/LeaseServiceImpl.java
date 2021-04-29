package cn.zuo.service;

import cn.zuo.dao.LeaseMapper;
import cn.zuo.pojo.Leaser;


import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:30
 */
public class LeaseServiceImpl implements LeaseService {

    private LeaseMapper leaseDao;

    public LeaseMapper getLeaseDao() {
        return leaseDao;
    }

    public void setLeaseDao(LeaseMapper leaseDao) {
        this.leaseDao = leaseDao;
    }


    public int addLease(Leaser lease) {
        return leaseDao.addLease(lease);
    }

    public int deleteLeaseById(int id) {
        return leaseDao.deleteLeaseById(id);
    }

    public int updateLease(Leaser leaser) {
        return leaseDao.updateLease(leaser);
    }

    public Leaser queryLeaseByUsername(String username) {
        return leaseDao.queryLeaseByUsername(username);
    }

    public List<Leaser> queryAllLease() {
        return leaseDao.queryAllLease();
    }
}
