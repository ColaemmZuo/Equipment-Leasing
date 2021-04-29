package cn.zuo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *Author Pass_Z
 *Date 2021/4/17 - 16:11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int userID;
    private String username;
    private String password;
}
