# wanted-sistema-restaurante-sevidor

ROTAS WANTED

CLIENTE

	cliente/autenticar
		recebe:
			{
				"nomeUsuario" : "96991100443",
				"senhaUsuario" : "root"
			}
		retorna:
			{
			    "codigo": 100,
			    "descricao": null
			}

	cliente/sair
		recebe:
		retorna:
			{
			    "codigo": 100,
			    "descricao": "Desconectado do sistema"
			}

	cliente/verificar-numero
		recebe:
			{				
				"telefone" : "96991100443"
			}
		retorna:
			{
			    "codigo": 100,
			    "descricao": "Um código foi enviado para seu número. Insira esse código no aplicativo"
			}

	cliente/validar-numero
		recebe:
			{				
				"telefone" : "9699110044a",
				"codigo" : "0E7470"
			}
		retorna:
			{
			    "codigo": 100,
			    "descricao": "Numero verificado com sucesso. Agora falta apenas finalizar se ucadastro."
			}
			
	cliente/reenviar-codigo
		recebe:
			{				
				"telefone" : ""
			}
		retorna:
	cliente/cadastrar-token-alerta
		recebe:
			{
				"token" : ""
			}
		retorna:
	cliente/cadastrar
		recebe:
			{
				"nome" : "",
				"cpf" : "",
				"telefone" : "",
				"email" : "",
				"senhaUsuario" : ""
			}
		retorna:
	cliente/verificar-sessao
		recebe:
		retorna:
	cliente/sem-autorizacao
		recebe:
		retorna:
	cliente/meu-perfil
		recebe:
		retorna:
	cliente/listar-itens
		recebe:
		retorna:
	cliente/info-item
		recebe:
			{
				"id" : ""
			}
		retorna:
	cliente/existe-prepedido
		recebe:

		retorna:
	cliente/recuperar-prepedido
		recebe:
		retorna:
	cliente/remover-prepedido
		recebe:
		retorna:
	cliente/refazer-pedido
		recebe:
			{
				"id" : ""
			}
		retorna:
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
		retorna:
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
		retorna:
	cliente/listar-pedidos
		recebe:
		retorna:
	cliente/info-pedido
		recebe:
			{
				"id" : ""
			}
		retorna:
	cliente/info-entrega
		recebe:
		retorna:
	cliente/listar-enderecos
		recebe:
		retorna:
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
		retorna:
	cliente/remover-endereco
		recebe:
			{
				"id" : ""
			}
		retorna:
	cliente/listar-formas-pagamento
		recebe:
		retorna:
	cliente/anunciantes
		recebe:
		retorna:
	imagens/{idArquivo}
		recebe:
		retorna:


