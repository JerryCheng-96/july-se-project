package com.julyseproj.IDao;

import com.julyseproj.entity.Student;
import java.util.*;

public interface StudentMapper {
    List<Student> selectAll();

    int deleteByPrimaryKey(Integer studentId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer studentId);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}