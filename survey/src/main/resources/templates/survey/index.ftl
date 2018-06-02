<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="keywords" content="">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">

    <title>答题有礼</title>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/index.css">
</head>
<body>
<div class="container">
    <div class="title">
        <h2>测控知识竞答</h2>
    </div>
    <div class="content" >
        <form id="content" method="post" action="${request.contextPath}/commit">
            <div id="details"></div>
                <#list topics as topic>
                <div>
                    <input type="hidden" name="answers[${topic_index}].topicId" value="${topic.topicId}" >
                    <h4>${topic_index + 1}. ${topic.content}</h4>
                    <#list topic.options as option >
                        <input type="radio" id="${option.optionId?c}" name="answers[${topic_index}].optionCode" value="${option.optionCode}">
                        ${option.optionCode}. ${option.optionContent}<br>
                    </#list>
                </div>
                </#list>
            <div id="message">
                <p>
                    <span>部门:</span>
                    <select name="deptCode">
                        <#list depts as dept>
                            <option value="${dept.code}">${dept.name}</option>
                        </#list>
                    </select>
                </p>
                <p><span>姓名:</span><input id="name_label" type="text" name="name"/></p>
                <p><span>电话:</span><input id="phone_label" type="text" name="phone"/></p>
                <p>
                    <span>性别:</span>
                    <input style="vertical-align: text-top; width: auto" id="sex_man" type="radio" name="sex" value="1"/><label for="sex_man">男</label>
                    <input style="vertical-align: text-top; width: auto" id="sex_women" type="radio" name="sex" checked="checked"  value="0"/><label for="sex_women">女</label>
                </p>
            </div>
        </form>
    </div>

    <div class="submit">
        <div id="submitData" >提交答案</div>
    </div>
</div>

</body>

</html>
<script src="${request.contextPath}/js/lib/jquery-1.7.2.min.js"></script>
<script src="${request.contextPath}/js/lib/rem.js"></script>
<script type="text/javascript">
    $('#submitData').click(function () {
        var name = $('#name_label').val();
        var phone = $('#phone_label').val();
        if (isEmpty(name)) {
            alert("请输入姓名");
            return;
        }
        if (isEmpty(phone)) {
            alert("请输入电话");
            return;
        }

        $('#content').submit();
    });

    function isEmpty(obj){
        return typeof obj == "undefined" || obj == null || obj == "";
    }
</script>