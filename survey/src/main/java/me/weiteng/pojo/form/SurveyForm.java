package me.weiteng.pojo.form;

import lombok.Data;
import me.weiteng.pojo.entity.TopicAnswer;

import java.util.List;

/**
 * Created by weiTeng on 2018/5/6.
 */
@Data
public class SurveyForm {

    private List<TopicAnswer> answers;

    private String name;
    private String phone;
    private Integer sex;
    private String deptCode;
}
