package com.sxt.oa.service.Impl;

import com.sxt.oa.common.Constants;
import com.sxt.oa.data.BranchMapper;
import com.sxt.oa.domain.BranchInfo;
import com.sxt.oa.domain.PageInfo;
import com.sxt.oa.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BranchServiceImpl implements BranchService {

    @Autowired
    private BranchMapper branchMapper;

    @Override
    @Transactional(readOnly = true)
    public List<BranchInfo> findAllBranches() {
        return this.branchMapper.findAllBranches();
    }

    @Override
    public PageInfo findByPageNum(Integer pageNum) {
        int branchCount=this.branchMapper.countBranches();
        PageInfo pageInfo=new PageInfo();
        pageInfo.setPageCount((branchCount+ Constants.PAGE_SIZE-1)/Constants.PAGE_SIZE);
        if (pageNum>pageInfo.getPageCount()){
            pageNum=pageInfo.getPageCount();
        }
        if (pageNum<1){
            pageNum=1;
        }
        pageInfo.setPageNum(pageNum);

        Map<String,Integer>  map=new HashMap<>();
        map.put("offset",(pageNum-1)*Constants.PAGE_SIZE);
        map.put("pageSize",Constants.PAGE_SIZE);
        List<BranchInfo> list=this.branchMapper.findByPageNum(map);
        pageInfo.setList(list);
        return pageInfo;
    }

    @Override
    @Transactional(readOnly = true)
    public int countBranches() {
        return this.branchMapper.countBranches();
    }

    @Override
    @Transactional(readOnly = false)
    public boolean saveBranch(BranchInfo branchInfo) {
        if (branchInfo.getParentNo()==null || branchInfo.getParentNo()==0){
            branchInfo.setBranchLevel(1);
            branchInfo.setParentNo(null);
        }else{
            BranchInfo parentInfo=this.branchMapper.findByBranchNo(branchInfo.getParentNo());
            if (parentInfo==null){
                throw new RuntimeException("上级机构已被移除，无法添加新机构！");
            }
            branchInfo.setBranchLevel(parentInfo.getBranchLevel()+1);
        }
        branchInfo.setBranchNo(this.countAllRecords()+1);
        branchInfo.setDelFlag(0);
        return this.branchMapper.insertBranchInfo(branchInfo)>0;
    }

    @Override
    public int countAllRecords() {
        return this.branchMapper.countAllRecords();
    }

    @Override
    @Transactional
    public BranchInfo findByBranchNo(Integer branchNo) {
        return this.branchMapper.findByBranchNo(branchNo);
    }

    @Override
    @Transactional
    public int countOfficeByBranch(Integer branchNo) {
        return this.branchMapper.countOfficeByBranch(branchNo);
    }
}
