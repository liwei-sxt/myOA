package com.sxt.oa.domain;

import com.sxt.oa.common.ValidateAdd;
import com.sxt.oa.common.ValidateEdit;

import javax.validation.constraints.NotNull;
import java.security.acl.Group;

public class BranchInfo {
    @NotNull(groups={ValidateEdit.class},message = "参数不足，缺少机构编号！")
    private Integer branchNo;
    private Integer branchLevel;
    private Integer parentNo;
    @NotNull(groups = {ValidateEdit.class, ValidateAdd.class},message = "请输入机构名称！")
    private String branchName;
    private String branchDesc;
    private Integer delFlag;
    private boolean isParent;
    private BranchInfo parentInfo;

    public BranchInfo getParentInfo() {
        return parentInfo;
    }

    public void setParentInfo(BranchInfo parentInfo) {
        this.parentInfo = parentInfo;
    }

    public boolean getIsParent() {
        return this.branchLevel < 3;
    }

    public void setIsParent(boolean parent) {
        isParent = parent;
    }

    public Integer getBranchNo() {
        return branchNo;
    }

    public void setBranchNo(Integer branchNo) {
        this.branchNo = branchNo;
    }

    public Integer getBranchLevel() {
        return branchLevel;
    }

    public void setBranchLevel(Integer branchLevel) {
        this.branchLevel = branchLevel;
    }

    public Integer getParentNo() {
        return parentNo;
    }

    public void setParentNo(Integer parentNo) {
        this.parentNo = parentNo;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchDesc() {
        return branchDesc;
    }

    public void setBranchDesc(String branchDesc) {
        this.branchDesc = branchDesc;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}

