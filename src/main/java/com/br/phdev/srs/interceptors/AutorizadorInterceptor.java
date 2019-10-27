/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.phdev.srs.interceptors;

import com.br.phdev.srs.daos.SessaoDAO;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author henrique
 */
public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

    private SessaoDAO dao;

    @Autowired
    public AutorizadorInterceptor(SessaoDAO dao) {
        this.dao = dao;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        //System.out.println(uri + " - " + request.getSession().getId());
        if (request.getSession().getAttribute("usuario") != null) {
            return true;
        } else if (request.getSession().getAttribute("admin") != null) {
            return true;
        } else {
            if (uri.endsWith("cadastro/verificar-numero")
                    || uri.endsWith("cadastro/enviar-codigo")
                    || uri.endsWith("cadastro/validar-codigo")
                    || uri.endsWith("sessao/entrar")
                    
                    || uri.endsWith("teste")
                    
                    || uri.endsWith("pagamentos/notificar-pagarme")                    
                    
                    || uri.endsWith("sessao/autenticar")
                    || uri.endsWith("sessao/autenticar-2")
                    || uri.endsWith("sessao/entrar")
                    || uri.endsWith("sem-autorizacao")
                    || uri.contains("imagens")
                    || uri.contains("notificacao")
                    || uri.contains("notificar")
                    || uri.contains("resources")) {
                return true;
            } else {
                if (uri.contains("cliente")) {
                    if (validarSessao(request)) {
                        return true;
                    }
                    response.sendRedirect("sem-autorizacao");
                } else {
                    response.sendRedirect("/wanted/sessao/entrar");
                }
                return false;
            }
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView); //To change body of generated methods, choose Tools | Templates        
    }

    private boolean validarSessao(HttpServletRequest request) throws DAOException {
        String usuario = request.getHeader("h-usuario");
        String telefone = request.getHeader("h-passe");
        String segredo = request.getHeader("h-segredo");
        Cliente cliente = this.dao.verificarTokenLogin(telefone, usuario, segredo);
        if (cliente != null) {
            request.getSession().setAttribute("cliente", cliente);
            request.getSession().setAttribute("usuario", new Usuario(cliente.getId()));
            return true;
        }
        return false;
    }

}
