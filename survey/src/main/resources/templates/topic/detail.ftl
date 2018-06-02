<html xmlns="http://www.w3.org/1999/html">
<#include "../common/header.ftl">
<body>

<div id="wrapper" class="toggled">
<#--边栏sidebar-->
<#include "../common/nav.ftl">

    <#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix" >

                <div class="col-md-12 column">

                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                              题目ID：${topic.topicId?c}
                            </h3>
                        </div>
                        <div class="panel-body">
                            ${topic.content}
                        </div>
                        <div class="panel-footer">
                            分数：${topic.score} 分
                        </div>
                    </div>

                    <#list topic.options as option>
                    <#if topic.answer.optionCode == option.optionCode>
                    <div class="panel panel-success">
                    <#else>
                    <div class="panel panel-default">
                    </#if>
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                选项：${option.optionCode}
                            </h3>
                        </div>
                        <div class="panel-body">
                            ${option.optionContent}
                        </div>
                    </div>
                    </#list>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>