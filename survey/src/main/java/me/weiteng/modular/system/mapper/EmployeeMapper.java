package me.weiteng.modular.system.mapper;

import me.weiteng.pojo.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/5.
 */
public interface EmployeeMapper {

    int queryTotalCount();

    List<Employee> queryEmployees(@Param("start") Integer start, @Param("rows") Integer rows);

    int insert(Employee employee);
}
