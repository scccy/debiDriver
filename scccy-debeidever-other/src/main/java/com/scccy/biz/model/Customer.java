package com.scccy.biz.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Customer {
    private Long id;
    private String username;
    private String password;
    private String createTime;
}
