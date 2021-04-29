package cn.zuo.dao;

import cn.zuo.pojo.Leaser;
import cn.zuo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:20
 */
//租赁方Dao
public interface LeaseMapper {
    //增加用户
    int addLease(Leaser leaser);

    //删除用户
    int deleteLeaseById(@Param("leaseId") int id);

    //更新用户
    int updateLease(Leaser leaser);

    //查询一位用户
    Leaser queryLeaseByUsername(@Param("username") String username);

    //查询所有用户
    List<Leaser> queryAllLease();
}
