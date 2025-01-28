INSERT INTO cliente (idCliente, nome, endereco, telefone, email) VALUES
(1, 'Carlos Silva', 'Rua A, 123', '11987654321', 'carlos.silva@email.com'),
(2, 'Ana Souza', 'Rua B, 456', '11986543210', 'ana.souza@email.com'),
(3, 'João Pereira', 'Rua C, 789', '11985432100', 'joao.pereira@email.com'),
(4, 'Maria Oliveira', 'Rua D, 101', '11984321001', 'maria.oliveira@email.com'),
(5, 'José Santos', 'Rua E, 102', '11983210987', 'jose.santos@email.com'),
(6, 'Patrícia Costa', 'Rua F, 103', '11982109876', 'patricia.costa@email.com'),
(7, 'Lucas Lima', 'Rua G, 104', '11981098765', 'lucas.lima@email.com'),
(8, 'Fernanda Rocha', 'Rua H, 105', '11980987654', 'fernanda.rocha@email.com'),
(9, 'Ricardo Almeida', 'Rua I, 106', '11979876543', 'ricardo.almeida@email.com'),
(10, 'Gabriela Fernandes', 'Rua J, 107', '11978765432', 'gabriela.fernandes@email.com');

INSERT INTO veiculo (idVeiculo, modelo, ano, placa, chassi, tipo_veiculo, Cliente_idCliente) VALUES
(1, 'Fusca 1970', '1970', 'ABC1234', '9BW321AB12456789', 'Carro', 1),
(2, 'Civic 2020', '2020', 'DEF5678', '9BW321AB12456788', 'Carro', 2),
(3, 'Gol 2015', '2015', 'GHI9101', '9BW321AB12456787', 'Carro', 3),
(4, 'Fiat Uno 2018', '2018', 'JKL1122', '9BW321AB12456786', 'Carro', 4),
(5, 'Chevrolet Onix 2021', '2021', 'MNO2233', '9BW321AB12456785', 'Carro', 5),
(6, 'Renault Kwid 2019', '2019', 'PQR3344', '9BW321AB12456784', 'Carro', 6),
(7, 'Ford Fiesta 2017', '2017', 'STU4455', '9BW321AB12456783', 'Carro', 7),
(8, 'Toyota Corolla 2019', '2019', 'VWX5566', '9BW321AB12456782', 'Carro', 8);

INSERT INTO veiculo (idVeiculo, modelo, ano, placa, chassi, tipo_veiculo, Cliente_idCliente) VALUES
(9, 'Volkswagen Polo 2022', '2022', 'XYZ6677', '9BW321AB12456781', 'Carro', 2),
(10, 'Honda HR-V 2021', '2021', 'ABC7889', '9BW321AB12456780', 'SUV', 7),
(11, 'Jeep Compass 2020', '2020', 'DEF9900', '9BW321AB12456779', 'SUV', 8);


INSERT INTO mecanico (idMecanico, nome, endereco, especialidade) VALUES
(1, 'Carlos Almeida', 'Rua Mecanico, 200', 'Mecânico Geral'),
(2, 'Paulo Costa', 'Rua Mecanico, 201', 'Eletricista Automotivo'),
(3, 'Ricardo Santos', 'Rua Mecanico, 202', 'Pintura Automotiva');

INSERT INTO ordem_servico (idOS, data_emissao, status, data_conclusao, valor_total, Cliente_idCliente, Veiculo_idVeiculo, Veiculo_Cliente_idCliente) VALUES
(1, '2025-01-01', 'Em andamento', NULL, 500.00, 1, 1, 1),
(2, '2025-01-02', 'Concluída', '2025-01-05', 400.00, 2, 2, 2),
(3, '2025-01-03', 'Em andamento', NULL, 800.00, 3, 3, 3),
(4, '2025-01-04', 'Concluída', '2025-01-07', 600.00, 4, 4, 4),
(5, '2025-01-05', 'Em andamento', NULL, 1200.00, 5, 5, 5),
(6, '2025-01-06', 'Em andamento', NULL, 700.00, 6, 6, 6),
(7, '2025-01-07', 'Em andamento', NULL, 900.00, 7, 7, 7),
(8, '2025-01-08', 'Concluída', '2025-01-10', 750.00, 8, 8, 8);

INSERT INTO servico (idServico, tipo_servico, descricao, valor_unitario, valor_total, horas_servico, ordem_servico_idOS, ordem_servico_cliente_idCliente, ordem_servico_veiculo_idVeiculo, ordem_servico_veiculo_cliente_idCliente) VALUES
(1, 'Troca de Óleo', 'Troca de óleo do motor', 150.00, 150.00, 2, 1, 1, 1, 1),
(2, 'Revisão', 'Revisão geral do veículo', 250.00, 250.00, 3, 2, 2, 2, 2),
(3, 'Troca de Pneus', 'Substituição dos pneus dianteiros', 300.00, 300.00, 4, 3, 3, 3, 3),
(4, 'Pintura', 'Pintura do para-choque dianteiro', 350.00, 350.00, 5, 4, 4, 4, 4),
(5, 'Troca de Bateria', 'Substituição da bateria do veículo', 200.00, 200.00, 1, 5, 5, 5, 5),
(6, 'Alinhamento e Balanceamento', 'Ajuste da suspensão e balanceamento das rodas', 180.00, 180.00, 3, 6, 6, 6, 6),
(7, 'Troca de Pastilhas de Freio', 'Substituição das pastilhas de freio', 220.00, 220.00, 2, 7, 7, 7, 7),
(8, 'Limpeza de Injetores', 'Limpeza do sistema de injeção eletrônica', 280.00, 280.00, 3, 8, 8, 8, 8);

INSERT INTO peca (idPeca, nome_peca, descricao, valor_unitario, Ordem_Servico_idOS, Ordem_Servico_Cliente_idCliente, Ordem_Servico_Veiculo_idVeiculo, Ordem_Servico_Veiculo_Cliente_idCliente) VALUES
(1, 'Bateria', 'Bateria de 12V', 120.00, 5, 5, 5, 5),
(2, 'Pneu', 'Pneu aro 14', 100.00, 3, 3, 3, 3),
(3, 'Pastilha de Freio', 'Pastilha para sistema de freio', 50.00, 7, 7, 7, 7);

INSERT INTO Servico_Mecanico (Servico_idServico, Servico_Ordem_Servico_idOS, Servico_Ordem_Servico_Cliente_idCliente, Servico_Ordem_Servico_Veiculo_idVeiculo, Servico_Ordem_Servico_Veiculo_Cliente_idCliente, Mecanico_idMecanico) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 3),
(5, 5, 5, 5, 5, 1),
(6, 6, 6, 6, 6, 2),
(7, 7, 7, 7, 7, 1),
(8, 8, 8, 8, 8, 2);
