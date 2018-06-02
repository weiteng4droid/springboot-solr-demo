package me.weiteng.modular.topic.service.impl;

import lombok.extern.slf4j.Slf4j;
import me.weiteng.common.PageInfo;
import me.weiteng.exception.TopicException;
import me.weiteng.modular.system.mapper.EmployeeMapper;
import me.weiteng.modular.topic.mapper.TopicMapper;
import me.weiteng.modular.topic.service.TopicService;
import me.weiteng.pojo.entity.Employee;
import me.weiteng.pojo.entity.Topic;
import me.weiteng.pojo.entity.TopicAnswer;
import me.weiteng.pojo.entity.TopicOption;
import me.weiteng.pojo.form.SurveyForm;
import me.weiteng.pojo.form.TopicForm;
import me.weiteng.pojo.vo.TopicVO;
import me.weiteng.service.SearchService;
import me.weiteng.util.PageUtil;
import me.weiteng.util.TextUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * 题目服务类
 *
 * Created by weiTeng on 2018/5/5.
 */
@Slf4j
@Service
public class TopicServiceImpl implements TopicService {

    private TopicMapper topicMapper;
    private EmployeeMapper employeeMapper;

    @Autowired
    private SearchService searchService;

    @Autowired
    public void setTopicMapper(TopicMapper topicMapper) {
        this.topicMapper = topicMapper;
    }

    @Autowired
    public void setEmployeeMapper(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    @Override
    public PageInfo<TopicVO> queryTopicByPage(Integer page, Integer rows) {
        int start = (page - 1) * rows;
        int total = topicMapper.queryTotalCount();
        List<TopicVO> topicVOS = topicMapper.queryTopicByPage(start, rows);
        return PageUtil.prepagePageInfo(page, rows, total, topicVOS);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int createTopic(TopicForm topicForm) {
        log.info("【提交题目】{}", topicForm);
        Topic topic = new Topic();
        topic.setContent(topicForm.getContent());
        topic.setScore(topicForm.getScore());
        topic.setCreateTime(new Date());

        int count = topicMapper.insert(topic);
        searchService.createSolrIndex(topic);

        // 设置ID
        List<TopicOption> options = topicForm.getOptions();
        options.forEach(topicOption -> {
            topicOption.setTopicId(topic.getTopicId());
            topicOption.setOptionId(TextUtils.momentId());
        });

        count += topicMapper.batchInsertOptions(options);

        TopicOption option = null;
        for (TopicOption topicOption : options) {
            if (topicOption.getOptionCode().equals(topicForm.getAnswerCode())) {
                option = topicOption;
                break;
            }
        }
        
        TopicAnswer topicAnswer = new TopicAnswer();
        topicAnswer.setTopicId(topic.getTopicId());
        if (option != null) {
            topicAnswer.setOptionCode(option.getOptionCode());
            topicAnswer.setOptionId(option.getOptionId());
            topicAnswer.setAnswerContent(option.getOptionContent());
        }

        count += topicMapper.insertTopicAnswer(topicAnswer);
        return count;
    }

    @Override
    public TopicVO queryTopic(Integer topicId) {
        TopicVO topic = topicMapper.queryTopicByTopicId(topicId);
        List<TopicOption> options = topicMapper.queryTopicOptions(topicId);
        options.sort(Comparator.comparing(TopicOption::getOptionCode));
        topic.setOptions(options);
        return topic;
    }

    @Override
    @Transactional(rollbackFor = TopicException.class)
    public int deleteTopic(Integer topicId) {
        int count = topicMapper.deleteTopic(topicId);
        if (count <= 0) {
            throw new TopicException("删除题目失败");
        }

        count = topicMapper.deleteAnswer(topicId);
        if (count <= 0) {
            throw new TopicException("删除答案失败");
        }

        count = topicMapper.deleteOptions(topicId);
        if (count <= 0) {
            throw new TopicException("删除选项失败");
        }
        return count;
    }

    @Override
    @Transactional(rollbackFor = TopicException.class)
    public int updateTopic(TopicForm topicForm) {
        log.info("【修改题目】{}", topicForm);
        Topic topic = new Topic();
        topic.setTopicId(topicForm.getTopicId());
        topic.setContent(topicForm.getContent().trim());
        topic.setScore(topicForm.getScore());

        int count = 0;
        // 更新题目
        TopicVO originTopic = topicMapper.queryTopicByTopicId(topicForm.getTopicId());
        if (!StringUtils.equals(originTopic.getContent(), topic.getContent()) ||
                !originTopic.getScore().equals(topic.getScore())) {
            count = topicMapper.updateTopic(topic);
        }
        topic.setCreateTime(originTopic.getCreateTime());
        searchService.createSolrIndex(topic);

        // 批量更新选项
        topicForm.getOptions().forEach(option -> topicMapper.updateTopicOption(option));
        TopicAnswer originAnswer = topicMapper.queryTopicAnswer(topic.getTopicId());
        if (!StringUtils.equals(originAnswer.getOptionCode(), topicForm.getAnswerCode())) {
            TopicOption topicOption = topicForm.getOptions()
                    .stream()
                    .filter(option -> option.getOptionCode().equals(topicForm.getAnswerCode()))
                    .findFirst()
                    .get();

            // 更新答案
            originAnswer.setOptionCode(topicOption.getOptionCode());
            originAnswer.setAnswerContent(topicOption.getOptionContent());
            originAnswer.setOptionId(topicOption.getOptionId());
            count += topicMapper.updateTopicAnswer(originAnswer);
        }
        return count;
    }

    @Override
    public List<TopicVO> queryTopics() {
        List<TopicVO> list = topicMapper.queryAllTopics();
        list.forEach(topicVO -> topicVO.getOptions().sort(Comparator.comparing(TopicOption::getOptionCode)));
        return list;
    }

    @Override
    public int processTopicScore(SurveyForm surveyForm) {
        List<TopicVO> topicVOS = topicMapper.queryTopicAndAnswers();
        List<TopicAnswer> answers = surveyForm.getAnswers();
        if (topicVOS.size() != answers.size()) {
            throw new TopicException("没有打完题目");
        }

        int score = 0;
        for (TopicAnswer topicAnswer : answers) {
            for (TopicVO topicVO : topicVOS) {
                if (topicVO.getTopicId().equals(topicAnswer.getTopicId())
                        && topicVO.getAnswer().getOptionCode().equals(topicAnswer.getOptionCode())) {
                    score += topicVO.getScore();
                }
            }
        }

        Employee employee = new Employee();
        employee.setName(surveyForm.getName());
        employee.setPhone(surveyForm.getPhone());
        employee.setSex(surveyForm.getSex());
        employee.setCode(surveyForm.getDeptCode());
        employee.setTotalScore(score);
        employeeMapper.insert(employee);
        return score;
    }

    @Override
    public List<Topic> selectAll() {
        return topicMapper.selectAll();
    }
}
