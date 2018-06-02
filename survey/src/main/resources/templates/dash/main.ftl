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

                    <p>用户得分情况</p>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>性别</th>
                            <th>部门</th>
                            <th>得分</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list pageInfo.elements as employee>
                        <tr>
                            <td>${employee.name}</td>
                            <td>${employee.phone!'暂无'}</td>
                            <td>${employee.sex()}</td>
                            <td>${employee.deptName}</td>
                            <td>${employee.totalScore!'00'}</td>
                            <td>${employee.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
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