
import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.utils.ServicoPagamentoPagarme;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import me.pagar.model.Card;
import me.pagar.model.PagarMe;
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
            //Card c = p.salvarCartao();
            //ExecutarPagamento pag = new ExecutarPagamento();
            //pag.setTokenCartao("card_ck0g39zb500my4s6dg1xpdvpa");
            PagarMe.init("ak_test_VbiowWEdoiTrDtv6afJ7xmoYquJN9a");

            Card cards = new Card().find("card_ck19hhaz800xppo6dnphw4hv3");
            System.out.println(cards);
            //p.criarPagamento2(c.getId());
            //p.criarPagamento(pag);
            //System.out.println(c);
        } catch (PagarMeException e) {
            e.printStackTrace();
        }

    }

}
