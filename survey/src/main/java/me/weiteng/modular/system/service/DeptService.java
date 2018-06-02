package me.weiteng.modular.system.service;


import me.weiteng.common.PageInfo;
import me.weiteng.pojo.entity.Dept;
import me.weiteng.pojo.entity.Employee;
import me.weiteng.pojo.form.DeptForm;
import me.weiteng.pojo.form.EmployeeForm;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public interface DeptService {


    List<Dept> queryAllDepartment();

    PageInfo<Employee> queryEmployeeByPage(Integer page, Integer rows);

    void createDept(DeptForm deptForm);

    void createEmployee(EmployeeForm form);

}
