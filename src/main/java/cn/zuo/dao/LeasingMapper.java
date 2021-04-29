package cn.zuo.dao;

import cn.zuo.pojo.Leaser;
import cn.zuo.pojo.Leasing;
import cn.zuo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 17:17
 */
//承租方Dao
public interface LeasingMapper {
    //增加用户
    int addLeasing(Leasing leasing);

    //删除用户
    int deleteLeasingById(@Param("leasingId") int id);

    //更新用户
    int updateLeasing(Leasing leasing);

    //查询一位用户
    Leasing queryLeasingByUsername(@Param("username") String username);

    //查询所有用户
    List<Leasing> queryAllLeasing();
}