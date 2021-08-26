package com.sxt.oa.data;

import com.sxt.oa.domain.UserInfo;

import java.util.List;

public interface UserMapper {

    /**
     * 查找该机构内办公室中的所有人员
     * @param branchNo
     * @return
     */
    List<UserInfo> findClerks(Integer branchNo);

    /**
     * 查找该机构内的所有人员
     * @param branchNo
     * @return
     */
    List<UserInfo> findStaff(Integer branchNo);

}
