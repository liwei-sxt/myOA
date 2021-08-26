package com.sxt.oa.data;

import com.sxt.oa.domain.BranchInfo;

import java.util.List;
import java.util.Map;

public interface BranchMapper {

    /**
     * 查找所有部门
     * @return
     */
    List<BranchInfo> findAllBranches();

    /**
     * 统计部门的数量
     * @return
     */
    int countBranches();

    /**
     * 根据页数查找
     * @param map
     * @return
     */
    List<BranchInfo> findByPageNum(Map<String,Integer> map);

    /**
     * 保存机构信息
     * @param branchInfo
     * @return
     */
    int insertBranchInfo(BranchInfo branchInfo);

    /**
     * 统计所有的记录数量
     * @return
     */
    int countAllRecords();

    /**
     * 根据机构编号获取机构信息
     * @param branchNo
     * @return
     */
    BranchInfo findByBranchNo(Integer branchNo);

    /**
     * 统计机构内办公室的数量
     * @param branchNo
     * @return
     */
    int countOfficeByBranch(Integer branchNo);
}
