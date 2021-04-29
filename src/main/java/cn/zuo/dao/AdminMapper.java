package cn.zuo.dao;

import cn.zuo.pojo.Admin;
import cn.zuo.pojo.Leasing;
import org.apache.ibatis.annotations.Param;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 19:24
 */
public interface AdminMapper {

    Admin queryAdminByUsername(@Param("username") String username);

}
