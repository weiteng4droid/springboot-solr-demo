package me.weiteng.modular.system.mapper;

import me.weiteng.pojo.entity.Dept;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public interface DeptMapper {

    int insertDept(Dept dept);

    int deleteDept(Integer deptId);

    List<Dept> queryAllDepartment();

}
