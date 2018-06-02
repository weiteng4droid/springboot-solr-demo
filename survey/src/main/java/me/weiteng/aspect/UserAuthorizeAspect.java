package me.weiteng.aspect;

import lombok.extern.slf4j.Slf4j;
import me.weiteng.exception.AuthorizeException;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户认证拦截处理
 *
 * @author BTL02
 * @since 2018/3/15 17:16
 */
@Slf4j
@Component
@Aspect
public class UserAuthorizeAspect {

    @Pointcut("execution(public * me.weiteng.modular.*.controller.*.*(..))" +
            "&& !execution(public * me.weiteng.modular.system.controller.UserController.login*(..))" +
            "&& !execution(public * me.weiteng.modular.survey.controller.*.*(..))")
    public void verify() {}

    @Before("verify()")
    public void doVerify() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");

        if (StringUtils.isBlank(token)) {
            log.warn("【登录校验】session中没有token信息");
            throw new AuthorizeException();
        }
    }
}
