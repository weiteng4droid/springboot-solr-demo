package me.weiteng.pojo.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class TopicOption {

    private Integer optionId;
    private String optionCode;
    private String optionContent;

    /** 题目的ID */
    private Integer topicId;

    private Date createTime;
    private Date updateTime;
}
