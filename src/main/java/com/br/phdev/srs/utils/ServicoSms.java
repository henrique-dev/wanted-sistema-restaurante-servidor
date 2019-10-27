/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.phdev.srs.utils;

import com.twilio.Twilio;
import com.twilio.exception.ApiException;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class ServicoSms {
    
    private static final String ACCOUNT_SID = "AC3d4416535a462a996a081251985f1094";
    private static final String AUTH_TOKEN = "05fa8c5e7f6df0166287430633645864";

    public void enviarMensagem(String numero, String msg) {
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
            Message sms = Message.creator(new PhoneNumber(numero), new PhoneNumber("+12084178988"),msg).create();
        } catch (ApiException e) {
            e.printStackTrace();
        }
    }    

}
