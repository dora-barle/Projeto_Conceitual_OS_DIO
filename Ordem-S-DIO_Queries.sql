-- Quantos serviços foram feitos para cada cliente?
SELECT c.idCliente, c.nome, COUNT(s.idServico) AS total_servicos
FROM servico s
JOIN ordem_servico os ON s.ordem_servico_idOS = os.idOS
JOIN cliente c ON os.Cliente_idCliente = c.idCliente
GROUP BY c.idCliente;

-- Quantos veiculos por cliente?
SELECT c.idCliente, c.nome, COUNT(v.idVeiculo) AS total_veiculos
FROM cliente c
JOIN veiculo v ON c.idCliente = v.Cliente_idCliente
GROUP BY c.idCliente;

-- Quais mecânicos atenderam quais veículos?
SELECT m.nome AS Mecanico, v.modelo AS Veiculo, v.placa AS Placa
FROM servico_mecanico sm
JOIN mecanico m ON sm.Mecanico_idMecanico = m.idMecanico
JOIN servico s ON sm.Servico_idServico = s.idServico
JOIN ordem_servico os ON s.ordem_servico_idOS = os.idOS
JOIN veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo
WHERE sm.Servico_Ordem_Servico_Cliente_idCliente = os.Cliente_idCliente;

-- Quais veículos foram atendidos por mecânicos em cada ordem de serviço?
SELECT v.modelo AS Veiculo, v.placa AS Placa, m.nome AS Mecanico, os.idOS AS Ordem_Servico
FROM servico_mecanico sm
JOIN mecanico m ON sm.Mecanico_idMecanico = m.idMecanico
JOIN servico s ON sm.Servico_idServico = s.idServico
JOIN ordem_servico os ON s.ordem_servico_idOS = os.idOS
JOIN veiculo v ON os.Veiculo_idVeiculo = v.idVeiculo;

-- Quantos serviços estão "Em andamento" e quais clientes solicitaram?
SELECT os.idOS, c.nome AS Nome_Cliente, os.status AS Status_Ordem_Servico
FROM ordem_servico os
JOIN cliente c ON os.Cliente_idCliente = c.idCliente
WHERE os.status = 'Em andamento';

-- Quantos serviços foram realizados por tipo de serviço?
SELECT s.tipo_servico, COUNT(s.idServico) AS Total_Servicos
FROM servico s
GROUP BY s.tipo_servico;

-- Qual é a média do valor total dos serviços realizados?
SELECT AVG(s.valor_total) AS Media_Valor_Servicos
FROM servico s;

SELECT * FROM peca;
SELECT * FROM servico;

-- Quantas horas trablahas por mecanicos?
SELECT m.nome AS Nome_Mecanico, s.tipo_servico AS Tipo_Servico, SUM(s.horas_servico) AS Total_Horas_Trabalhadas
FROM servico s
JOIN Servico_Mecanico sm ON s.idServico = sm.Servico_idServico
JOIN mecanico m ON sm.Mecanico_idMecanico = m.idMecanico
GROUP BY m.nome, s.tipo_servico
ORDER BY Total_Horas_Trabalhadas DESC;

-- Lista os serviços e as peças realizadas em uma determinada ordem de serviço
SELECT s.tipo_servico AS Tipo_Servico, p.nome_peca AS Peca, s.valor_total AS Valor_Servico
FROM servico s
LEFT JOIN peca p ON s.ordem_servico_idOS = p.Ordem_Servico_idOS 
           AND s.ordem_servico_cliente_idCliente = p.Ordem_Servico_Cliente_idCliente 
           AND s.ordem_servico_veiculo_idVeiculo = p.Ordem_Servico_Veiculo_idVeiculo
           AND s.ordem_servico_veiculo_cliente_idCliente = p.Ordem_Servico_Veiculo_Cliente_idCliente
WHERE s.ordem_servico_idOS = 2;  -- Substitua 1 pelo ID da ordem de serviço desejada













