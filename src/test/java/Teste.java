
import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.utils.ServicoPagamentoPagarme;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import me.pagar.model.Card;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.PagarMeRequest;
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
        
        System.out.println(new BigDecimal(5.5).toString());
        
        try {
            //Card c = p.salvarCartao();
            //System.out.println(c);
            //ExecutarPagamento pag = new ExecutarPagamento();
            //pag.setTokenCartao(c.getId());
            //System.out.println(c.getId());
            Card card = p.getCartao("card_ck1fv82cd08oupo6doqvza0xl");
            System.out.println(card);
            //System.out.println(cards);
            //p.criarPagamento2(c.getId());
            //Transaction t = p.criarPagamento(pag);
            //System.out.println(t);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
