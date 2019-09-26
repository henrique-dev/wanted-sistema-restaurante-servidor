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

    public Transaction criarPagamento2(String token) throws PagarMeException {
        PagarMe.init(apiKey);
        Transaction transaction = new Transaction();
        try {

            Customer customer = new Customer();
            customer.setType(Customer.Type.INDIVIDUAL);
            customer.setExternalId("1001");
            customer.setName("Phineas Flynn");
            customer.setBirthday("1999-07-09");
            customer.setEmail("phineas@threestatearea.com");
            customer.setCountry("br");

            Collection<Document> documents = new ArrayList();
            Document document = new Document();
            document.setType(Document.Type.CPF);
            document.setNumber("77551442758");
            documents.add(document);
            customer.setDocuments(documents);

            Collection<String> phones = new ArrayList();
            phones.add("+5511982657575");
            customer.setPhoneNumbers(phones);

            Billing billing = new Billing();
            billing.setName("Phineas Flynn");
            Address address = new Address();
            address.setCity("Santo Andre");
            address.setCountry("br");
            address.setState("sp");
            address.setNeighborhood("Parque Miami");
            address.setStreet("Rua Rio Jari");
            address.setZipcode("09133180");
            address.setStreetNumber("7");
            billing.setAddress(address);

            Shipping shipping = new Shipping();
            shipping.setAddress(address);
            shipping.setName("Phineas Flynn");
            shipping.setFee(3200);

            Collection<Item> items = new ArrayList();
            Item item = new Item();
            item.setId("OX890");
            item.setQuantity(12);
            item.setTangible(Boolean.TRUE);
            item.setTitle("Rockets");
            item.setUnitPrice(120);

            transaction.setShipping(shipping);
            transaction.setBilling(billing);
            transaction.setItems(items);
            transaction.setPaymentMethod(Transaction.PaymentMethod.CREDIT_CARD);
            transaction.setAmount(4640);
            transaction.setCardId(token);
            transaction.setCustomer(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transaction.save();
    }

    public Transaction criarPagamento(ExecutarPagamento pagamento) {
        PagarMe.init(apiKey);
        Transaction transaction = new Transaction();

        //transaction.setPostbackUrl("https://headred.com.br/wanted/pagamentos/notificar-pagarme");
        try {

            Customer customer = new Customer();
            customer.setType(Customer.Type.INDIVIDUAL);
            customer.setExternalId("1001");
            customer.setName("Phineas Flynn");
            customer.setBirthday("1999-07-09");
            customer.setEmail("phineas@threestatearea.com");
            customer.setCountry("br");

            Collection<Document> documents = new ArrayList();
            Document document = new Document();
            document.setType(Document.Type.CPF);
            document.setNumber("77551442758");
            documents.add(document);
            customer.setDocuments(documents);

            Collection<String> phones = new ArrayList();
            phones.add("+5511982657575");
            customer.setPhoneNumbers(phones);

            Billing billing = new Billing();
            billing.setName("Phineas Flynn");
            Address address = new Address();
            address.setCity("Santo Andre");
            address.setCountry("br");
            address.setState("sp");
            address.setNeighborhood("Parque Miami");
            address.setStreet("Rua Rio Jari");
            address.setZipcode("09133180");
            address.setStreetNumber("7");
            billing.setAddress(address);

            Shipping shipping = new Shipping();
            shipping.setAddress(address);
            shipping.setName("Phineas Flynn");
            shipping.setFee(3200);

            Collection<Item> items = new ArrayList();
            Item item = new Item();
            item.setId("OX890");
            item.setQuantity(12);
            item.setTangible(Boolean.TRUE);
            item.setTitle("Rockets");
            item.setUnitPrice(120);

            transaction.setShipping(shipping);
            transaction.setBilling(billing);
            transaction.setItems(items);
            transaction.setPaymentMethod(Transaction.PaymentMethod.CREDIT_CARD);
            transaction.setAmount(4640);
            System.out.println("Token do cartao: " + pagamento.getTokenCartao());
            transaction.setCardId(pagamento.getTokenCartao());
            transaction.setCustomer(customer);
            transaction.save();
        } catch (PagarMeException e) {
            e.printStackTrace();
        }
        return transaction;
    }

}
