package me.weiteng.util;

import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

public class TextUtils {

    public static String getUUID() {
        UUID id = UUID.randomUUID();
        String[] idd = id.toString().split("-");
        String s = "";

        for (String tmp : idd) {
            s = s.concat(tmp);
        }

        return s;
    }

    public static int randomInt() {
        return RandomUtils.nextInt(0, Integer.MAX_VALUE);
    }

    public static int momentId() {
        return RandomUtils.nextInt(10000, Integer.MAX_VALUE);
    }

    public static String memberName() {
        return String.valueOf(RandomUtils.nextInt(10000000, 99999999));
    }

    public static String replaceHtmlBrTag(String content) {
        return replaceHtmlTag(content, "<br>", "\n");
    }

    public static String replaceHtmlTag(String content, String htmlTag, String tag) {
        if (StringUtils.isBlank(content)) {
            return null;
        }

        if (content.contains(htmlTag)) {
            content = content.replace(htmlTag, tag);
        }
        return content;
    }

    /**
     * 从Request请求中获取域名
     *
     * @param request 请求对象
     * @return 域名
     */
    public static String getDomainFromRequest(HttpServletRequest request) {
        StringBuffer url = request.getRequestURL();
        return url
                .delete(url.length() - request.getRequestURI().length(), url.length())
                .append(request.getServletContext().getContextPath())
                .append("/")
                .toString();
    }
}
