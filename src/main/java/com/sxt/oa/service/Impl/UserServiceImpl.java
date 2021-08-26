package com.sxt.oa.service.Impl;

import com.sxt.oa.data.BranchMapper;
import com.sxt.oa.data.UserMapper;
import com.sxt.oa.domain.UserInfo;
import com.sxt.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService{

    @Autowired
    private BranchMapper branchMapper;
    @Autowired
    private UserMapper userMpper;

    @Override
    public List<UserInfo> findReceiverCandidates(Integer branchNo) {
        List<UserInfo> list=null;
        int count=this.branchMapper.countOfficeByBranch(branchNo);
        if (count>0){
            list=this.userMpper.findClerks(branchNo);
        }else{
            list=this.userMpper.findStaff(branchNo);
        }
        return null;
    }
}
