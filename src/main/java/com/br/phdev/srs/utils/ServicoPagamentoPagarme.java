/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 11-09-2019
 */
package com.br.phdev.srs.utils;

import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.models.ItemPedidoFacil;
import java.util.ArrayList;
import java.util.Collection;
import me.pagar.model.Address;
import me.pagar.model.Billing;
import me.pagar.model.Card;
import me.pagar.model.Customer;
import me.pagar.model.Document;
import me.pagar.model.Item;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.Shipping;
import me.pagar.model.Transaction;

/**
 *
 * @author Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 */
public class ServicoPagamentoPagarme {

    public static final String apiKey = "ak_test_VbiowWEdoiTrDtv6afJ7xmoYquJN9a";
    public static final String ENCRYPT_KEY = "ek_test_LJoeMvAv6o0pl4nfyTiVql2AHwsx49";

    public Card salvarCartao() throws PagarMeException {
        PagarMe.init(apiKey);
        Card cartao = new Card();
        cartao.setNumber("4018720572598048");
        cartao.setHolderName("Aardvark Silva");
        cartao.setExpiresAt("1122");
        cartao.setCvv(123);
        cartao.save();
        return cartao;
    }

    public Transaction criarPagamento(ExecutarPagamento pagamento) throws PagarMeException {
        PagarMe.init(apiKey);
        Transaction transaction = new Transaction();

        //transaction.setPostbackUrl("https://headred.com.br/wanted/pagamentos/notificar-pagarme");
        
        try {
            Customer customer = new Customer();
            customer.setType(Customer.Type.INDIVIDUAL);
            customer.setExternalId(String.valueOf(pagamento.getCliente().getId()));
            customer.setName(pagamento.getCliente().getNome());
            //customer.setBirthday(pagamento.getCliente().getda);
            customer.setEmail(pagamento.getCliente().getEmail());
            customer.setCountry("br");

            Collection<Document> documents = new ArrayList();
            Document document = new Document();
            document.setType(Document.Type.CPF);
            document.setNumber(pagamento.getCliente().getCpf());
            documents.add(document);
            customer.setDocuments(documents);

            Collection<String> phones = new ArrayList();
            phones.add(pagamento.getCliente().getTelefone());
            customer.setPhoneNumbers(phones);
            
            System.out.println(pagamento.getEndereco());

            Billing billing = new Billing();
            billing.setName(pagamento.getEndereco().getDescricao());
            Address address = new Address();
            address.setCity(pagamento.getEndereco().getCidade());
            address.setCountry("br");
            address.setState("ap");
            address.setNeighborhood(pagamento.getEndereco().getBairro());
            address.setStreet(pagamento.getEndereco().getLogradouro());
            address.setZipcode(pagamento.getEndereco().getCep().replace("-", ""));
            //address.setZipcode("68928313");
            address.setStreetNumber(pagamento.getEndereco().getNumero());
            billing.setAddress(address);

            Shipping shipping = new Shipping();
            shipping.setAddress(address);
            shipping.setName(pagamento.getEndereco().getDescricao());
            shipping.setFee(0);

            Collection<Item> items = new ArrayList();
            /*
            for (ItemPedidoFacil p : pagamento.getPedido().getItens()) {
                Item item = new Item();
                item.setId(String.valueOf(p.getId()));
                item.setQuantity(p.getQuantidade());
                item.setTangible(Boolean.TRUE);
                item.setTitle(p.getNome());
                //item.setUnitPrice(Integer.parseInt(String.valueOf(p.getPreco()).replace(".", "")));
                item.setUnitPrice(500);
                items.add(item);
            }*/

            transaction.setShipping(shipping);
            transaction.setBilling(billing);
            transaction.setItems(items);
            transaction.setPaymentMethod(Transaction.PaymentMethod.CREDIT_CARD);
            transaction.setAmount(4640);
            transaction.setCardId(pagamento.getTokenCartao());
            transaction.setCustomer(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transaction.save();
    }

}
