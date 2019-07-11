# wanted-sistema-restaurante-sevidor

ROTAS WANTED

Todas as rotas:

	- cliente/autenticar
	- cliente/sair
	- cliente/verificar-numero
	- cliente/validar-numero
	- cliente/reenviar-codigo
	- cliente/cadastrar-token-alerta
	- cliente/cadastrar
	- cliente/verificar-sessao
	- cliente/sem-autorizacao		
	- cliente/meu-perfil
	- cliente/listar-itens
	- cliente/info-item
	- cliente/existe-prepedido
	- cliente/recuperar-prepedido
	- cliente/remover-prepedido
	- cliente/refazer-pedido
	- cliente/pre-confirmar-pedido
	- cliente/confirmar-pedido
	- cliente/listar-pedidos
	- cliente/info-pedido
	- cliente/info-entrega
	- cliente/listar-enderecos
	- cliente/cadastrar-endereco
	- cliente/remover-endereco
	- cliente/listar-formas-pagamento
	- cliente/anunciantes
	- imagens/{idArquivo}	

	10/07/2019
	- cliente/listar-favoritos
	- cliente/cadastrar-favorito
	- cliente/remover-favorito
	- cliente/listar-itens
	- cliente/listar-generos

CLIENTE

	cliente/autenticar
		recebe:
			{
				"nomeUsuario" : "96991100443",
				"senhaUsuario" : "root"
			}	

	cliente/verificar-numero
		recebe:
			{				
				"telefone" : "96991100443"
			}

	cliente/validar-numero
		recebe:
			{				
				"telefone" : "9699110044a",
				"codigo" : "0E7470"
			}
			
	cliente/reenviar-codigo
		recebe:
			{				
				"telefone" : ""
			}

	cliente/cadastrar-token-alerta
		recebe:
			{
				"token" : "ABCDE"
			}

	cliente/cadastrar
		recebe:
			{
				"nome" : "Algum nome",
				"cpf" : "12345678910",
				"telefone" : "9696969696",
				"email" : "algumemail@email.com",
				"senhaUsuario" : "qwert",
				"codigo" : "50B927"
			}

	cliente/info-item
		recebe:
			{
				"id" : 15
			}

	cliente/refazer-pedido
		recebe:
			{
				"id" : 15
			}

	cliente/pre-confirmar-pedido
		recebe:
			{
				"itens" : [
					"quantidade" : "",
					"id" : "",
					"complementos" : [
						{
							"id"
						}
					],
					"variacoes" : [
						{
							"id"
						}
					]
				]
			}

	cliente/confirmar-pedido
		recebe:
			{
				"enderecos" : [
					{
						"id" : ""
					}
				],
				"formaPagamentos" : [
					{
						"id" : ""
					}
				],
				"observacaoEntrega" : ""
			}

	cliente/info-pedido
		recebe:
			{
				"id" : ""
			}

	cliente/cadastrar-endereco
		recebe:
			{
				"logradouro" : "",
				"bairro" : "",
				"complemento" : "",
				"numero" : "",
				"cidade" : "",
				"cep" : "",
				"descricao" : ""
			}

	cliente/remover-endereco
		recebe:
			{
				"id" : 15
			}

	10/07/2019	
	cliente/cadastrar-favorito
		recebe:
			{
				"id" : 15
			}

	cliente/remover-favorito
		recebe:
			{
				"id" : 15
			}

	cliente/listar-itens
		recebe:
			{
				"id" : 0
			}