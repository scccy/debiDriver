package com.scccy.biz.service.login.impl;

import jakarta.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class LoginAspect {

    @Around("@annotation(RequiresLogin)")
    public Object checkLogin(ProceedingJoinPoint joinPoint) throws Throwable {
        // 获取当前请求的上下文
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();


        // 用户已登录，继续执行目标方法
        return joinPoint.proceed();
    }
}
