package com.julyseproj.utils;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class RequestExceptionResolver {
    public static void handle(Exception e, HttpServletResponse res){
        if (e instanceof IOException){
            res.setStatus(500);
        }else if(e instanceof DuplicateKeyException){
            res.setStatus(418);
        }else if(e instanceof DataIntegrityViolationException){
            res.setStatus(418);
        }else {
            res.setStatus(999);
        }
        return;
    }
}
