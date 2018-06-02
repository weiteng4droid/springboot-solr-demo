package me.weiteng.modular.dash.controller;

import me.weiteng.common.PageInfo;
import me.weiteng.modular.system.service.DeptService;
import me.weiteng.pojo.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by weiTeng on 2018/5/6.
 */
@Controller
@RequestMapping("/dash")
public class DashController {

    @Autowired
    private DeptService deptService;

    @GetMapping("/main")
    public ModelAndView dashMain(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                 @RequestParam(value = "rows", defaultValue = "20") Integer rows,
                                 Map<String, Object> map) {
        PageInfo<Employee> pageInfo = deptService.queryEmployeeByPage(page, rows);
        map.put("url", "/survey/dash/main");
        map.put("pageInfo", pageInfo);
        return new ModelAndView("dash/main", map);
    }

}
