package com.julyseproj.IDao;

import com.julyseproj.entity.Document;
import com.julyseproj.entity.DocumentKey;

public interface DocumentMapper {
    int deleteByPrimaryKey(DocumentKey key);

    int insert(Document record);

    int insertSelective(Document record);

    Document selectByPrimaryKey(DocumentKey key);

    int updateByPrimaryKeySelective(Document record);

    int updateByPrimaryKey(Document record);
}