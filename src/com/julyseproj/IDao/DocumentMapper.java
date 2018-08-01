package com.julyseproj.IDao;

import com.julyseproj.entity.Document;
import com.julyseproj.entity.DocumentKey;

import java.util.List;

public interface DocumentMapper {
    List<Document> selectAll();

    List<Document> selectByUploader(Integer studentID);

    List<Document> selectByGroup(Integer groupID);

    int deleteByPrimaryKey(DocumentKey key);

    int insert(Document record);

    int insertSelective(Document record);

    Document selectByPrimaryKey(DocumentKey key);

    int updateByPrimaryKeySelective(Document record);

    int updateByPrimaryKey(Document record);
}