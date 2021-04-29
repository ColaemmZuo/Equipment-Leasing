package cn.zuo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int adminId;
    private String username;
    private String password;
}
