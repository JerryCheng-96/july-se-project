package com.julyseproj.IDao;

import com.julyseproj.entity.Log;
import java.util.*;

public interface LogMapper {
    List<Log> selectAll();

    List<Log> selectByUploader(Integer studentID);

    List<Log> selectByGroup(Integer groupID);

    int selectMaxID();

    int deleteByPrimaryKey(Integer logId);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKeyWithBLOBs(Log record);

    int updateByPrimaryKey(Log record);
}