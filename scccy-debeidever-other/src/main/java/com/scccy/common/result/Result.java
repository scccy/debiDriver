package com.scccy.common.result;

public class Result<T> {
    
    private static String SUCCESS_CODE = "0";
    private static String SUCCESS_MESSAGE = "success";
    private String code;
    private String message;
    private T data;
    public static <T> Result<T> success(T data) {
        return new Result<>(SUCCESS_CODE, SUCCESS_MESSAGE, data);
    }
    public static Result<Void> success() {
        return new Result<>(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }
    public static <T> Result<T> error(String code, String message) {
        return new Result<>(code, message, null);
    }
    public Result(String code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
