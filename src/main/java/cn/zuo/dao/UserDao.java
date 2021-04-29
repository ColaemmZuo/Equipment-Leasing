package cn.zuo.dao;

import cn.zuo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/17 - 16:08
 */
public interface UserDao {
    //增加用户
    int addUser(User user);

    //删除用户
    int deleteUserById(@Param("userID") int id);

    //更新用户
    int updateUser(User user);

    //查询一位用户
    User queryUserByUsername(@Param("username") String username);

    //查询所有用户
    List<User> queryAllUsers();
}
