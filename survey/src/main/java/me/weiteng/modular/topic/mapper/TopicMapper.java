package me.weiteng.modular.topic.mapper;

import me.weiteng.pojo.entity.Topic;
import me.weiteng.pojo.entity.TopicAnswer;
import me.weiteng.pojo.entity.TopicOption;
import me.weiteng.pojo.vo.TopicVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public interface TopicMapper {

    List<Topic> selectAll();

    int queryTotalCount();

    List<TopicVO> queryTopicByPage(@Param("start") Integer start, @Param("rows") Integer rows);

    int insert(Topic topic);

    int batchInsertOptions(@Param("options") List<TopicOption> options);

    int insertTopicAnswer(TopicAnswer topicAnswer);

    TopicVO queryTopicByTopicId(Integer topicId);

    List<TopicOption> queryTopicOptions(Integer topicId);

    int deleteTopic(Integer topicId);

    int deleteAnswer(Integer topicId);

    int deleteOptions(Integer topicId);

    int updateTopic(Topic topic);

    int updateTopicAnswer(TopicAnswer answer);

    int updateTopicOption(TopicOption option);

    TopicAnswer queryTopicAnswer(Integer topicId);

    List<TopicVO> queryAllTopics();

    List<TopicVO> queryTopicAndAnswers();
}
