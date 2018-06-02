package me.weiteng.modular.topic.service;

import me.weiteng.common.PageInfo;
import me.weiteng.pojo.entity.Topic;
import me.weiteng.pojo.form.SurveyForm;
import me.weiteng.pojo.form.TopicForm;
import me.weiteng.pojo.vo.TopicVO;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public interface TopicService {

    PageInfo<TopicVO> queryTopicByPage(Integer page, Integer rows);

    int createTopic(TopicForm topicForm);

    TopicVO queryTopic(Integer topicId);

    int deleteTopic(Integer topicId);

    int updateTopic(TopicForm topicForm);

    List<TopicVO> queryTopics();

    int processTopicScore(SurveyForm surveyForm);

    List<Topic> selectAll();
}
