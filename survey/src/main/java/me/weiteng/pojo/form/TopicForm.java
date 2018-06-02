package me.weiteng.pojo.form;

import lombok.Data;
import me.weiteng.pojo.entity.TopicOption;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Data
public class TopicForm {

    private Integer topicId;
    private String content;
    private Integer score;

    /** 选项 */
    private List<TopicOption> options;

    private String answerCode;
}
