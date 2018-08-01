package com.julyseproj.IDao;

import com.julyseproj.entity.Class;
import java.util.*;

public interface ClassMapper {
    List<Class> selectAll();

    List<Class> selectByManager(Integer engineerId);

    List<Class> selectByProgram(Integer programId);

    int deleteByPrimaryKey(Integer classId);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(Integer classId);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
}