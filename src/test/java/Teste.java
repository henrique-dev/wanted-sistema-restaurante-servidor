
import com.br.phdev.srs.utils.ServicoPagamentoPagarme;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import me.pagar.model.Card;
import me.pagar.model.PagarMeException;
import me.pagar.model.Transaction;

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

        ServicoPagamentoPagarme p = new ServicoPagamentoPagarme();
        try {
            Card c = p.salvarCartao();            
            System.out.println(c);
        } catch (PagarMeException e) {
            e.printStackTrace();
        }

    }

}
