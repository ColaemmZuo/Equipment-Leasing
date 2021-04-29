package cn.zuo.service;

import cn.zuo.pojo.Leasing;
import cn.zuo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 17:23
 */
public interface LeasingService {
    //增加用户
    int addLeasing(Leasing leasing);

    //删除用户
    int deleteLeasingById( int id);

    //更新用户
    int updateLeasing(Leasing leasing);

    //查询一位用户
    Leasing queryLeasingByUsername( String username);

    //查询所有用户
    List<Leasing> queryAllLeasing();
}
