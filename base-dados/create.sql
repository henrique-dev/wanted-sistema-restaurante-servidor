-- MySQL Script generated by MySQL Workbench
-- Sun Jul  7 21:39:46 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema restaurante_wanted
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurante_wanted
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurante_wanted` DEFAULT CHARACTER SET utf8 ;
USE `restaurante_wanted` ;

-- -----------------------------------------------------
-- Table `restaurante_wanted`.`restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`restaurante` (
  `id_restaurante` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `endereco` VARCHAR(150) NOT NULL,
  `ultima_modificacao_itens` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_restaurante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `senha` VARCHAR(150) NOT NULL,
  `token_sessao` VARCHAR(150) NULL,
  `token_cadastro` VARCHAR(10) NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT 0,
  `verificado` TINYINT(1) NULL DEFAULT 0,
  `token_websocket` VARCHAR(128) NULL,
  `token_cadastro_data` TIMESTAMP NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_usuario1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_cliente_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `restaurante_wanted`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `logradouro` VARCHAR(75) NOT NULL,
  `bairro` VARCHAR(75) NOT NULL,
  `complemento` VARCHAR(75) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  INDEX `fk_endereco_cliente1_idx` (`id_cliente` ASC),
  PRIMARY KEY (`id_endereco`),
  CONSTRAINT `fk_endereco_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `restaurante_wanted`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`item` (
  `id_item` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_genero` INT NOT NULL,
  `modificavel` TINYINT(1) NOT NULL,
  `modificavel_ingrediente` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_item`),
  INDEX `fk_prato_generoprato1_idx` (`id_genero` ASC),
  CONSTRAINT `fk_prato_generoprato1`
    FOREIGN KEY (`id_genero`)
    REFERENCES `restaurante_wanted`.`genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`tipo` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`item_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`item_tipo` (
  `id_item` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  PRIMARY KEY (`id_item`, `id_tipo`),
  INDEX `fk_prato_has_tipo_tipo1_idx` (`id_tipo` ASC),
  INDEX `fk_prato_has_tipo_prato1_idx` (`id_item` ASC),
  CONSTRAINT `fk_prato_has_tipo_prato1`
    FOREIGN KEY (`id_item`)
    REFERENCES `restaurante_wanted`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prato_has_tipo_tipo1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `restaurante_wanted`.`tipo` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`arquivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`arquivo` (
  `id_arquivo` INT NOT NULL AUTO_INCREMENT,
  `caminho` VARCHAR(45) NULL,
  PRIMARY KEY (`id_arquivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`complemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`complemento` (
  `id_complemento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_arquivo` INT NOT NULL,
  PRIMARY KEY (`id_complemento`),
  INDEX `fk_complemento_arquivo1_idx` (`id_arquivo` ASC),
  CONSTRAINT `fk_complemento_arquivo1`
    FOREIGN KEY (`id_arquivo`)
    REFERENCES `restaurante_wanted`.`arquivo` (`id_arquivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`item_complemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`item_complemento` (
  `id_item` INT NOT NULL,
  `id_complemento` INT NOT NULL,
  PRIMARY KEY (`id_item`, `id_complemento`),
  INDEX `fk_prato_has_complemento_complemento1_idx` (`id_complemento` ASC),
  INDEX `fk_prato_has_complemento_prato1_idx` (`id_item` ASC),
  CONSTRAINT `fk_prato_has_complemento_prato1`
    FOREIGN KEY (`id_item`)
    REFERENCES `restaurante_wanted`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prato_has_complemento_complemento1`
    FOREIGN KEY (`id_complemento`)
    REFERENCES `restaurante_wanted`.`complemento` (`id_complemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`item_arquivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`item_arquivo` (
  `id_item` INT NOT NULL,
  `id_arquivo` INT NOT NULL,
  PRIMARY KEY (`id_item`, `id_arquivo`),
  INDEX `fk_arquivo_has_prato_prato1_idx` (`id_item` ASC),
  INDEX `fk_arquivo_has_prato_arquivo1_idx` (`id_arquivo` ASC),
  CONSTRAINT `fk_arquivo_has_prato_arquivo1`
    FOREIGN KEY (`id_arquivo`)
    REFERENCES `restaurante_wanted`.`arquivo` (`id_arquivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arquivo_has_prato_prato1`
    FOREIGN KEY (`id_item`)
    REFERENCES `restaurante_wanted`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`formapagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`formapagamento` (
  `id_formapagamento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_formapagamento`),
  INDEX `fk_formapagamento_cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_formapagamento_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `restaurante_wanted`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `data` TIMESTAMP NOT NULL,
  `itens` JSON NOT NULL,
  `precototal` DECIMAL(8,2) NOT NULL,
  `id_formapagamento` INT NULL,
  `id_cliente` INT NULL,
  `id_endereco` INT NULL,
  `pagamentoefetuado` TINYINT(1) NOT NULL DEFAULT 0,
  `estado` ENUM('1', '2', '3', '4') NOT NULL,
  `observacao_entrega` VARCHAR(150) NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedido_formapagamento1_idx` (`id_formapagamento` ASC),
  INDEX `fk_pedido_cliente1_idx` (`id_cliente` ASC),
  INDEX `fk_pedido_endereco1_idx` (`id_endereco` ASC),
  CONSTRAINT `fk_pedido_formapagamento1`
    FOREIGN KEY (`id_formapagamento`)
    REFERENCES `restaurante_wanted`.`formapagamento` (`id_formapagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `restaurante_wanted`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_endereco1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `restaurante_wanted`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`entrega` (
  `id_entrega` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `efetuada` TINYINT(1) NOT NULL,
  `eventualidade` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_entrega`, `id_pedido`),
  INDEX `fk_entrega_pedido1_idx` (`id_pedido` ASC),
  CONSTRAINT `fk_entrega_pedido1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `restaurante_wanted`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`pre_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`pre_pedido` (
  `id_pre_pedido` INT NOT NULL AUTO_INCREMENT,
  `data` TIMESTAMP NOT NULL,
  `itens` JSON NOT NULL,
  `precototal` DECIMAL(8,2) NOT NULL,
  `id_formapagamento` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  `token` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id_pre_pedido`),
  INDEX `fk_pre_pedido_endereco1_idx` (`id_endereco` ASC),
  INDEX `fk_pre_pedido_formapagamento1_idx` (`id_formapagamento` ASC),
  INDEX `fk_pre_pedido_cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_pre_pedido_endereco1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `restaurante_wanted`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pre_pedido_formapagamento1`
    FOREIGN KEY (`id_formapagamento`)
    REFERENCES `restaurante_wanted`.`formapagamento` (`id_formapagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pre_pedido_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `restaurante_wanted`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`grupo_variacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`grupo_variacao` (
  `id_grupo_variacao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `grupo` INT NOT NULL,
  `max` INT NOT NULL,
  `id_item` INT NOT NULL,
  INDEX `fk_grupo_variacao_item1_idx` (`id_item` ASC),
  PRIMARY KEY (`id_grupo_variacao`),
  CONSTRAINT `fk_grupo_variacao_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `restaurante_wanted`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`variacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`variacao` (
  `id_variacao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `ordem` INT NULL,
  `id_grupo_variacao` INT NOT NULL,
  PRIMARY KEY (`id_variacao`),
  INDEX `fk_variacao_grupo_variacao1_idx` (`id_grupo_variacao` ASC),
  CONSTRAINT `fk_variacao_grupo_variacao1`
    FOREIGN KEY (`id_grupo_variacao`)
    REFERENCES `restaurante_wanted`.`grupo_variacao` (`id_grupo_variacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`pontos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`pontos` (
  `id_usuario` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `pontos` INT NOT NULL DEFAULT 0,
  `max` INT NOT NULL,
  CONSTRAINT `fk_pontos_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `restaurante_wanted`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`ingrediente` (
  `id_ingrediente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ingrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurante_wanted`.`item_ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurante_wanted`.`item_ingrediente` (
  `id_item` INT NOT NULL,
  `id_ingrediente` INT NOT NULL,
  PRIMARY KEY (`id_item`, `id_ingrediente`),
  INDEX `fk_ingrediente_has_item_item1_idx` (`id_item` ASC),
  INDEX `fk_ingrediente_has_item_ingrediente1_idx` (`id_ingrediente` ASC),
  CONSTRAINT `fk_ingrediente_has_item_ingrediente1`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `restaurante_wanted`.`ingrediente` (`id_ingrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_has_item_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `restaurante_wanted`.`item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;