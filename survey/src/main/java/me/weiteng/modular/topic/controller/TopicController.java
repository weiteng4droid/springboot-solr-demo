package me.weiteng.modular.topic.controller;

import me.weiteng.common.PageInfo;
import me.weiteng.modular.topic.service.TopicService;
import me.weiteng.pojo.form.TopicForm;
import me.weiteng.pojo.vo.TopicVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * 题目控制器
 *
 * Created by weiTeng on 2018/5/5.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @GetMapping("/add")
    public String addTopic() {
        return "topic/add";
    }

    @PostMapping("/add")
    public ModelAndView createTopic(TopicForm topicForm) {
        topicService.createTopic(topicForm);
        return new ModelAndView("redirect:/topic/list");
    }

    @RequestMapping("/list")
    public ModelAndView topicIndex(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                   @RequestParam(value = "rows", defaultValue = "5") Integer rows,
                                   Map<String, Object> map) {
        PageInfo<TopicVO> pageInfo = topicService.queryTopicByPage(page, rows);
        map.put("pageInfo", pageInfo);
        map.put("url", "/survey/topic/list");
        return new ModelAndView("topic/list", map);
    }

    @GetMapping("/detail/{topicId}")
    public ModelAndView displayDetail(@PathVariable("topicId") Integer topicId,
                                      Map<String, Object> map) {
        TopicVO topic = topicService.queryTopic(topicId);
        map.put("topic", topic);
        return new ModelAndView("topic/detail", map);
    }

    @GetMapping("/delete/{topicId}")
    public ModelAndView deleteTopic(@PathVariable("topicId") Integer topicId) {
        topicService.deleteTopic(topicId);
        return new ModelAndView("redirect:/topic/list");
    }

    @GetMapping("/modify/{topicId}")
    public ModelAndView modifyTopic(@PathVariable("topicId") Integer topicId,
                                    Map<String, Object> map) {
        TopicVO topic = topicService.queryTopic(topicId);
        map.put("topic", topic);
        return new ModelAndView("topic/modify", map);
    }

    @PostMapping("/modify")
    public ModelAndView updateTopic(TopicForm topicForm) {
        topicService.updateTopic(topicForm);
        return new ModelAndView("redirect:/topic/list");
    }
}
