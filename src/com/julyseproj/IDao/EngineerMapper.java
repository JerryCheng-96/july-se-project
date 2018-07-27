package com.julyseproj.IDao;

import com.julyseproj.entity.Engineer;

import java.util.List;

public interface EngineerMapper {

    List<Engineer> selectAll();

    int deleteByPrimaryKey(Integer engineerId);

    int insert(Engineer record);

    int insertSelective(Engineer record);

    Engineer selectByPrimaryKey(Integer engineerId);

    int updateByPrimaryKeySelective(Engineer record);

    int updateByPrimaryKey(Engineer record);
}