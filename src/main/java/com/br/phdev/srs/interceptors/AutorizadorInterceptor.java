/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.phdev.srs.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author henrique
 */
public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();        
        System.out.println(uri);
        //new HttpUtils().showHeaders(request);
        if (request.getSession().getAttribute("usuario") != null) {
            return true;
        } else {
            if (uri.endsWith("cadastro/verificar-numero")
                    || uri.endsWith("cadastro/enviar-codigo")
                    || uri.endsWith("cadastro/validar-codigo")
                    || uri.endsWith("sessao/entrar")
                    || uri.endsWith("sessao/autenticar")
                    || uri.contains("imagens")
                    || uri.contains("notificacao")
                    || uri.contains("notificar")
                    || uri.contains("resources")                    
                    ) {
                return true;
            } else {
                if (uri.contains("cliente"))
                    response.sendRedirect("sem-autorizacao");
                else
                    response.sendRedirect("entrar");
                return false;
            }
        }
    }

}
