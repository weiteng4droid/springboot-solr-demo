package me.weiteng.pojo.entity;

import lombok.Data;

import java.util.Date;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class TopicAnswer {

    private Integer answerId;
    private String answerContent;
    private Integer topicId;
    private Integer optionId;
    private String optionCode;

    private Date createTime;
    private Date updateTime;
}
