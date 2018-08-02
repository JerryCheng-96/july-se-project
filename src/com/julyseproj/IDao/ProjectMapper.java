package com.julyseproj.IDao;

import com.julyseproj.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {

    List<Project> selectAll();

    List<Project> selectByCreator(Integer engineerId);

    int selectMaxID();

    void setApprovedByID(@Param("projectID")Integer projectID, @Param("projectApproved")Byte projectApproved);

    int deleteByPrimaryKey(Integer projectId);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(Integer projectId);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKeyWithBLOBs(Project record);

    int updateByPrimaryKey(Project record);
}