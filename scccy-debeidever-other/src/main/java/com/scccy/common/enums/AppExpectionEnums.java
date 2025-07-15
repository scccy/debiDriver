package com.scccy.common.enums;

import lombok.Getter;

@Getter
public enum AppExpectionEnums {
    //用户名或密码错误
    USERNAME_OR_PASSWORD_ERROR("OT1001", "用户名或密码错误"),
    //系统异常
    SYSTEM_ERROR("OT1002", "系统异常"),
    //参数校验失败
    PARAM_VALIDATE_ERROR("OT1003", "参数校验失败");

    private final String code;
    private final String message;

    AppExpectionEnums(String code, String message) {
        this.code = code;
        this.message = message;
    }
}
