package me.weiteng.pojo.entity;


import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 部门实体
 *
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class Dept implements Serializable {

    private static final long serialVersionUID = 3545741037111743297L;

    private Long id;
    private String name;
    private String code;
    private Date createTime;
}
