CREATE TABLE tb_estado (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(40)
);

CREATE TABLE tb_cidade (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(40),
	estado_id INT,
	FOREIGN KEY(estado_id) REFERENCES tb_estado(id)
);

CREATE TABLE tb_endereco (
	id SERIAL PRIMARY KEY,
	logradouro VARCHAR(20),
	numero INT NOT NULL,
	complemento VARCHAR(20) NOT NULL,
	bairro VARCHAR(20) NOT NULL,
	cep	VARCHAR(20) NOT NULL,
	cidade_id INT NOT NULL,
	FOREIGN KEY(cidade_id) REFERENCES tb_cidade(id)
);

CREATE TABLE tb_cliente(
	cpf VARCHAR(20) PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE tb_telefone (
	cpf VARCHAR(30),
	numero VARCHAR(30) NOT NULL,
	PRIMARY KEY(cpf,numero),
	FOREIGN KEY(cpf) REFERENCES tb_cliente(cpf)
);	

CREATE TABLE tb_locacao (
	id SERIAL PRIMARY KEY,
	instante_locacao TIMESTAMP NOT NULL,
	instante_devolucao TIMESTAMP NOT NULL,
	cliente_id VARCHAR(20) NOT NULL,
	carro_id INT NOT NULL,
	local_de_retirada_id INT NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES tb_cliente(cpf),
	FOREIGN KEY (carro_id) REFERENCES tb_carro(id),
	FOREIGN KEY (local_de_retirada_id) REFERENCES tb_sede(codigo)
);

CREATE TABLE tb_locacao_diaria(
	id INT PRIMARY KEY,
	dias_previstos INT NOT NULL,
	FOREIGN KEY(id) REFERENCES tb_locacao(id)
);

CREATE TABLE tb_locacao_longo_periodo(
	id INT PRIMARY KEY,
	porcentagem_desconto FLOAT NOT NULL,
	FOREIGN KEY(id) REFERENCES tb_locacao(id)
);