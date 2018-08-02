package com.julyseproj.IDao;

import com.julyseproj.entity.Program;
import com.julyseproj.entity.view.ProgramWithAuthor;

import java.util.List;

public interface ProgramMapper {
    List<Program> selectAll();

    List<ProgramWithAuthor> selectAllWithAuthor();

    List<Program> selectByAuthor(Integer engineerId);

    int selectMaxID();

    int deleteByPrimaryKey(Integer programId);

    int insert(Program record);

    int insertSelective(Program record);

    Program selectByPrimaryKey(Integer programId);

    int updateByPrimaryKeySelective(Program record);

    int updateByPrimaryKey(Program record);
}