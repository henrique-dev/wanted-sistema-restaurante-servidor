/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 24-08-2019
 */
package com.br.phdev.srs.controladores;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class ErrorController {
    
    @GetMapping("404")
    public String naoEncontrado(HttpServletRequest httpRequest) {
        return "404";
    }
 
    @GetMapping("errors")
    public String renderErrorPage(HttpServletRequest httpRequest) {        
        String errorMsg = "";
        int httpErrorCode = getErrorCode(httpRequest); 
        switch (httpErrorCode) {
            case 400: {
                errorMsg = "Http Error Code: 400. Bad Request";
                break;
            }
            case 401: {
                errorMsg = "Http Error Code: 401. Unauthorized";
                break;
            }
            case 404: {
                errorMsg = "Http Error Code: 404. Resource not found";
                return "redirect:/404";
            }
            case 500: {
                errorMsg = "Http Error Code: 500. Internal Server Error";
                break;
            }
        }
        return "404";
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
}