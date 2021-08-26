package com.sxt.oa.service;

import com.sxt.oa.domain.UserInfo;

import java.util.List;

public interface UserService {

    /**
     * 查找该机构可作为公文接收人的人员
     * @param branchNo
     * @return
     */
    List<UserInfo> findReceiverCandidates(Integer branchNo);
}
