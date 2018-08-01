package com.julyseproj.IDao;

import com.julyseproj.entity.Task;
import java.util.*;

public interface TaskMapper {
    List<Task> selectAll();

    List<Task> selectByEngineer(Integer engineerId);

    int deleteByPrimaryKey(Integer taskId);

    int insert(Task record);

    int insertSelective(Task record);

    Task selectByPrimaryKey(Integer taskId);

    int updateByPrimaryKeySelective(Task record);

    int updateByPrimaryKey(Task record);
}