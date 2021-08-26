package com.sxt.oa.service;

import com.sxt.oa.domain.BranchInfo;
import com.sxt.oa.domain.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BranchService {

    /**
     * 查询所有部门
     * @return
     */
    List<BranchInfo> findAllBranches();

    /**
     * 根据页码查询部门列表
     *
     * @param pageNum
     * @return
     */
    PageInfo findByPageNum(Integer pageNum);

    /**
     * 统计部门数量
     * @return
     */
    int countBranches();

    /**
     * 保存新部门
     * @param branchInfo
     * @return
     */
    boolean saveBranch(BranchInfo branchInfo);

    /**
     * 统计记录条数
     * @return
     */
    int countAllRecords();

    /**
     * 根据机构编号查找机构
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
