package me.weiteng.modular.system.controller;

import lombok.extern.slf4j.Slf4j;
import me.weiteng.common.PageInfo;
import me.weiteng.pojo.entity.Dept;
import me.weiteng.pojo.entity.Employee;
import me.weiteng.modular.system.service.DeptService;
import me.weiteng.pojo.form.DeptForm;
import me.weiteng.pojo.form.EmployeeForm;
import me.weiteng.util.TextUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * 用户控制器
 *
 * Created by weiTeng on 2018/5/5.
 */
@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private DeptService deptService;

    @GetMapping("/dept_add")
    public String deptAdd() {
        return "system/add_dept";
    }

    @GetMapping("/add")
    public ModelAndView employeeAdd(Map<String, Object> map) {
        List<Dept> deptList = deptService.queryAllDepartment();
        map.put("deptList", deptList);
        return new ModelAndView("system/employee", map);
    }

    @RequestMapping("/list")
    public ModelAndView index(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "rows", defaultValue = "20") Integer rows,
                              Map<String, Object> map) {
        List<Dept> deptList = deptService.queryAllDepartment();
        PageInfo<Employee> pageInfo = deptService.queryEmployeeByPage(page, rows);
        map.put("url", "/survey/user/list");
        map.put("deptList", deptList);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("system/list", map);
    }

    @PostMapping("/dept_add")
    public String createDept(DeptForm deptForm) {
        deptService.createDept(deptForm);
        return "redirect:/user/list";
    }

    @PostMapping("/add")
    public String createUser(EmployeeForm form) {
        deptService.createEmployee(form);
        return "redirect:/user/list";
    }

    @GetMapping("/login")
    public String loginUi() {
        return "system/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("account") String account,
                        @RequestParam("password") String password,
                        HttpSession session) {
        final String pwd = "wd123456";
        final String originAccount = "wangdan";
        log.info("【登录信息】account = {}, password = {}", account, password);
        if (originAccount.equals(account) && pwd.equals(password)) {
            session.setAttribute("token", TextUtils.getUUID());
            return "redirect:/dash/main";
        }
        return "redirect:/user/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("token");
        return "redirect:/user/login";
    }
}
