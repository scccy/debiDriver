package com.scccy.biz.service.login;

import com.scccy.biz.model.dto.LoginDTO;

public interface LoginService {
/**
 * 登录
 * @param username
 * @param password
 * @return
 */
public String login(LoginDTO dto);

}
