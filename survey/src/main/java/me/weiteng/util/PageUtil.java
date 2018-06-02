package me.weiteng.util;

import me.weiteng.common.PageInfo;

import java.util.List;

/**
 * 整理页码
 *
 * @author BTL02
 * @since 2018/3/14 15:37
 */
public class PageUtil {

    private PageUtil() {}

    public static <T> PageInfo<T> prepagePageInfo(int page, int rows, int total, List<T> data) {
        PageInfo<T> pageInfo = new PageInfo<>();
        pageInfo.setCurrentPage(page);
        pageInfo.setTotalCount(total);
        pageInfo.setPageSize(rows);
        pageInfo.setElements(data);

        int totalPage;
        if (total % rows == 0) {
            totalPage = total / rows;
        } else {
            totalPage = total / rows + 1;
        }
        pageInfo.setTotalPage(totalPage);
        return pageInfo;
    }
}
