package com.julyseproj.IDao;

import com.julyseproj.entity.Project;
import java.util.List;

public interface ProjectMapper {

    List<Project> selectAll();

    int deleteByPrimaryKey(Integer projectId);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer projectId);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKeyWithBLOBs(Project record);

    int updateByPrimaryKey(Project record);
}