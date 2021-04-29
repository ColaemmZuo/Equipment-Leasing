package cn.zuo.service;

import cn.zuo.dao.AdminMapper;
import cn.zuo.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 19:27
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public Admin queryAdminByUsername(String username) {
        return adminMapper.queryAdminByUsername(username);
    }
}
