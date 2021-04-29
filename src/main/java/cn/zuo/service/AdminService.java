package cn.zuo.service;

import cn.zuo.pojo.Admin;
import org.apache.ibatis.annotations.Param;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 19:26
 */
public interface AdminService {
    Admin queryAdminByUsername(String username);

}
