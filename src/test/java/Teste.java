
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.Complemento;
import com.br.phdev.srs.models.Foto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.net.Inet4Address;
import java.net.Socket;
import java.net.SocketAddress;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
public class Teste {

    public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {

        String alvo = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadadadadaaaaaaaaddddddddddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        String chave = "ZXDas79mby@";
        String textoParaHash = alvo
                + Calendar.getInstance().getTime().toString() + chave;
        MessageDigest algoritmo = MessageDigest.getInstance("SHA-256");
        byte textoDigerido[] = algoritmo.digest(textoParaHash.getBytes("UTF-8"));
        int tamanho = 5;
        {
            StringBuilder token = new StringBuilder();
            for (int i = 0; i < textoDigerido.length; i = i + (64 / tamanho)) {
                token.append(String.format("%02X", 0xFF & textoDigerido[i]));
            }            
            System.out.println(token.toString().substring(0, tamanho));
        }

    }

}
