package com.sxt.oa.domain;

public class AjaxResponse {

    private int code;
    private String msg;
    private Object data;

    public static AjaxResponse OK=new AjaxResponse(0,"ok");
    public static AjaxResponse PARAM_INVALID = new AjaxResponse(-1, "参数无效!");
    public static AjaxResponse UNAUTHORIZED = new AjaxResponse(-2, "无操作权限!");
    public static AjaxResponse UNAUTHENTICATED = new AjaxResponse(-3, "未登录系统!");
    public static AjaxResponse SERVER_ERROR = new AjaxResponse(-9, "服务器故障!");


    public AjaxResponse(){

    }

    public AjaxResponse(int code,String msg){
        this.code=code;
        this.msg=msg;
    }

    public AjaxResponse(Object data){
        this.data=data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
