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

                    <p>题目列表</p>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>题目ID</th>
                            <th>题目内容</th>
                            <th>分数</th>
                            <th>正确答案</th>
                            <th>答案内容</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list pageInfo.elements as topic>
                        <tr>
                            <td>${topic.topicId?c}</td>
                            <td width="400px">${topic.content}</td>
                            <td>${topic.score}</td>
                            <td>${topic.answer.optionCode!'暂无答案'}</td>
                            <td>${topic.answer.answerContent}</td>
                            <td>${topic.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                            <td width="170px">
                                <a href="${request.contextPath}/topic/detail/${topic.topicId?c}" class="btn btn-success btn-sm">详情</a>
                                <a href="${request.contextPath}/topic/modify/${topic.topicId?c}" class="btn btn-warning btn-sm">修改</a>
                                <a href="${request.contextPath}/topic/delete/${topic.topicId?c}" class="btn btn-danger btn-sm">删除</a>
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