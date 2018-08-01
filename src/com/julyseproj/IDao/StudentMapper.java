package com.julyseproj.IDao;

import com.julyseproj.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    List<Student> selectAll();

    List<Student>selectByClass(Integer classId);

    List<Student>selectByGroup(@Param("classId")Integer classId, @Param("groupId")Integer groupId);

    int deleteByPrimaryKey(Integer studentId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer studentId);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}