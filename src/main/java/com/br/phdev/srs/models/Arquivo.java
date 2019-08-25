/* Copyright (C) HeadRed, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gona�alves Bacelar <henrique.phgb@gmail.com>, Agosto 2018
 */
package com.br.phdev.srs.models;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar
 */
public class Arquivo {

    private Long id;
    private MultipartFile multipartFile;

    public Arquivo() {
    }

    public Arquivo(Long id, MultipartFile multipartFile) {
        this.id = id;
        this.multipartFile = multipartFile;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }

}
