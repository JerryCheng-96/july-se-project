package com.julyseproj.IDao;

import com.julyseproj.entity.Student;
import com.julyseproj.entity.StudentAccount;

public interface StudentAccountMapper {
    StudentAccount selectByOwner(Integer studentID);

    int deleteByPrimaryKey(Integer accountSId);

    int insert(StudentAccount record);

    int insertSelective(StudentAccount record);

    StudentAccount selectByPrimaryKey(Integer accountSId);

    int updateByPrimaryKeySelective(StudentAccount record);

    int updateByPrimaryKey(StudentAccount record);
}