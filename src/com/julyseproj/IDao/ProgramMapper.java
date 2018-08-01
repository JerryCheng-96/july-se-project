package com.julyseproj.IDao;

import com.julyseproj.entity.Program;
import java.util.List;

public interface ProgramMapper {
    List<Program> selectAll();

    List<Program> selectByAuthor(Integer engineerId);

    int deleteByPrimaryKey(Integer programId);

    int insert(Program record);

    int insertSelective(Program record);

    Program selectByPrimaryKey(Integer programId);

    int updateByPrimaryKeySelective(Program record);

    int updateByPrimaryKey(Program record);
}