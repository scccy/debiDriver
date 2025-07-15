package com.scccy.biz.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer {
    private Long userId;
    private String username;
    private String nickName;
    private String createTime;
}
