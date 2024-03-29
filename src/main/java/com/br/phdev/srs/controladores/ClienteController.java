/*
 * Copyright (C) Paulo Henrique Goncalves Bacelar, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Paulo Henrique Gonacalves Bacelar <henrique.phgb@gmail.com>, Dezembro 2018
 */
package com.br.phdev.srs.controladores;

import com.br.phdev.srs.daos.ClienteDAO;
import com.br.phdev.srs.daos.RepositorioProdutos;
import com.br.phdev.srs.exceptions.DAOException;
import com.br.phdev.srs.exceptions.PaymentException;
import com.br.phdev.srs.models.Carrinho;
import com.br.phdev.srs.models.Cartao;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.ConfirmaPedido;
import com.br.phdev.srs.models.ConfirmacaoPedido;
import com.br.phdev.srs.models.CupomDesconto;
import com.br.phdev.srs.models.CupomDesconto2;
import com.br.phdev.srs.models.Endereco;
import com.br.phdev.srs.models.ExecutarPagamento;
import com.br.phdev.srs.models.FormaPagamento;
import com.br.phdev.srs.models.Foto;
import com.br.phdev.srs.models.Genero;
import com.br.phdev.srs.models.ListaItens;
import com.br.phdev.srs.models.Item;
import com.br.phdev.srs.models.ItemPedido;
import com.br.phdev.srs.models.Pedido;
import com.br.phdev.srs.models.Pedido2;
import com.br.phdev.srs.models.TokenAlerta;
import com.br.phdev.srs.models.Mensagem;
import com.br.phdev.srs.models.PerguntaSeguranca;
import com.br.phdev.srs.models.RedefinicaoSenha;
import com.br.phdev.srs.models.Usuario;
import com.br.phdev.srs.utils.ServicoArmazenamento;
import com.br.phdev.srs.utils.ServicoPagamentoPagSeguro;
import com.br.phdev.srs.utils.ServicoPagamentoPagarme;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import me.pagar.model.Card;
import me.pagar.model.PagarMeException;
import me.pagar.model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Paulo Henrique Gonçalves Bacelar <henrique.phgb@gmail.com>
 */
@Controller
public class ClienteController {

    private ClienteDAO dao;

    @Autowired
    public ClienteController(ClienteDAO dao) {
        this.dao = dao;
    }

    @PostMapping("cliente/cadastrar-token-alerta")
    public ResponseEntity<Mensagem> cadastrarTokenAlerta(@RequestBody TokenAlerta token, HttpSession sessao) {
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.cadastrarTokenAlerta(cliente, token.getToken());
            mensagem.setCodigo(100);
            mensagem.setDescricao("Token de alerta cadastrado");
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.OK);
    }

    @RequestMapping("cliente/sem-autorizacao")
    public ResponseEntity<Mensagem> semAutorizacao() {
        Mensagem mensagem = new Mensagem();
        mensagem.setCodigo(401);
        mensagem.setDescricao("Sem autorização para acessar este recurso");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, HttpStatus.UNAUTHORIZED);
    }

    @PostMapping("cliente/meu-perfil")
    public ResponseEntity<Cliente> meuPerfil(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Cliente cliente = null;
        try {
            cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.getCliente(cliente);
        } catch (DAOException e) {
            e.printStackTrace();
            cliente = null;
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(cliente, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/principal")
    public ResponseEntity<ListaItens> principal(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ListaItens listaItens = null;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            listaItens = new ListaItens();
            listaItens.setItens(this.dao.getItensFavoritos(cliente).getItens());
            listaItens.setItensDia(this.dao.getItensDia(cliente).getItensDia());
            listaItens.setItensPromocao(this.dao.getItensDia(cliente).getItensDia());
            listaItens.setGeneros(this.dao.getGeneros());
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaItens, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/itens-dia")
    public ResponseEntity<ListaItens> getItensDia(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ListaItens listaItens = null;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            listaItens = this.dao.getItensDia(cliente);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaItens, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/cadastrar-cupom")
    public ResponseEntity<Mensagem> cadastrarCupom(@RequestBody CupomDesconto cupom, HttpSession sessao) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            mensagem = this.dao.cadastrarCupomDesconto(cliente, cupom);
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/listar-cupons")
    public ResponseEntity<List<CupomDesconto2>> listarCupons(HttpSession sessao) {
        HttpStatus httpStatus = HttpStatus.OK;
        List<CupomDesconto2> cuponsDescontos = new ArrayList<>();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            cuponsDescontos = this.dao.getCuponsDescontos(cliente);
        } catch (DAOException e) {

        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(cuponsDescontos, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/ativar-cupom")
    public ResponseEntity<Mensagem> ativarCupom(@RequestBody CupomDesconto cupom, HttpSession sessao) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            mensagem = this.dao.ativarCupomDesconto(cliente, cupom);
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/listar-favoritos")
    public ResponseEntity<ListaItens> getFavoritos(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ListaItens listaItens = null;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            listaItens = this.dao.getItensFavoritos(cliente);
        } catch (DAOException e) {

        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaItens, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/cadastrar-favorito")
    public ResponseEntity<Mensagem> cadastrarEndereco(@RequestBody Item item, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.cadastrarItemFavorito(cliente, item);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Item favoritado com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/remover-favorito")
    public ResponseEntity<Mensagem> removerEndereco(@RequestBody Item item, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.removerItemFavorito(cliente, item);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Item desfavoritado com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/listar-generos")
    public ResponseEntity<List<Genero>> getGeneros(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        List<Genero> listaGeneros = null;
        try {

            listaGeneros = this.dao.getGeneros();
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaGeneros, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/listar-itens")
    public ResponseEntity<ListaItens> getPratos(@RequestBody Genero genero, Integer pg, String buscar, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ListaItens listaItens = null;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            listaItens = this.dao.getItens(cliente, genero, (pg == null ? 0 : pg), buscar);
            if (listaItens != null) {
                listaItens.setFrete(RepositorioProdutos.getInstancia().frete);
            }
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaItens, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/info-item")
    public ResponseEntity<Item> infoPrato(@RequestBody Item item, HttpSession sessao, HttpServletRequest req) {
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.getItem(item, cliente);
        } catch (DAOException e) {
            e.printStackTrace();
            item = null;
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(item, httpHeaders, HttpStatus.OK);
    }

    @PostMapping(value = "cliente/existe-prepedido")
    public ResponseEntity<Mensagem> existePrepedido(HttpSession sessao, HttpServletRequest req) {
        Mensagem mensagem = new Mensagem();
        HttpStatus httpStatus = HttpStatus.OK;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            if (this.dao.possuiPrePredido(cliente)) {
                mensagem.setCodigo(100);
                mensagem.setDescricao("Existe um pré pedido");
            } else {
                mensagem.setCodigo(101);
                mensagem.setDescricao("Não existe um pré pedido");
            }
        } catch (DAOException e) {
            e.printStackTrace();
            mensagem.setCodigo(200);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/recuperar-prepedido")
    public ResponseEntity<List<ItemPedido>> recuperarPrepedido(HttpSession sessao, HttpServletRequest req) throws Exception {
        HttpStatus httpStatus = HttpStatus.OK;
        List<ItemPedido> itens = null;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            itens = this.dao.recuperarPrePredido(cliente);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(itens, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/remover-prepedido")
    public ResponseEntity<Mensagem> removerPrepedido(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.removerPrepedido(cliente);
            sessao.removeAttribute("pre-pedido-itens");
            sessao.removeAttribute("pre-pedido-preco");
            mensagem.setCodigo(100);
        } catch (DAOException e) {
            mensagem.setCodigo(101);
            mensagem.setDescricao(e.getMessage());
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/refazer-pedido")
    public ResponseEntity<ConfirmaPedido> refazerPedido(HttpSession sessao, HttpServletRequest req, @RequestBody Pedido pedido) throws Exception {
        HttpStatus httpStatus = HttpStatus.OK;
        ConfirmaPedido confirmaPedido = null;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            confirmaPedido = this.dao.refazerPedido(cliente, pedido);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(confirmaPedido, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/carrinho")
    public ResponseEntity<Carrinho> carrinho(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Carrinho carrinho = new Carrinho();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            List<Endereco> enderecos = this.dao.getEnderecos(cliente);
            List<FormaPagamento> formaPagamentos = this.dao.getFormasPagamento(cliente);
            carrinho.setFormaPagamentos(formaPagamentos);
            carrinho.setEnderecos(enderecos);
            carrinho.setFrete(new BigDecimal(RepositorioProdutos.getInstancia().frete));
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(carrinho, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/pre-confirmar-pedido")
    public ResponseEntity<ConfirmaPedido> preConfirmaPedido(@RequestBody ConfirmaPedido confirmaPedido, HttpSession sessao) {
        HttpStatus httpStatus = HttpStatus.OK;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            if (!this.dao.existePedidoAberto(cliente)) {
                confirmaPedido.setCupom(this.dao.verificarCupomDesconto(cliente));
                this.dao.inserirPrecos(confirmaPedido);
                confirmaPedido.setFrete(RepositorioProdutos.getInstancia().frete);
                confirmaPedido.calcularPrecoTotal(RepositorioProdutos.getInstancia().frete);
                sessao.setAttribute("pre-pedido-itens", confirmaPedido.getItens());
                sessao.setAttribute("pre-pedido-preco", confirmaPedido.getPrecoTotal());
                sessao.setAttribute("pre-pedido-cupom", confirmaPedido.getCupom());
                confirmaPedido.setMensagem(new Mensagem(100, "Pedido pré-confirmado"));
            } else {
                confirmaPedido.setMensagem(new Mensagem(101, "Já existe um pedido em andamento"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(confirmaPedido, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/confirmar-pedido")
    public ResponseEntity<ConfirmacaoPedido> confirmarPedido(@RequestBody ConfirmaPedido confirmaPedido, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ConfirmacaoPedido confirmacaoPedido = new ConfirmacaoPedido();
        Pedido pedido;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            if (!this.dao.existePedidoAberto(cliente)) {
                if (sessao.getAttribute("pre-pedido-preco") != null && sessao.getAttribute("pre-pedido-itens") != null) {
                    pedido = new Pedido();
                    pedido.setEndereco(confirmaPedido.getEnderecos().get(0));
                    pedido.setFormaPagamento(confirmaPedido.getFormaPagamentos().get(0));
                    pedido.convertItemParaItemFacil((List<ItemPedido>) sessao.getAttribute("pre-pedido-itens"));
                    if (sessao.getAttribute("pre-pedido-cupom") != null) {
                        pedido.setCupom((CupomDesconto) sessao.getAttribute("pre-pedido-cupom"));
                    }
                    pedido.setPrecoTotal((Double) sessao.getAttribute("pre-pedido-preco"));
                    pedido.setObservacaoEntrega(confirmaPedido.getObservacaoEntrega());
                    pedido.setFrete(RepositorioProdutos.getInstancia().frete);

                    switch (confirmaPedido.getFormaPagamentos().get(0).getId()) {
                        case 0:
                            pedido.setEstado(4);
                            this.dao.inserirPedido(pedido, cliente, null);
                            confirmacaoPedido.setStatus(0);
                            sessao.setAttribute("pre-pedido-itens", null);
                            sessao.setAttribute("pre-pedido-preco", null);
                            sessao.setAttribute("pre-pedido-cupom", null);
                            break;
                        default:
                            ServicoPagamentoPagarme pagarme = new ServicoPagamentoPagarme();
                            ExecutarPagamento pagamento2 = new ExecutarPagamento();
                            pagamento2.setCliente(this.dao.getCliente(cliente));
                            pagamento2.setPedido(pedido);
                            pagamento2.setEndereco(this.dao.getEndereco(confirmaPedido.getEnderecos().get(0), cliente));
                            FormaPagamento formaPagamento = this.dao.getFormaPagamento(cliente, new FormaPagamento(confirmaPedido.getFormaPagamentos().get(0).getId()));
                            System.out.println("Preparando para gerar pagamento com pagarme: " + confirmaPedido.getFormaPagamentos().get(0).getId());
                            System.out.println(formaPagamento);
                            if (formaPagamento.getHashId() != null) {
                                pagamento2.setTokenCartao(formaPagamento.getHashId());
                                Transaction t = pagarme.criarPagamento(pagamento2);
                                System.out.println("Pagamento criado");

                                pedido.setEstado(1);
                                this.dao.inserirPedido(pedido, cliente, String.valueOf(t.getId()));
                                confirmacaoPedido.setStatus(0);
                                sessao.setAttribute("pre-pedido-itens", null);
                                sessao.setAttribute("pre-pedido-preco", null);
                                sessao.setAttribute("pre-pedido-cupom", null);
                            } else {
                                confirmacaoPedido.setStatus(101);
                            }
                            break;
                    }
                }
            } else {
                confirmacaoPedido.setStatus(101);
            }
        } catch (DAOException | PaymentException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(confirmacaoPedido, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/listar-pedidos")
    public ResponseEntity<List<Pedido2>> listarPedidos(Integer pg, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        List<Pedido2> pedidos = null;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            pedidos = this.dao.getPedidos(cliente, (pg == null ? 0 : pg));
        } catch (DAOException | IOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(pedidos, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/info-pedido")
    public ResponseEntity<Pedido2> listarPedidos(@RequestBody Pedido2 pedido, HttpSession sessao) {
        HttpHeaders httpHeaders = new HttpHeaders();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.getPedido(pedido, cliente);
        } catch (DAOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(pedido, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("cliente/info-entrega")
    public ResponseEntity<List<Pedido>> infoEntrega() {
        return null;
    }

    @PostMapping("cliente/listar-enderecos")
    public ResponseEntity<List<Endereco>> listarEnderecos(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        List<Endereco> enderecos = null;
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            enderecos = this.dao.getEnderecos(cliente);
        } catch (DAOException e) {
            //e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(enderecos, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/cadastrar-endereco")
    public ResponseEntity<Mensagem> cadastrarEndereco(@RequestBody Endereco endereco, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.cadastrarEndereco(cliente, endereco);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Endereço cadastrado com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/remover-endereco")
    public ResponseEntity<Mensagem> removerEndereco(@RequestBody Endereco endereco, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.removerEndereco(cliente, endereco);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Endereço removido com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/favoritar-endereco")
    public ResponseEntity<Mensagem> favoritarEndereco(@RequestBody Endereco endereco, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.favoritarEndereco(cliente, endereco);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Endereço favoritado com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/preparar-forma-pagamento")
    public ResponseEntity<Mensagem> cadastrarFormaPagamento() {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        mensagem.setCodigo(100);
        mensagem.setDescricao(ServicoPagamentoPagarme.ENCRYPT_KEY);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/cadastrar-forma-pagamento")
    public ResponseEntity<Mensagem> cadastrarFormaPagamento(@RequestBody Cartao cartao, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            cartao.setDescricao("Cartão de crédito - Pagarme");
            try {
                ServicoPagamentoPagarme sp = new ServicoPagamentoPagarme();
                Card c = sp.salvarCartao(cartao);
                cartao.setDescricao("**** **** **** " + c.getLastDigits());
                cartao.setBandeira(c.getBrand().name());
                cartao.setHashId(c.getId());
            } catch (PagarMeException e) {
                e.printStackTrace();
            }
            this.dao.cadastrarFormaPagamento(cliente, cartao);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Forma de pagamento cadastrado com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/remover-forma-pagamento")
    public ResponseEntity<Mensagem> removerFormaPagamento(@RequestBody Endereco endereco, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.removerEndereco(cliente, endereco);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Endereço removido com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/listar-formas-pagamento")
    public ResponseEntity<List<FormaPagamento>> listarFormasPagamento(HttpSession sessao) {
        List<FormaPagamento> formaPagamentos = null;
        try {

            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            formaPagamentos = this.dao.getFormasPagamento(cliente);
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(formaPagamentos, httpHeaders, HttpStatus.OK);
    }

    @PostMapping("cliente/favoritar-forma-pagamento")
    public ResponseEntity<Mensagem> favoritarFormaPagamento(@RequestBody FormaPagamento pagamento, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.favoritarFormaPagamento(cliente, pagamento);
            mensagem.setCodigo(100);
            mensagem.setDescricao("Forma de pagamento favoritada com sucesso");
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/redefinir-senha")
    public ResponseEntity<Mensagem> redefinirSenha(@RequestBody RedefinicaoSenha redefinicaoSenha, HttpSession sessao) {
        HttpStatus httpStatus = HttpStatus.OK;
        Mensagem mensagem = new Mensagem();
        try {
            Usuario usuario = (Usuario) sessao.getAttribute("usuario");
            if (this.dao.alterarSenha(redefinicaoSenha, usuario)) {
                mensagem.setCodigo(100);
                mensagem.setDescricao("Senha alterada com sucesso");
            } else {
                mensagem.setCodigo(101);
                mensagem.setDescricao("Erro ao alterar senha");
            }
        } catch (DAOException e) {
            mensagem.setCodigo(e.codigo);
            mensagem.setDescricao(e.getMessage());
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(mensagem, httpHeaders, httpStatus);
    }

    @GetMapping("cliente/anunciantes")
    @ResponseBody
    public ResponseEntity<byte[]> anunciantes() {
        byte[] bytes = null;
        Foto foto = new Foto();
        foto.setId(0);
        bytes = new ServicoArmazenamento().carregar(foto);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }

    @GetMapping("imagens/{idArquivo}")
    @ResponseBody
    public ResponseEntity<byte[]> image(@PathVariable int idArquivo) {
        byte[] bytes = null;
        Foto foto = new Foto();
        foto.setId(idArquivo);
        bytes = new ServicoArmazenamento().carregar(foto);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
    }

}
