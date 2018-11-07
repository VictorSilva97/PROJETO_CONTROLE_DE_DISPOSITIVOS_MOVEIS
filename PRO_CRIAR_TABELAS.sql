DELIMITER $$
CREATE PROCEDURE PRO_CRIAR_TABELAS()
BEGIN
#TBT_PAISES
	CREATE TABLE IF NOT EXISTS TBT_PAISES(
		ID_PAIS int auto_increment not null,
		NOME_PAIS varchar(100) not null,
		DDI int not null,
		primary key(ID_PAIS)
	);
#TBT_ESTADOS
	CREATE TABLE IF NOT EXISTS TBT_ESTADOS(
		ID_ESTADO int auto_increment not null,
		NOME_ESTADO varchar(100) not null,
		SIGLA_ESTADO varchar(2) not null,
		FK_ID_PAIS int not null,
		primary key(ID_ESTADO),
		foreign key(FK_ID_PAIS) references TBT_PAISES(ID_PAIS)
	);
#TBT_CIDADES
	CREATE TABLE IF NOT EXISTS TBT_CIDADES(
		ID_CIDADE int auto_increment not null,
		NOME_CIDADE varchar(100),
		DDD int not null,
		FK_ID_ESTADO int not null,
		primary key(ID_CIDADE),
		foreign key(FK_ID_ESTADO) references TBT_ESTADOS(ID_ESTADO)
	);
#TBT_BAIRROS
	CREATE TABLE IF NOT EXISTS TBT_BAIRROS(
		ID_BAIRRO int auto_increment not null,
		NOME_BAIRRO varchar(100) not null,    
		FK_ID_CIDADE int not null,
		primary key(ID_BAIRRO),
		foreign key(FK_ID_CIDADE) references TBT_CIDADES(ID_CIDADE)
	);
#TBT_RUAS
	CREATE TABLE IF NOT EXISTS TBT_RUAS(
		ID_RUA int auto_increment not null,
		NOME_RUA varchar(100) not null,    
		FK_ID_BAIRRO int not null,
		primary key(ID_RUA),
		foreign key(FK_ID_BAIRRO) references TBT_BAIRROS(ID_BAIRRO)
	);
#TBT_CARGOS
	CREATE TABLE IF NOT EXISTS TBT_CARGOS(
		ID_CARGO int auto_increment not null,
		NOME_CARGO varchar(100) not null,
		primary key(ID_CARGO)
	);
#TBT_GENEROS
	CREATE TABLE IF NOT EXISTS TBT_GENEROS(
		ID_GENERO int auto_increment not null,
		NOME_GENERO varchar(50) not null,
		primary key(ID_GENERO)
	);
#TBT_TIPOS_DE_CHIP
	CREATE TABLE IF NOT EXISTS TBT_TIPOS_DE_CHIP(
		ID_TIPO_CHIP int auto_increment not null,
		NOME_TIPO_CHIP varchar(100) not null,    
		primary key(ID_TIPO_CHIP)
	);
#TBT_MARCAS_DE_CELULAR
	CREATE TABLE IF NOT EXISTS TBT_MARCAS_DE_CELULAR(
		ID_MARCA int auto_increment not null,
		NOME_MARCA varchar(100) not null,
		primary key(ID_MARCA)
	);
#TBT_MODELOS_DE_CELULAR
	CREATE TABLE IF NOT EXISTS TBT_MODELOS_DE_CELULAR(
		ID_MODELO int auto_increment not null,
		NOME_MODELO varchar(100) not null,
		NUMERO_CHIP int not null,
		FK_ID_MARCA_CELULAR int not null,
		FK_ID_TIPO_CHIP int not null,
		primary key(ID_MODELO),
		foreign key(FK_ID_MARCA_CELULAR) references TBT_MARCAS_DE_CELULAR(ID_MARCA),
		foreign key(FK_ID_TIPO_CHIP) references TBT_TIPOS_DE_CHIP(ID_TIPO_CHIP)    
	);
#TBT_OPERADORAS_TELEFONICAS
	CREATE TABLE IF NOT EXISTS TBT_OPERADORAS_TELEFONICAS(
		ID_OPERADORA int auto_increment not null,
		NOME_OPERADORA varchar(100) not null,
		primary key(ID_OPERADORA)
	);
#TBT_LINHAS_TELEFONICAS
	CREATE TABLE IF NOT EXISTS TBT_LINHAS_TELEFONICAS(
		ID_LINHA int auto_increment not null,
		NUMERO_TELEFONE int not null,
		FK_ID_CIDADE int not null,
		FK_ID_PAIS int not null,
		FK_ID_OPERADORA int not null,
		primary key(ID_LINHA),
		foreign key(FK_ID_CIDADE) references TBT_CIDADES(ID_CIDADE),
		foreign key(FK_ID_PAIS) references TBT_PAISES(ID_PAIS),
		foreign key(FK_ID_OPERADORA) references TBT_OPERADORAS_TELEFONICAS(ID_OPERADORA)
	);
#TBT_FUNCIONARIOS
	CREATE TABLE IF NOT EXISTS TBT_FUNCIONARIOS(
		ID_FUNCIONARIO int auto_increment not null,
		CPF int(11) unique not null,
		RG int(10) unique not null,
		NOME_COMPLETO varchar(150) not null,
		DATA_NASCIMENTO date not null,
		TELEFONE int not null,
		NOME_DA_MAE varchar(150) not null,
		FK_ID_CARGO int not null,
		FK_ID_GENERO int not null,
		FK_ID_RUA int not null,
		primary key(ID_FUNCIONARIO),
		foreign key(FK_ID_CARGO) 	references TBT_CARGOS(ID_CARGO),
		foreign key(FK_ID_GENERO) 	references TBT_GENEROS(ID_GENERO),
		foreign key(FK_ID_RUA) 		references TBT_RUAS(ID_RUA)
	);
#TBT_APARELHOS
	CREATE TABLE IF NOT EXISTS TBT_APARELHOS(
		ID_APARELHO int auto_increment not null,
		SENHA_APARELHO varchar(50) not null,
		IMEI int not null,
		NUMERO_DE_SERIE int not null,
		MAC_ADDRESS varchar(12),
		FOTO longblob,
		FK_ID_MODELO int not null,
		FK_ID_LINHA int not null,
		FK_ID_FUNCIONARIO int,
		primary key(ID_APARELHO),
		foreign key(FK_ID_MODELO) references TBT_MODELOS_DE_CELULAR(ID_MODELO),
		foreign key(FK_ID_LINHA) references TBT_LINHAS_TELEFONICAS(ID_LINHA),
		foreign key(FK_ID_FUNCIONARIO) references TBT_FUNCIONARIOS(ID_FUNCIONARIO)
	);
END $$
DELIMITER ;