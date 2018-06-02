package me.weiteng.pojo.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class Employee implements Serializable {

    private static final long serialVersionUID = -1680248882098322170L;

    private Long id;
    private String name;
    private String phone;
    private Integer sex;
    private String nickname;

    private Integer totalScore;

    /** 部门代码 */
    private String code;

    /** 部门名称 */
    private String deptName;

    private Date createTime;
    private Date updateTime;

    public String sex() {
        return sex == 1 ? "男士" : "女士";
    }
}
