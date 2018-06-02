package me.weiteng.common;

import lombok.Data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 分页模型
 *
 * @author BTL02
 * @since 2017/12/28 14:47
 */
@Data
public class PageInfo<T> {

    private static final int DISPLAY_PAGE_HALF  = 6;
    private static final int DISPLAY_PAGE_TOTAL = 10;

    private int pageSize;
    /** 总页数 */
    private int totalPage;
    /** 总记录数 */
    private int totalCount;
    /** 当前页数 */
    private int currentPage;

    private List<T> elements;

    /**
     * 分页区域控制（Freemarker调用）
     *
     * @return 开始和结束的位置
     */
    public Map<String, Integer> pageRange() {
        Map<String, Integer> range = new HashMap<>(2);
        int start, end;
        if (totalPage <= DISPLAY_PAGE_TOTAL) {
            start = 1;
            end = totalPage;
        } else {
            if (currentPage <= DISPLAY_PAGE_HALF) {
                start = 1;
                end = DISPLAY_PAGE_TOTAL;
            } else {
                start = currentPage - 5;
                end = currentPage + 4;
                if (end >= totalPage) {
                    end = totalPage;
                    start = currentPage - (DISPLAY_PAGE_TOTAL - (totalPage - currentPage) - 1);
                }
            }
        }

        range.put("start", start);
        range.put("end", end);
        return range;
    }
}
