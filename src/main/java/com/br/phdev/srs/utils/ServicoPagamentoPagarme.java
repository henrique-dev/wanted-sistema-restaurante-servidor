/*
 * Copyright (C) 2019 Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Goncalves Bacelar <henrique.phgb@gmail.com>, 11-09-2019
 */
package com.br.phdev.srs.utils;

import com.br.phdev.srs.exceptions.PaymentException;
import com.br.phdev.srs.models.Cartao;
import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.models.ItemPedidoFacil;
import com.br.phdev.srs.models.Pedido;
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

    public static final String apiKey = "ak_live_W0ndrvfrr5lQMAkP0UAGYxw0NgFPen";
    public static final String ENCRYPT_KEY = "ek_live_zIZULHGU8MABqVcfYhcySYc688O3bg";

    public ServicoPagamentoPagarme() {
        PagarMe.init(apiKey);
    }

    public Card salvarCartao(Cartao cartao) throws PagarMeException {
        Card c = new Card();
        c.setNumber(cartao.getNumero());
        c.setHolderName(cartao.getNome());
        c.setExpiresAt(cartao.getValidade());
        c.setCvv(cartao.getCvv());
        c.save();
        return c;
    }

    public Card getCartao(String hashID) throws PagarMeException {
        return new Card().find(hashID);
    }

    public Transaction gerarRembolso(Pedido pedido) throws PagarMeException {
        Transaction transaction = new Transaction().find(pedido.getToken());
        transaction.refund(Integer.parseInt(String.format("%.2f", pedido.getPrecoTotal()).replace(",", "").replace(".", "")));        
        return transaction;
    }    

    public Transaction criarPagamento(ExecutarPagamento pagamento) throws PaymentException {
        Transaction transaction = new Transaction();

        transaction.setPostbackUrl("https://headred.com.br/wanted/pagamentos/notificar-pagarme");

        try {

            Customer customer = new Customer();
            customer.setType(Customer.Type.INDIVIDUAL);
            customer.setExternalId("1001");
            customer.setName(pagamento.getCliente().getNome());
            //customer.setBirthday(paga);
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
            billing.setName(pagamento.getCliente().getNome());
            Address address = new Address();
            address.setCity(pagamento.getEndereco().getCidade());
            address.setCountry("br");
            address.setState("ap");
            address.setNeighborhood(pagamento.getEndereco().getBairro());
            address.setStreet(pagamento.getEndereco().getLogradouro());
            address.setZipcode(pagamento.getEndereco().getCep());
            address.setStreetNumber(pagamento.getEndereco().getNumero());
            billing.setAddress(address);

            Collection<Item> items = new ArrayList();
            for (ItemPedidoFacil ipf : pagamento.getPedido().getItens()) {
                Item item = new Item();
                System.out.println(ipf);
                item.setId(String.valueOf(ipf.getId()));
                item.setQuantity(ipf.getQuantidade());
                item.setTangible(Boolean.TRUE);
                item.setTitle(ipf.getNome());
                item.setUnitPrice(Integer.parseInt(String.format("%.2f", ipf.getPrecoTotal()).replace(",", "").replace(".", "")));
                items.add(item);
            }
            
            transaction.setBilling(billing);
            transaction.setItems(items);
            transaction.setPaymentMethod(Transaction.PaymentMethod.CREDIT_CARD);
            transaction.setAmount(Integer.parseInt(String.format("%.2f", pagamento.getPedido().getPrecoTotal()).replace(",", "").replace(".", "")));
            transaction.setCardId(pagamento.getTokenCartao());
            transaction.setCustomer(customer);
            
            System.out.println(transaction);
            
            transaction.save();
        } catch (Exception e) {
            throw new PaymentException(e);
        }
        return transaction;
    }

}
