package me.weiteng.modular.system.service.impl;

import me.weiteng.common.PageInfo;
import me.weiteng.pojo.entity.Dept;
import me.weiteng.pojo.entity.Employee;
import me.weiteng.modular.system.mapper.DeptMapper;
import me.weiteng.modular.system.mapper.EmployeeMapper;
import me.weiteng.modular.system.service.DeptService;
import me.weiteng.pojo.form.DeptForm;
import me.weiteng.pojo.form.EmployeeForm;
import me.weiteng.util.PageUtil;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
@Service
public class DeptServiceImpl implements DeptService {

    private DeptMapper deptMapper;
    private EmployeeMapper employeeMapper;

    @Autowired
    public void setDeptMapper(DeptMapper deptMapper) {
        this.deptMapper = deptMapper;
    }

    @Autowired
    public void setEmployeeMapper(EmployeeMapper employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    @Override
    public List<Dept> queryAllDepartment() {
        return deptMapper.queryAllDepartment();
    }

    @Override
    public PageInfo<Employee> queryEmployeeByPage(Integer page, Integer rows) {
        final int total = employeeMapper.queryTotalCount();
        int start = (page - 1) * rows;
        List<Employee> employees = employeeMapper.queryEmployees(start, rows);
        return PageUtil.prepagePageInfo(page, rows, total, employees);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDept(DeptForm deptForm) {
        Dept dept = new Dept();
        dept.setName(deptForm.getName());

        if (StringUtils.isBlank(deptForm.getCode())) {
            dept.setCode(String.valueOf(RandomUtils.nextInt(10000, Integer.MAX_VALUE)));
        } else {
            dept.setCode(deptForm.getCode());
        }
        deptMapper.insertDept(dept);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createEmployee(EmployeeForm form) {
        Employee employee = new Employee();
        BeanUtils.copyProperties(form, employee);
        employeeMapper.insert(employee);
    }
}
