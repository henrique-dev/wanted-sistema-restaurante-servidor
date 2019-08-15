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
import com.br.phdev.srs.models.Carrinho;
import com.br.phdev.srs.models.Cliente;
import com.br.phdev.srs.models.ConfirmaPedido;
import com.br.phdev.srs.models.ConfirmaPedidoFacil;
import com.br.phdev.srs.models.ConfirmacaoPedido;
import com.br.phdev.srs.models.Endereco;
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
import com.br.phdev.srs.utils.ServicoArmazenamento;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
            if (validarSessao(req)) {
                cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.getCliente(cliente);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                listaItens = new ListaItens();
                listaItens.setItens(this.dao.getItensFavoritos(cliente).getItens());
                listaItens.setItensDia(this.dao.getItensDia(cliente).getItensDia());
                listaItens.setGeneros(this.dao.getGeneros());
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                listaItens = this.dao.getItensDia(cliente);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(listaItens, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/listar-favoritos")
    public ResponseEntity<ListaItens> getFavoritos(HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ListaItens listaItens = null;
        try {
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                listaItens = this.dao.getItensFavoritos(cliente);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
            e.printStackTrace();
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.cadastrarItemFavorito(cliente, item);
                mensagem.setCodigo(100);
                mensagem.setDescricao("Item favoritado com sucesso");
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.removerItemFavorito(cliente, item);
                mensagem.setCodigo(100);
                mensagem.setDescricao("Item desfavoritado com sucesso");
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                listaGeneros = this.dao.getGeneros();
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                listaItens = this.dao.getItens(cliente, genero, (pg == null ? 0 : pg), buscar);
                if (listaItens != null) {
                    listaItens.setFrete(RepositorioProdutos.getInstancia().frete);
                }
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.getItem(item, cliente);
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                if (this.dao.possuiPrePredido(cliente)) {
                    mensagem.setCodigo(100);
                    mensagem.setDescricao("Existe um pré pedido");
                } else {
                    mensagem.setCodigo(101);
                    mensagem.setDescricao("Não existe um pré pedido");
                }
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                itens = this.dao.recuperarPrePredido(cliente);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.removerPrepedido(cliente);
                sessao.removeAttribute("pre-pedido-itens");
                sessao.removeAttribute("pre-pedido-preco");
                mensagem.setCodigo(100);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                confirmaPedido = this.dao.refazerPedido(cliente, pedido);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                List<Endereco> enderecos = this.dao.getEnderecos(cliente);
                List<FormaPagamento> formaPagamentos = this.dao.getFormasPagamento(cliente);
                carrinho.setFormaPagamentos(formaPagamentos);
                carrinho.setEnderecos(enderecos);
                carrinho.setFrete(new BigDecimal(RepositorioProdutos.getInstancia().frete));
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(carrinho, httpHeaders, httpStatus);
    }

    @PostMapping(value = "cliente/pre-confirmar-pedido")
    public ResponseEntity<ConfirmaPedido> preConfirmaPedido(@RequestBody ConfirmaPedido confirmaPedido, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        try {
            
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            if (validarSessao(req)) {
                if (!this.dao.existePedidoAberto(cliente)) {
                    this.dao.inserirPrecos(confirmaPedido);
                    confirmaPedido.calcularPrecoTotal(RepositorioProdutos.getInstancia().frete);
                    sessao.setAttribute("pre-pedido-itens", confirmaPedido.getItens());
                    sessao.setAttribute("pre-pedido-preco", confirmaPedido.getPrecoTotal());
                    confirmaPedido.setMensagem(new Mensagem(100, "Pedido pré-confirmado"));
                } else {
                    confirmaPedido.setMensagem(new Mensagem(101, "Já existe um pedido em andamento"));
                }
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
            e.printStackTrace();
            confirmaPedido = null;
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(confirmaPedido, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/confirmar-pedido")
    public ResponseEntity<ConfirmacaoPedido> confirmarPedido(@RequestBody ConfirmaPedido confirmaPedido, HttpSession sessao, HttpServletRequest req) {
        HttpStatus httpStatus = HttpStatus.OK;
        ConfirmacaoPedido confirmacaoPedido = new ConfirmacaoPedido();
        Pedido pedido = null;
        try {
            
            if (validarSessao(req)) {
                if (sessao.getAttribute("pre-pedido-preco") != null && sessao.getAttribute("pre-pedido-itens") != null) {
                    Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                    pedido = new Pedido();
                    pedido.setEndereco(confirmaPedido.getEnderecos().get(0));
                    pedido.setFormaPagamento(confirmaPedido.getFormaPagamentos().get(0));
                    pedido.convertItemParaItemFacil((List<ItemPedido>) sessao.getAttribute("pre-pedido-itens"));
                    pedido.setPrecoTotal((Double) sessao.getAttribute("pre-pedido-preco"));
                    pedido.setObservacaoEntrega(confirmaPedido.getObservacaoEntrega());
                    pedido.setFrete(RepositorioProdutos.getInstancia().frete);
                    switch ((int) confirmaPedido.getFormaPagamentos().get(0).getId()) {
                        case 0:
                            this.dao.inserirPedido(pedido, cliente);
                            confirmacaoPedido.setStatus(0);
                            sessao.setAttribute("pre-pedido-itens", null);
                            sessao.setAttribute("pre-pedido-preco", null);
                            break;
                        case 1:

                            break;
                        case 2:

                            break;
                        case 3:

                            break;
                        default:
                            confirmacaoPedido.setStatus(-1);
                            break;
                    }
                }
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                pedidos = this.dao.getPedidos(cliente, (pg == null ? 0 : pg));
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
        } catch (DAOException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(pedidos, httpHeaders, httpStatus);
    }

    @PostMapping("cliente/info-pedido")
    public ResponseEntity<Pedido2> listarPedidos(@RequestBody Pedido2 pedido, HttpSession sessao) {
        try {
            
            Cliente cliente = (Cliente) sessao.getAttribute("cliente");
            this.dao.getPedido(pedido, cliente);
        } catch (DAOException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                enderecos = this.dao.getEnderecos(cliente);
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.cadastrarEndereco(cliente, endereco);
                mensagem.setCodigo(100);
                mensagem.setDescricao("Endereço cadastrado com sucesso");
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.removerEndereco(cliente, endereco);
                mensagem.setCodigo(100);
                mensagem.setDescricao("Endereço removido com sucesso");
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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
            
            if (validarSessao(req)) {
                Cliente cliente = (Cliente) sessao.getAttribute("cliente");
                this.dao.favoritarEndereco(cliente, endereco);
                mensagem.setCodigo(100);
                mensagem.setDescricao("Endereço favoritado com sucesso");
            } else {
                httpStatus = HttpStatus.UNAUTHORIZED;
            }
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

    private boolean validarSessao(HttpServletRequest req) throws DAOException {
        return true;/*
        if (!new AutenticaDAO(conexao).verificarSessao(req.getHeader("ac-tk"))) {
            req.getSession().invalidate();
            //return false;            
        }
        return true;*/
    }

}
