package com.sxt.oa.data;

import com.sxt.oa.domain.DutyInfo;

import java.util.List;

public interface DutyMapper {

    /**
     * 根据机构编号查询职务信息
     * @param branchNo
     * @return
     */
    List<DutyInfo> findByBranchNo(Integer branchNo);

    /**
     * 保存新职务
     * @param dutyInfo
     * @return
     */
    int insertDutyInfo(DutyInfo dutyInfo);

    /**
     * 根据机构编号和职务名统计数量
     *
     * @param dutyInfo
     * @return
     */
    int countDutyByName(DutyInfo dutyInfo);
}
