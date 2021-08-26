package com.sxt.oa.controller;


import com.sxt.oa.common.ValidateAdd;
import com.sxt.oa.domain.AjaxResponse;
import com.sxt.oa.domain.BranchInfo;
import com.sxt.oa.domain.PageInfo;
import com.sxt.oa.domain.UserInfo;
import com.sxt.oa.service.BranchService;
import com.sxt.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dept")
public class DepartmentController {

    @Autowired
    private BranchService branchService;
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String list(Integer pageNum, String dir, Model model){
        if (pageNum==null){
            pageNum=1;
        }
        if (dir!=null){
            if (dir.equalsIgnoreCase("pre")){
                pageNum--;
            }else if (dir.equalsIgnoreCase("next")){
                pageNum++;
            }
        }
        PageInfo pageInfo=this.branchService.findByPageNum(pageNum);
        model.addAttribute("pageInfo",pageInfo);
        return "system/dept_list";
    }

    @GetMapping("/ajax/list")
    @ResponseBody
    public AjaxResponse ajaxList(){
        return new AjaxResponse(this.branchService.findAllBranches());
    }

    @GetMapping("/receiver")
    public String receiver(Integer branchNo,Model model){
        BranchInfo branchInfo=this.branchService.findByBranchNo(branchNo);
        if (branchInfo.getBranchName().equals("办公室")){
            branchInfo=this.branchService.findByBranchNo(branchInfo.getParentNo());
        }
        model.addAttribute("branchInfo",branchInfo);

        List<UserInfo> user=this.userService.findReceiverCandidates(branchNo);
        model.addAttribute("user",user);
        return "system/dept_receiver";
    }

    @GetMapping("/add")
    public String preAdd(Model model){
        int newBranchNo=this.branchService.countAllRecords()+1;
        model.addAttribute("newBranchNo",newBranchNo);
        return "system/dept_add";
    }

    @PostMapping("/add")
    public String add(@Validated(ValidateAdd.class)BranchInfo branchInfo, BindingResult result,Model model){
        if (result.hasFieldErrors()){
            return "system/dept_add";
        }
        try {
            this.branchService.saveBranch(branchInfo);
        }catch (RuntimeException e){
            model.addAttribute("msg",e.getMessage());
            return "system/dept_add";
        }
        return "redirect:/dept/list?msgCode=addSuccess";
    }
}
