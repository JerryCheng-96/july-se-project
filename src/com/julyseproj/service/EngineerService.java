package com.julyseproj.service;

import com.julyseproj.entity.Engineer;
import java.util.List;

public interface EngineerService {
    public List<Engineer> getAllEngineer();
    public String getAllEngineerJson(int page,int maxrow);
}
