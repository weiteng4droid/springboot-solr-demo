<html>
<#include "../common/header.ftl">
<body>

<div id="wrapper" class="toggled">
    <#--边栏sidebar-->
    <#include "../common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">

                    <p>部门列表</p>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>部门编号</th>
                            <th>部门名称</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list deptList as dept>
                        <tr>
                            <td>${dept.id?c}</td>
                            <td>${dept.name}</td>
                            <td>${dept.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>

                    <p>成员列表</p>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>员工ID</th>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>性别</th>
                            <th>昵称</th>
                            <th>部门</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list pageInfo.elements as employee>
                        <tr>
                            <td>${employee.id?c}</td>
                            <td>${employee.name}</td>
                            <td>${employee.phone!'暂无'}</td>
                            <td>${employee.sex()}</td>
                            <td>${employee.nickname!'暂无'}</td>
                            <td>${employee.deptName}</td>
                            <td>${employee.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                            <td>
                                <a href="${request.contextPath}/admin/user/delete/${employee.id?c}" class="btn btn-warning btn-sm">删除</a>
                            </td>
                        </tr>
                        </#list>
                        </tbody>
                    </table>

                    <#-- 分页组件 -->
                    <#include "../common/page.ftl">

                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>