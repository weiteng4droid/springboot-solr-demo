<html>
<#include "../common/header.ftl">
<body>

<div id="wrapper" class="toggled">
<#--边栏sidebar-->
<#include "../common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix" style="margin-left: 20px">

                <p>修改题目</p>

                <div class="span12">

                    <form class="form-horizontal" action="${request.contextPath}/topic/modify" method="post">
                        <input type="hidden" name="topicId" value="${topic.topicId?c}">
                        <table cellspacing="10">
                            <tr>
                                <td class="employee_style">
                                    题目内容
                                </td>
                                <td class="employee_style">
                                    <textarea class="option_textarea_fit" name="content">${topic.content}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    题目分数
                                </td>
                                <td class="employee_style">
                                    <input type="text" name="score" value="${topic.score}">
                                </td>
                            </tr>
                            <#list topic.options as option>
                            <tr>
                                <td class="employee_style">
                                    选项 ${option.optionCode}
                                </td>
                                <td class="employee_style">
                                    <input type="hidden" name="options[${option_index}].topicId" value="${topic.topicId?c}">
                                    <input type="hidden" name="options[${option_index}].optionId" value="${option.optionId?c}">
                                    <input type="hidden" name="options[${option_index}].optionCode" value="${option.optionCode}">
                                    <textarea class="option_textarea_fit" name="options[${option_index}].optionContent">${option.optionContent}</textarea>
                                    <input type="radio"<#if option.optionCode == topic.answer.optionCode>checked="checked"</#if>
                                    name="answerCode" value="${option.optionCode}">答案
                                </td>
                            </tr>
                            </#list>
                        </table>

                        <button type="submit" class="btn btn-small btn-success">修改</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>