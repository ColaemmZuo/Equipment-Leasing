package cn.zuo.service;

import cn.zuo.pojo.Books;
import cn.zuo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/17 - 16:30
 */
public interface UserService {
    //增加用户
    int addUser(User user);

    //删除用户
    int deleteUserById(int id);

    //更新用户
    int updateUser(User user);

    //查询一位用户
    User queryUserByUsername(String username);

    //查询所有用户
    List<User> queryAllUsers();
}
