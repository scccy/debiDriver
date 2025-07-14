package com.scccy.biz.service.login.impl;

import com.scccy.biz.service.login.LoginService;

public class LoginServiceImpl implements LoginService {

    @Override
    public String login(String username, String password) {
        if (username == null || password == null) {
            throw new IllegalArgumentException("用户名或密码不能为空");
        }
        
        // 模拟数据库查询，实际应从数据库获取存储的密码
        String storedPassword = getStoredPassword(username);
        
        if (storedPassword == null) {
            return "用户不存在";
        }
        
        if (!storedPassword.equals(password)) {
            return "密码错误";
        }
        
        return "登录成功";    }
    private String getStoredPassword(String username) {
        // 模拟数据库查询，实际应从数据库获取存储的密码
        if ("admin".equals(username)) {
            return "admin";
        }
        return null;
    }
}
