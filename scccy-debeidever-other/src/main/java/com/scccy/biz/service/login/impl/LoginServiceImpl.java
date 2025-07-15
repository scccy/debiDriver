package com.scccy.biz.service.login.impl;

import com.scccy.biz.model.dto.LoginDTO;
import com.scccy.biz.service.login.LoginService;
import org.springframework.util.Assert;

public class LoginServiceImpl implements LoginService {

    @Override
    public String login(LoginDTO dto) {
        Assert.isNull(dto.getUsername(), "用户名不能为空");
        Assert.isNull(dto.getPassword(), "密码不能为空");
        // 风险控制

        // 用户名密码校验
        String storedPassword = validatePassword(dto);
        // 返回token
        return "jwt";
    }

    private String validatePassword(LoginDTO dto) {
        // 模拟数据库查询，实际应从数据库获取存储的密码

        return null;
    }
}
