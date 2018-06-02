<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
    <ul class="nav sidebar-nav">
        <li class="sidebar-brand">
            <a href="#">
                答题管理系统
            </a>
        </li>
        <li>
            <a href="${request.contextPath}/dash/main"><i class="fa fa-fw fa-list-alt"></i> 统计</a>
        </li>
        <li class="dropdown open">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-fw fa-plus"></i> 成员 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">操作</li>
                <li><a href="${request.contextPath}/user/list">列表</a></li>
                <li><a href="${request.contextPath}/user/dept_add">新增部门</a></li>
                <li><a href="${request.contextPath}/user/add">新增成员</a></li>
            </ul>
        </li>
        <li class="dropdown open">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-fw fa-plus"></i> 题目 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">操作</li>
                <li><a href="${request.contextPath}/topic/list">列表</a></li>
                <li><a href="${request.contextPath}/topic/add">新增</a></li>
            </ul>
        </li>

        <li>
            <a href="${request.contextPath}/user/logout"><i class="fa fa-fw fa-list-alt"></i> 登出</a>
        </li>
    </ul>
</nav>