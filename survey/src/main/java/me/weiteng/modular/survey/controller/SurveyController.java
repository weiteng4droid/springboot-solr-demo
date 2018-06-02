package me.weiteng.modular.survey.controller;

import lombok.extern.slf4j.Slf4j;
import me.weiteng.modular.system.service.DeptService;
import me.weiteng.modular.topic.service.TopicService;
import me.weiteng.pojo.entity.Dept;
import me.weiteng.pojo.form.SurveyForm;
import me.weiteng.pojo.vo.TopicVO;
import me.weiteng.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 答题控制器
 *
 * Created by weiTeng on 2018/5/6.
 */
@Slf4j
@Controller
public class SurveyController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private SearchService searchService;

    @RequestMapping(value = {"", "/", "/index.htm"})
    public ModelAndView index(Map<String, Object> map) {
        List<TopicVO> topics = topicService.queryTopics();
        List<Dept> depts = deptService.queryAllDepartment();
        map.put("topics", topics);
        map.put("depts", depts);
        return new ModelAndView("survey/index", map);
    }

    @PostMapping("/commit")
    public ModelAndView commitScore(SurveyForm surveyForm, Map<String, Object> map) {
        log.info("【表单数据】{}", surveyForm);
        int score = topicService.processTopicScore(surveyForm);
        map.put("score", score);
        return new ModelAndView("survey/success", map);
    }

    @GetMapping("/search")
    @ResponseBody
    public Object searchTopic(@RequestParam("keywords") String keywords) {
        Map<String, String> map = new HashMap<>();
        map.put("keywords", keywords);
        return searchService.searchTopic(map);
    }
}
