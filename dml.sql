use atendimento_chamados;

insert into usuario
(nome, email, telefone, departamento, cargo, status)
values
('Ana Souza', 'ana@email.com', '11999990001', 'Financeiro', 'Analista', 'ATIVO'),
('Bruno Lima', 'bruno@email.com', '11999990002', 'RH', 'Assistente', 'ATIVO'),
('Carla Mendes', 'carla@email.com', '11999990003', 'Vendas', 'Vendedora', 'ATIVO');

insert into tecnico
(nome, email, especialidade, status)
values
('Joao Silva', 'joao@empresa.com', 'Hardware', 'ATIVO'),
('Marcos Santos', 'marcos@empresa.com', 'Software', 'ATIVO'),
('Juliana Costa', 'juliana@empresa.com', 'Rede', 'ATIVO');

insert into categoria
(nome, descricao)
values
('Hardware', 'Problemas em computadores e equipamentos'),
('Software', 'Problemas em programas e sistemas'),
('Rede', 'Problemas de internet e conexao'),
('Acesso', 'Problemas de acesso a sistemas');

insert into chamado
(titulo, descricao, data_abertura, data_fechamento, status, prioridade, id_usuario, id_categoria, id_tecnico)
values
('Computador nao liga', 'Computador nao esta ligando', '2026-09-20 08:00:00', '2026-09-20 10:00:00', 'FECHADO', 'ALTA', 1, 1, 1),

('Erro no sistema', 'Sistema apresenta erro', '2026-09-20 09:00:00', null, 'ABERTO', 'ALTA', 2, 2, 2),

('Internet lenta', 'Internet esta muito lenta', '2026-09-21 10:00:00', null, 'EM ANDAMENTO', 'MEDIA', 3, 3, 3);

insert into historico
(id_chamado, id_usuario, data_hora, descricao, tipo)
values
(1, 1, '2026-09-20 08:30:00', 'Chamado recebido', 'COMENTARIO'),

(1, 1, '2026-09-20 09:30:00', 'Fonte do computador foi trocada', 'ATUALIZACAO'),

(1, 1, '2026-09-20 10:00:00', 'Computador voltou a funcionar', 'SOLUCAO'),

(2, 2, '2026-09-20 09:30:00', 'Tecnico iniciou o atendimento', 'ATUALIZACAO'),

(3, 3, '2026-09-21 10:30:00', 'Problema de rede foi verificado', 'COMENTARIO');

select * from usuario;
select * from tecnico;
select * from categoria;
select * from chamado;
select * from historico;