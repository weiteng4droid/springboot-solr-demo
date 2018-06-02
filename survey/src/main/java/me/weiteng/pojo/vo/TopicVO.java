package me.weiteng.pojo.vo;

import me.weiteng.pojo.entity.TopicAnswer;
import me.weiteng.pojo.entity.TopicOption;

import java.util.Date;
import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public class TopicVO {

    private Integer topicId;
    private String content;
    private Integer score;

    private Date createTime;

    /** 选项 */
    private List<TopicOption> options;

    /** 答案 */
    private TopicAnswer answer;

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<TopicOption> getOptions() {
        return options;
    }

    public void setOptions(List<TopicOption> options) {
        this.options = options;
    }

    public TopicAnswer getAnswer() {
        return answer;
    }

    public void setAnswer(TopicAnswer answer) {
        this.answer = answer;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "TopicVO{" +
                "topicId=" + topicId +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", options=" + options +
                ", answer=" + answer +
                ", score=" + score +
                '}';
    }
}
