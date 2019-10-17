/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 11-08-2019
 */
package com.br.phdev.srs.utils;

import org.springframework.context.annotation.*;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
@ComponentScan
public class HtmlUtil {
    
    public static String botao2(String id, String descricao, String href, String classe, String icone) {
        return "<a id=\""+id+"\" name=\""+id+"\" href=\""+href+"\" class=\""+classe+"\">\n" +
                    "<span class=\"icon text-white-50\">\n" +
                    "<i class=\""+icone+"\"></i>\n" +
                    "</span>\n" +
                    "<span class=\"text\">"+descricao+"</span>\n" +
                    "</a>";
    }
    
    public static String botao(String id, String descricao, String href, String classe, String icone) {        
        return "ola mubndo";
    }
    
}
