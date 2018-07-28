package com.julyseproj.service;

import com.julyseproj.entity.Engineer;
import org.springframework.mock.web.MockHttpServletResponse;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

public interface EngineerService {
    public List<Engineer> getAllEngineer();
    public String getAllEngineerJson(int page, int maxrow, HttpServletResponse res);
}
