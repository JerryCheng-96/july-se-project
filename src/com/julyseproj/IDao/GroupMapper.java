package com.julyseproj.IDao;

import com.julyseproj.entity.Group;
import com.julyseproj.entity.view.GroupWithProject;

import java.util.List;

public interface GroupMapper {
    List<Group> selectAll();

    List<Group> selectByClass(Integer classId);

    List<Group> selectByProject(Integer projectId);

    List<GroupWithProject> selectByProjectWithName(Integer projectId);

    int deleteByPrimaryKey(Integer groupId);

    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
}