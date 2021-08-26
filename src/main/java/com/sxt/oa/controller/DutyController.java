package com.sxt.oa.controller;

import com.sxt.oa.domain.AjaxResponse;
import com.sxt.oa.domain.DutyInfo;
import com.sxt.oa.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/duty")
public class DutyController {

    @Autowired
    private DutyService dutyService;

    @GetMapping("/list")
    public String list(){
        return "system/duty_list";
    }

    @GetMapping("/ajax/list")
    @ResponseBody
    public AjaxResponse ajaxList(Integer branchNo){
        AjaxResponse response=null;
        response=new AjaxResponse(this.dutyService.findByBranchNo(branchNo));
        return response;
    }

    @PostMapping("/ajax/add")
    @ResponseBody
    public AjaxResponse ajaxAdd(DutyInfo dutyInfo){
        AjaxResponse ajaxResponse=new AjaxResponse();
        try{
            boolean result=this.dutyService.saveDuty(dutyInfo);
            ajaxResponse=AjaxResponse.OK;
        }catch (Exception e){
            ajaxResponse=new AjaxResponse(-99,e.getMessage());
        }
        return ajaxResponse;
    }
}
