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

                <p>添加题目</p>

                <div class="span12">

                    <form class="form-horizontal" action="${request.contextPath}/topic/add" method="post">

                        <table cellspacing="10">
                            <tr>
                                <td class="employee_style">
                                    题目内容
                                </td>
                                <td class="employee_style">
                                    <textarea name="content" cols="60" rows="5"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    题目分数
                                </td>
                                <td class="employee_style">
                                    <input type="text" name="score" value="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    选项A
                                </td>
                                <td class="employee_style">
                                    <input type="hidden" name="options[0].optionCode" value="A">
                                    <textarea class="option_textarea" name="options[0].optionContent" cols="80" rows="5"></textarea>
                                    <input type="radio" checked="checked" name="answerCode" value="A">答案
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    选项B
                                </td>
                                <td class="employee_style">
                                    <input type="hidden" name="options[1].optionCode" value="B">
                                    <textarea class="option_textarea" name="options[1].optionContent" cols="80" rows="5"></textarea>
                                    <input type="radio" name="answerCode" value="B">答案
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    选项C
                                </td>
                                <td class="employee_style">
                                    <input type="hidden" name="options[2].optionCode" value="C">
                                    <textarea class="option_textarea" name="options[2].optionContent" cols="80" rows="5"></textarea>
                                    <input type="radio" name="answerCode" value="C">答案
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    选项D
                                </td>
                                <td class="employee_style">
                                    <input type="hidden" name="options[3].optionCode" value="D">
                                    <textarea class="option_textarea" name="options[3].optionContent" cols="80" rows="5"></textarea>
                                    <input type="radio" name="answerCode" value="D">答案
                                </td>
                            </tr>
                        </table>

                        <button type="submit" class="btn btn-small btn-success">提交</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>