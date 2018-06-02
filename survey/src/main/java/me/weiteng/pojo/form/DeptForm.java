package me.weiteng.pojo.form;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class DeptForm {

    @NotNull
    private String name;
    private String code;
}
