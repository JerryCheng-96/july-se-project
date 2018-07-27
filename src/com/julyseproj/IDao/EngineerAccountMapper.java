package com.julyseproj.IDao;

import com.julyseproj.entity.EngineerAccount;

public interface EngineerAccountMapper {
    int deleteByPrimaryKey(Integer accountEId);

    int insert(EngineerAccount record);

    int insertSelective(EngineerAccount record);

    EngineerAccount selectByPrimaryKey(Integer accountEId);

    int updateByPrimaryKeySelective(EngineerAccount record);

    int updateByPrimaryKey(EngineerAccount record);
}