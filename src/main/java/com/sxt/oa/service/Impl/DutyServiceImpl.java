package com.sxt.oa.service.Impl;

import com.sxt.oa.data.BranchMapper;
import com.sxt.oa.data.DutyMapper;
import com.sxt.oa.domain.BranchInfo;
import com.sxt.oa.domain.DutyInfo;
import com.sxt.oa.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DutyServiceImpl implements DutyService {

    @Autowired
    private DutyMapper dutyMapper;
    @Autowired
    private BranchMapper branchMapper;

    @Override
    public List<DutyInfo> findByBranchNo(Integer branchNo) {
        //获取职务列表
        List<DutyInfo> dutyList=this.dutyMapper.findByBranchNo(branchNo);
        BranchInfo branchInfo=this.branchMapper.findByBranchNo(branchNo);
        //设置所属机构
        for(DutyInfo duty:dutyList){
                duty.setBranchInfo(branchInfo);
        }
        BranchInfo parentInfo=null;
        while(branchInfo.getParentNo()!=null){
            parentInfo=this.branchMapper.findByBranchNo(branchInfo.getBranchNo());
            branchInfo.setParentInfo(parentInfo);
            branchInfo=parentInfo;

        }
        return dutyList;
    }

    @Override
    public boolean saveDuty(DutyInfo dutyInfo) {
        if (dutyInfo.getBranchNo()==null){
            throw new RuntimeException("参数不足，缺失机构编号！");
        }
        if (dutyInfo.getDutyName()==null || dutyInfo.getDutyName().length()<2){
            throw new RuntimeException("职务名称不合法！");
        }
        int count=this.dutyMapper.countDutyByName(dutyInfo);
        if (count>0){
            throw new RuntimeException("机构名称已存在！");
        }
        dutyInfo.setDelFlag(0);
        return this.dutyMapper.insertDutyInfo(dutyInfo)>0;
    }
}
