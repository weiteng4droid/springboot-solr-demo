<div class="col-md-12 column">
    <ul class="pagination pull-right">
    <#if pageInfo.currentPage lte 1>
        <li class="disabled"><a href="#">上一页</a></li>
    <#else>
        <li><a href="${url}?page=${pageInfo.currentPage - 1}&rows=${pageInfo.pageSize}">上一页</a></li>
    </#if>

    <#list pageInfo.pageRange()["start"]..pageInfo.pageRange()["end"] as index>
        <#if pageInfo.currentPage == index>
            <li class="disabled"><a href="#">${index}</a></li>
        <#else>
            <li><a href="${url}?page=${index}&rows=${pageInfo.pageSize}">${index}</a></li>
        </#if>
    </#list>

    <#if pageInfo.currentPage gte pageInfo.totalPage>
        <li class="disabled"><a href="#">下一页</a></li>
    <#else>
        <li><a href="${url}?page=${pageInfo.currentPage + 1}&rows=${pageInfo.pageSize}">下一页</a></li>
    </#if>
    </ul>
</div>