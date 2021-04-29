package cn.zuo.service;

import cn.zuo.dao.UserDao;
import cn.zuo.pojo.User;

import java.util.List;

/*
 *Author Pass_Z
 *Date 2021/4/17 - 16:33
 */
public class UserServiceImpl implements UserService {

    //Service use Dao
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }


    public int addUser(User user) {
        return userDao.addUser(user);
    }

    public int deleteUserById(int id) {
        return userDao.deleteUserById(id);
    }

    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    public User queryUserByUsername(String username) {
        return userDao.queryUserByUsername(username);
    }

    public List<User> queryAllUsers() {
        return userDao.queryAllUsers();
    }
}
