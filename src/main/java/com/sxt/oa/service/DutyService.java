package com.sxt.oa.service;

import com.sxt.oa.domain.DutyInfo;

import java.util.List;

public interface DutyService {

    /**
     * 根据机构编号查找职务信息
     * @param branchNo
     * @return
     */
    List<DutyInfo> findByBranchNo(Integer branchNo);

    /**
     * 保存新职务
     * @param dutyInfo
     * @return
     */
    boolean saveDuty(DutyInfo dutyInfo);
}
