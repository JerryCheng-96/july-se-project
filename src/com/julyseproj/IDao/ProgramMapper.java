package com.julyseproj.IDao;

import com.julyseproj.entity.Program;

public interface ProgramMapper {
    int deleteByPrimaryKey(Integer programId);

    int insert(Program record);

    int insertSelective(Program record);

    Program selectByPrimaryKey(Integer programId);

    int updateByPrimaryKeySelective(Program record);

    int updateByPrimaryKey(Program record);
}