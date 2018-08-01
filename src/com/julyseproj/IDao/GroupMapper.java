package com.julyseproj.IDao;

import com.julyseproj.entity.Group;

import java.util.List;

public interface GroupMapper {
    List<Group> selectAll();

    List<Group> selectByClass(Integer classId);

    List<Group> selectByProject(Integer projectId);

    int deleteByPrimaryKey(Integer groupId);

    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
}