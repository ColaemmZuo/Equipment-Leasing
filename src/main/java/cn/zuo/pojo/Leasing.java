package cn.zuo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *Author Pass_Z
 *Date 2021/4/23 - 15:18
 */
//承租方
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Leasing {
    private int leasingId;
    private String username;
    private String password;
    private String userphone;
}
