CREATE DATABASE ORDEM_S;
USE ORDEM_S;

-- cliente
CREATE TABLE cliente (
  idCliente INT NOT NULL,
  nome VARCHAR(45) NULL,
  endereco VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (idCliente)
);

-- veiculo
CREATE TABLE veiculo (
  idVeiculo INT NOT NULL,
  modelo VARCHAR(45) NULL,
  ano VARCHAR(45) NULL,
  placa VARCHAR(45) NULL,
  chassi VARCHAR(45) NULL,
  tipo_veiculo VARCHAR(45) NULL,
  Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idVeiculo, Cliente_idCliente),
  INDEX fk_veiculo_cliente_idx (Cliente_idCliente),
  CONSTRAINT fk_veiculo_cliente
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES cliente (idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- mecanico
CREATE TABLE mecanico (
  idMecanico INT NOT NULL,
  nome VARCHAR(45) NULL,
  endereco VARCHAR(45) NULL,
  especialidade VARCHAR(45) NULL,
  PRIMARY KEY (idMecanico)
);

-- ordem_servico
CREATE TABLE ordem_servico (
  idOS INT NOT NULL,
  data_emissao VARCHAR(45) NULL,
  status VARCHAR(45) NULL,
  data_conclusao VARCHAR(45) NULL,
  valor_total FLOAT NULL,
  Cliente_idCliente INT NOT NULL,
  Veiculo_idVeiculo INT NOT NULL,
  Veiculo_Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idOS, Cliente_idCliente, Veiculo_idVeiculo, Veiculo_Cliente_idCliente),
  INDEX fk_ordem_servico_cliente_idx (Cliente_idCliente),
  INDEX fk_ordem_servico_veiculo_idx (Veiculo_idVeiculo, Veiculo_Cliente_idCliente),
  CONSTRAINT fk_ordem_servico_cliente
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES cliente (idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ordem_servico_veiculo
    FOREIGN KEY (Veiculo_idVeiculo, Veiculo_Cliente_idCliente)
    REFERENCES veiculo (idVeiculo, Cliente_idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- servico
CREATE TABLE servico (
  idServico INT NOT NULL,
  tipo_servico VARCHAR(45) NULL,
  descricao VARCHAR(45) NULL,
  valor_unitario FLOAT NULL,
  valor_total FLOAT NULL,
  horas_servico INT NULL,
  ordem_servico_idOS INT NOT NULL,
  ordem_servico_cliente_idCliente INT NOT NULL,
  ordem_servico_veiculo_idVeiculo INT NOT NULL,
  ordem_servico_veiculo_cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idServico, ordem_servico_idOS, ordem_servico_cliente_idCliente, ordem_servico_veiculo_idVeiculo, ordem_servico_veiculo_cliente_idCliente),
  INDEX fk_servico_ordem_servico_idx (ordem_servico_idOS, ordem_servico_cliente_idCliente, ordem_servico_veiculo_idVeiculo, ordem_servico_veiculo_cliente_idCliente),
  CONSTRAINT fk_servico_ordem_servico
    FOREIGN KEY (ordem_servico_idOS, ordem_servico_cliente_idCliente, ordem_servico_veiculo_idVeiculo, ordem_servico_veiculo_cliente_idCliente)
    REFERENCES ordem_servico (idOS, Cliente_idCliente, Veiculo_idVeiculo, Veiculo_Cliente_idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE peca (
  idPeca INT NOT NULL,
  nome_peca VARCHAR(45) NULL,
  descricao VARCHAR(45) NULL,
  valor_unitario VARCHAR(45) NULL,
  Ordem_Servico_idOS INT NOT NULL,
  Ordem_Servico_Cliente_idCliente INT NOT NULL,
  Ordem_Servico_Veiculo_idVeiculo INT NOT NULL,
  Ordem_Servico_Veiculo_Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idPeca, Ordem_Servico_idOS, Ordem_Servico_Cliente_idCliente, Ordem_Servico_Veiculo_idVeiculo, Ordem_Servico_Veiculo_Cliente_idCliente),
  INDEX fk_Peca_Ordem_Servico1_idx (Ordem_Servico_idOS, Ordem_Servico_Cliente_idCliente, Ordem_Servico_Veiculo_idVeiculo, Ordem_Servico_Veiculo_Cliente_idCliente),
  CONSTRAINT fk_Peca_Ordem_Servico1
    FOREIGN KEY (Ordem_Servico_idOS, Ordem_Servico_Cliente_idCliente, Ordem_Servico_Veiculo_idVeiculo, Ordem_Servico_Veiculo_Cliente_idCliente)
    REFERENCES Ordem_Servico (idOS, Cliente_idCliente, Veiculo_idVeiculo, Veiculo_Cliente_idCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Servico_Mecanico 
CREATE TABLE Servico_Mecanico (
  Servico_idServico INT NOT NULL,
  Servico_Ordem_Servico_idOS INT NOT NULL,
  Servico_Ordem_Servico_Cliente_idCliente INT NOT NULL,
  Servico_Ordem_Servico_Veiculo_idVeiculo INT NOT NULL,
  Servico_Ordem_Servico_Veiculo_Cliente_idCliente INT NOT NULL,
  Mecanico_idMecanico INT NOT NULL,
  PRIMARY KEY (Servico_idServico, Servico_Ordem_Servico_idOS, Servico_Ordem_Servico_Cliente_idCliente, Servico_Ordem_Servico_Veiculo_idVeiculo, Servico_Ordem_Servico_Veiculo_Cliente_idCliente, Mecanico_idMecanico),
  INDEX fk_Servico_has_Mecanico_Mecanico1_idx (Mecanico_idMecanico ASC),
  INDEX fk_Servico_has_Mecanico_Servico1_idx (Servico_idServico ASC, Servico_Ordem_Servico_idOS ASC, Servico_Ordem_Servico_Cliente_idCliente ASC, Servico_Ordem_Servico_Veiculo_idVeiculo ASC, Servico_Ordem_Servico_Veiculo_Cliente_idCliente ASC),
  CONSTRAINT fk_Servico_has_Mecanico_Servico1
    FOREIGN KEY (Servico_idServico, Servico_Ordem_Servico_idOS, Servico_Ordem_Servico_Cliente_idCliente, Servico_Ordem_Servico_Veiculo_idVeiculo, Servico_Ordem_Servico_Veiculo_Cliente_idCliente)
    REFERENCES Servico (idServico, Ordem_Servico_idOS, Ordem_Servico_Cliente_idCliente, Ordem_Servico_Veiculo_idVeiculo, Ordem_Servico_Veiculo_Cliente_idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Servico_has_Mecanico_Mecanico1
    FOREIGN KEY (Mecanico_idMecanico)
    REFERENCES Mecanico (idMecanico)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

