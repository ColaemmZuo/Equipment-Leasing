package cn.zuo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:17
 */
//租赁方
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Leaser {
    private int leaseId;
    private String username;
    private String password;
    private String userphone;
}
