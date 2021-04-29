package cn.zuo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *Author Pass_Z
 *Date 2021/4/27 - 19:31
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Equip {

    private int id;
    private String equipID;
    private String equipName;
    private String equipDesc;
    private int equipPrice;
    private int equipOut;
    private String equipSpec;
    private int equipCount;

}
