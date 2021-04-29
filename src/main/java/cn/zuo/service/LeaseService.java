package cn.zuo.service;

import cn.zuo.pojo.Leaser;
import cn.zuo.pojo.User;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:28
 */
public interface LeaseService {
    //增加用户
    int addLease(Leaser leaser);

    //删除用户
    int deleteLeaseById(int id);

    //更新用户
    int updateLease(Leaser leaser);

    //查询一位用户
    Leaser queryLeaseByUsername(String username);

    //查询所有用户
    List<Leaser> queryAllLease();
}
