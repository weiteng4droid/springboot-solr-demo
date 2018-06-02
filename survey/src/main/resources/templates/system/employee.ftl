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

                <p>添加员工</p>

                <div class="span12">

                    <form class="form-horizontal" action="${request.contextPath}/user/add" method="post">

                        <table cellspacing="10">
                            <tr>
                                <td class="employee_style">
                                    姓名
                                </td>
                                <td class="employee_style">
                                    <input name="name" type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    电话
                                </td>
                                <td class="employee_style">
                                    <input name="phone" type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    昵称
                                </td>
                                <td class="employee_style">
                                    <input name="nickname" type="text"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    性别
                                </td>
                                <td class="employee_style">
                                    <input name="sex" checked="checked" type="radio" value="0"/>女
                                    <input name="sex" type="radio" value="1"/>男
                                </td>
                            </tr>
                            <tr>
                                <td class="employee_style">
                                    部门
                                </td>
                                <td class="employee_style">
                                    <select name="code">
                                        <#list deptList as dept>
                                            <option value="${dept.code}">${dept.name}</option>
                                        </#list>
                                    </select>
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