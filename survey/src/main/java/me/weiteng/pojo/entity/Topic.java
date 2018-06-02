package me.weiteng.pojo.entity;

import lombok.Data;
import org.apache.solr.client.solrj.beans.Field;

import java.util.Date;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class Topic {

    @Field("id")
    private Integer topicId;

    @Field("topic_content")
    private String content;

    @Field("topic_score")
    private Integer score;

    @Field("topic_create_time")
    private Date createTime;
}
