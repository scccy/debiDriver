package com.scccy.common.result;

public class AppExpection extends Exception{
    private String code;
    private String message;
    public AppExpection(String code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }
}
