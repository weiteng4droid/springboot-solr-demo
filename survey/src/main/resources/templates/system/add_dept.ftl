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
                <div class="col-md-12 column">

                    <p>添加部门</p>

                    <form class="form-horizontal" action="${request.contextPath}/user/dept_add" method="post">
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">部门名称</label>
                            <div class="controls">
                                <input id="inputEmail" name="name" type="text"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">部门编号</label>
                            <div class="controls">
                                <input id="inputPassword" name="code" type="text"/>
                            </div>
                        </div>
                        <div class="control-group" style="margin-top: 20dx">
                            <div class="controls">
                                <button type="submit" class="btn btn-small btn-success">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>