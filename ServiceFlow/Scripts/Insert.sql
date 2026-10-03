use ServiceFlow;

insert into Departamentos (nome,centroCusto,situacaoAtividade)
values
(N'Tecnologia da Informação',N'CC-TI-001',1),
(N'Financeiro',N'CC-FIN-001',1),
(N'Recursos Humanos',N'CC-RH-001',1),
(N'Comercial',N'CC-COM-001',1),
(N'Operações',N'CC-OPE-001',1),
(N'Jurídico',N'CC-JUR-001',1),
(N'Marketing',N'CC-MKT-001',1),
(N'Diretoria',N'CC-DIR-001',1);

insert into Funcionarios (nome,cpf,email,telefone,dataAdmissao,situacaoAtividade,departamento_id)
values
(N'Carlos Henrique Souza','10000000001',N'carlos.souza@serviceflow.local',N'17990000001','2021-02-01',1,1),
(N'Ana Paula Ribeiro','10000000002',N'ana.ribeiro@serviceflow.local',N'17990000002','2022-03-14',1,1),
(N'Bruno Almeida Costa','10000000003',N'bruno.costa@serviceflow.local',N'17990000003','2022-07-18',1,1),
(N'Camila Fernandes Lima','10000000004',N'camila.lima@serviceflow.local',N'17990000004','2023-01-09',1,1),
(N'Daniel Martins Rocha','10000000005',N'daniel.rocha@serviceflow.local',N'17990000005','2023-02-20',1,1),
(N'Elisa Moreira Santos','10000000006',N'elisa.santos@serviceflow.local',N'17990000006','2023-04-03',1,1),
(N'Felipe Nunes Gomes','10000000007',N'felipe.gomes@serviceflow.local',N'17990000007','2023-06-12',1,1),
(N'Gabriela Oliveira Melo','10000000008',N'gabriela.melo@serviceflow.local',N'17990000008','2023-08-21',1,1),
(N'Henrique Barros Silva','10000000009',N'henrique.silva@serviceflow.local',N'17990000009','2024-01-15',1,1),
(N'Isabela Freitas Alves','10000000010',N'isabela.alves@serviceflow.local',N'17990000010','2024-02-05',1,1),
(N'João Pedro Castro','10000000011',N'joao.castro@serviceflow.local',N'17990000011','2022-05-02',1,2),
(N'Karina Lopes Moraes','10000000012',N'karina.moraes@serviceflow.local',N'17990000012','2022-09-19',1,2),
(N'Lucas Teixeira Prado','10000000013',N'lucas.prado@serviceflow.local',N'17990000013','2023-03-06',1,2),
(N'Mariana Azevedo Dias','10000000014',N'mariana.dias@serviceflow.local',N'17990000014','2023-10-02',1,3),
(N'Nicolas Ferreira Reis','10000000015',N'nicolas.reis@serviceflow.local',N'17990000015','2024-04-22',1,3),
(N'Olivia Campos Leal','10000000016',N'olivia.leal@serviceflow.local',N'17990000016','2022-11-07',1,4),
(N'Paulo César Mendes','10000000017',N'paulo.mendes@serviceflow.local',N'17990000017','2023-05-08',1,4),
(N'Quésia Andrade Ramos','10000000018',N'quesia.ramos@serviceflow.local',N'17990000018','2024-06-17',1,4),
(N'Rafael Borges Pinto','10000000019',N'rafael.pinto@serviceflow.local',N'17990000019','2021-08-09',1,5),
(N'Sabrina Vieira Melo','10000000020',N'sabrina.melo@serviceflow.local',N'17990000020','2022-01-24',1,5),
(N'Thiago Cardoso Lima','10000000021',N'thiago.lima@serviceflow.local',N'17990000021','2023-07-31',1,5),
(N'Úrsula Nascimento Luz','10000000022',N'ursula.luz@serviceflow.local',N'17990000022','2024-03-11',1,6),
(N'Victor Hugo Rezende','10000000023',N'victor.rezende@serviceflow.local',N'17990000023','2021-12-13',1,6),
(N'Wesley Pereira Cunha','10000000024',N'wesley.cunha@serviceflow.local',N'17990000024','2022-06-27',1,7),
(N'Yasmin Duarte Freire','10000000025',N'yasmin.freire@serviceflow.local',N'17990000025','2023-09-04',1,7),
(N'Adriana Torres Mota','10000000026',N'adriana.mota@serviceflow.local',N'17990000026','2020-04-13',1,8),
(N'Bernardo Araújo Faria','10000000027',N'bernardo.faria@serviceflow.local',N'17990000027','2024-07-01',1,5),
(N'Cláudia Mendes Rosa','10000000028',N'claudia.rosa@serviceflow.local',N'17990000028','2025-01-13',1,2),
(N'Diego Santana Lopes','10000000029',N'diego.lopes@serviceflow.local',N'17990000029','2025-02-10',1,3),
(N'Eduarda Pires Melo','10000000030',N'eduarda.melo@serviceflow.local',N'17990000030','2025-03-17',1,4),
(N'Fernando Brito Luz','10000000031',N'fernando.luz@serviceflow.local',N'17990000031','2025-04-07',1,5),
(N'Giovana Tavares Reis','10000000032',N'giovana.reis@serviceflow.local',N'17990000032','2025-05-12',1,6),
(N'Hugo Monteiro Paes','10000000033',N'hugo.paes@serviceflow.local',N'17990000033','2025-06-16',1,7),
(N'Ingrid Vasconcelos Lima','10000000034',N'ingrid.lima@serviceflow.local',N'17990000034','2025-07-21',1,2),
(N'José Augusto Neves','10000000035',N'jose.neves@serviceflow.local',N'17990000035','2025-08-18',0,5),
(N'Larissa Fontes Prado','10000000036',N'larissa.prado@serviceflow.local',N'17990000036','2025-09-01',1,4);

insert into TipoEquipamento (nome,descricao)
values
(N'Notebook',N'Computador portátil corporativo'),
(N'Desktop',N'Computador de mesa corporativo'),
(N'Monitor',N'Monitor de vídeo'),
(N'Impressora',N'Equipamento de impressão'),
(N'Smartphone',N'Aparelho móvel corporativo'),
(N'Switch',N'Equipamento de comutação de rede'),
(N'Roteador',N'Equipamento de roteamento de rede');

insert into Fabricante (nome,descricao)
values
(N'Lenovo',N'Fabricante de computadores e dispositivos'),
(N'Dell',N'Fabricante de computadores e periféricos'),
(N'HP',N'Fabricante de computadores e impressoras'),
(N'Samsung',N'Fabricante de monitores e dispositivos móveis'),
(N'Cisco',N'Fabricante de equipamentos de rede'),
(N'Epson',N'Fabricante de impressoras'),
(N'Apple',N'Fabricante de computadores e dispositivos móveis'),
(N'Intelbras',N'Fabricante de equipamentos de rede e telecomunicações');

insert into Modelo (nome,descricao,tipoEquipamento_id,fabricante_id)
values
(N'ThinkPad E14',N'Notebook corporativo de 14 polegadas',1,1),
(N'ThinkPad T14',N'Notebook corporativo de 14 polegadas',1,1),
(N'Latitude 5440',N'Notebook corporativo Dell',1,2),
(N'OptiPlex 7010',N'Desktop corporativo Dell',2,2),
(N'ProBook 440',N'Notebook corporativo HP',1,3),
(N'ProDesk 400',N'Desktop corporativo HP',2,3),
(N'P2422H',N'Monitor corporativo Dell',3,2),
(N'T24i-30',N'Monitor corporativo Lenovo',3,1),
(N'LF24T350',N'Monitor Samsung de 24 polegadas',3,4),
(N'EcoTank L3250',N'Impressora multifuncional',4,6),
(N'LaserJet Pro 4003',N'Impressora laser corporativa',4,3),
(N'Galaxy A55',N'Smartphone corporativo Samsung',5,4),
(N'iPhone 15',N'Smartphone corporativo Apple',5,7),
(N'Catalyst 1000-24T',N'Switch corporativo Cisco',6,5),
(N'SG2404 PoE',N'Switch gerenciável Intelbras',6,8),
(N'ISR 1100',N'Roteador corporativo Cisco',7,5),
(N'RX 1500',N'Roteador corporativo Intelbras',7,8),
(N'MacBook Air M3',N'Notebook Apple',1,7);

insert into SituacaoEquipamento (nome,descricao)
values
(N'Disponível',N'Equipamento disponível para alocação'),
(N'Em uso',N'Equipamento atualmente alocado'),
(N'Em manutenção',N'Equipamento indisponível por manutenção'),
(N'Baixado',N'Equipamento retirado definitivamente de uso'),
(N'Extraviado',N'Equipamento registrado como extraviado');

;with Numeros as
(
	select 1 as n
	union all
	select n + 1
	from Numeros
	where n < 50
)
insert into EquipamentoTi
(
	numeroPatrimonio,
	numeroSerie,
	dataAquisicao,
	modelo_id,
	situacaoEquipamento_id
)
select
	N'PAT-' + right('0000' + cast(n as varchar(4)),4),
	N'SN-' + right('000000' + cast(100000 + n as varchar(6)),6),
	cast(dateadd(day,-((n * 37) % 1800),cast('2026-09-01' as date)) as date),
	((n - 1) % 18) + 1,
	case
		when n <= 18 then 2
		when n <= 35 then 1
		when n <= 43 then 3
		when n <= 47 then 4
		else 5
	end
from Numeros
option (maxrecursion 0);

insert into AlocacaoEquipamento (equipamentoTi_id,dataHoraEntrega,dataHoraDevolucao,funcionario_id)
values
(19,'2024-01-10 09:00:00','2025-02-15 16:00:00',11),
(20,'2024-02-05 09:00:00','2025-03-20 15:30:00',12),
(21,'2024-03-11 09:00:00','2025-04-18 11:00:00',13),
(22,'2024-04-01 09:00:00','2025-05-22 14:00:00',14),
(23,'2024-05-06 09:00:00','2025-06-30 10:00:00',15),
(24,'2024-06-03 09:00:00','2025-07-17 16:30:00',16),
(25,'2024-07-08 09:00:00','2025-08-21 09:30:00',17),
(26,'2024-08-12 09:00:00','2025-09-19 17:00:00',18),
(27,'2024-09-02 09:00:00','2025-10-13 13:00:00',19),
(28,'2024-10-07 09:00:00','2025-11-24 11:30:00',20),
(29,'2024-11-04 09:00:00','2026-01-16 15:00:00',21),
(30,'2024-12-02 09:00:00','2026-02-27 16:00:00',22),
(31,'2025-01-13 09:00:00','2026-03-20 09:00:00',23),
(32,'2025-02-10 09:00:00','2026-04-17 10:30:00',24),
(33,'2025-03-10 09:00:00','2026-05-29 14:00:00',25),
(34,'2025-04-07 09:00:00','2026-06-26 12:00:00',26),
(35,'2025-05-05 09:00:00','2026-07-31 16:00:00',27);

insert into AlocacaoEquipamento (equipamentoTi_id,dataHoraEntrega,dataHoraDevolucao,funcionario_id)
values
(1,'2026-01-05 09:00:00',null,11),
(2,'2026-01-12 09:00:00',null,12),
(3,'2026-01-19 09:00:00',null,13),
(4,'2026-02-02 09:00:00',null,14),
(5,'2026-02-09 09:00:00',null,15),
(6,'2026-02-16 09:00:00',null,16),
(7,'2026-03-02 09:00:00',null,17),
(8,'2026-03-09 09:00:00',null,18),
(9,'2026-03-16 09:00:00',null,19),
(10,'2026-04-06 09:00:00',null,20),
(11,'2026-04-13 09:00:00',null,21),
(12,'2026-05-04 09:00:00',null,22),
(13,'2026-05-11 09:00:00',null,23),
(14,'2026-06-01 09:00:00',null,24),
(15,'2026-06-08 09:00:00',null,25),
(16,'2026-07-06 09:00:00',null,26),
(17,'2026-07-13 09:00:00',null,27),
(18,'2026-08-03 09:00:00',null,28);

insert into PerfilUsuario (nome,descricao)
values
(N'Usuário',N'Usuário comum do sistema'),
(N'Técnico',N'Técnico responsável por atendimento de chamados'),
(N'Administrador',N'Administrador do sistema');

insert into EquipesSuporte (nome,descricao,situacaoAtividade)
values
(N'Service Desk',N'Primeiro nível de atendimento',1),
(N'Infraestrutura',N'Redes, servidores e infraestrutura',1),
(N'Sistemas',N'Sistemas internos e aplicações corporativas',1),
(N'Segurança',N'Segurança da informação e controle de acesso',1),
(N'Suporte de Campo',N'Atendimento presencial e equipamentos',1);

insert into ContaUsuario
(
	login,
	hashSenha,
	dataCriacao,
	dataUltimoAcesso,
	situacaoAtividade,
	funcionario_id,
	perfilUsuario_id
)
values
(N'carlos.souza','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2021-02-01 08:00:00','2026-09-30 08:15:00',1,1,3),
(N'ana.ribeiro','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-03-14 08:00:00','2026-09-30 09:10:00',1,2,2),
(N'bruno.costa','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-07-18 08:00:00','2026-09-30 10:25:00',1,3,2),
(N'camila.lima','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-01-09 08:00:00','2026-09-29 16:20:00',1,4,2),
(N'daniel.rocha','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-02-20 08:00:00','2026-09-30 07:50:00',1,5,2),
(N'elisa.santos','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-04-03 08:00:00','2026-09-30 11:40:00',1,6,2),
(N'felipe.gomes','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-06-12 08:00:00','2026-09-28 14:10:00',1,7,2),
(N'gabriela.melo','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-08-21 08:00:00','2026-09-30 12:30:00',1,8,2),
(N'henrique.silva','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2024-01-15 08:00:00','2026-09-30 15:00:00',1,9,2),
(N'isabela.alves','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2024-02-05 08:00:00','2026-09-30 13:45:00',1,10,2),
(N'joao.castro','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-05-02 08:00:00','2026-09-29 09:30:00',1,11,1),
(N'karina.moraes','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-09-19 08:00:00','2026-09-29 10:10:00',1,12,1),
(N'lucas.prado','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-03-06 08:00:00','2026-09-30 08:40:00',1,13,1),
(N'mariana.dias','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-10-02 08:00:00','2026-09-30 14:20:00',1,14,1),
(N'nicolas.reis','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2024-04-22 08:00:00','2026-09-27 17:00:00',1,15,1),
(N'olivia.leal','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-11-07 08:00:00','2026-09-30 09:55:00',1,16,1),
(N'paulo.mendes','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-05-08 08:00:00','2026-09-30 11:00:00',1,17,1),
(N'quesia.ramos','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2024-06-17 08:00:00','2026-09-30 13:10:00',1,18,1),
(N'rafael.pinto','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2021-08-09 08:00:00','2026-09-29 15:15:00',1,19,1),
(N'sabrina.melo','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-01-24 08:00:00','2026-09-30 08:05:00',1,20,1),
(N'thiago.lima','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2023-07-31 08:00:00','2026-09-30 16:15:00',1,21,1),
(N'ursula.luz','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2024-03-11 08:00:00','2026-09-28 10:00:00',1,22,1),
(N'victor.rezende','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2021-12-13 08:00:00','2026-09-30 10:45:00',1,23,1),
(N'wesley.cunha','SEED_ONLY_NOT_A_REAL_PASSWORD_HASH','2022-06-27 08:00:00','2026-09-29 11:25:00',1,24,1);

insert into EquipeTecnico (contaUsuario_id,equipeSuporte_id,dataHoraEntrada,dataHoraSaida)
values
(2,1,'2024-01-02 08:00:00',null),
(3,1,'2024-01-02 08:00:00',null),
(4,2,'2024-01-02 08:00:00',null),
(5,2,'2024-01-02 08:00:00',null),
(6,3,'2024-01-02 08:00:00',null),
(7,3,'2024-01-02 08:00:00',null),
(8,4,'2024-01-02 08:00:00',null),
(9,5,'2024-01-02 08:00:00',null),
(10,5,'2024-01-02 08:00:00',null),
(2,5,'2023-01-02 08:00:00','2023-12-15 18:00:00'),
(4,1,'2023-06-01 08:00:00','2023-12-20 18:00:00'),
(8,2,'2023-02-01 08:00:00','2023-11-30 18:00:00');

insert into Categoria (nome,descricao,prazoSlaHora,situacaoAtividade)
values
(N'Hardware',N'Falhas ou solicitações relacionadas a hardware',24,1),
(N'Software',N'Problemas em softwares e aplicações instaladas',16,1),
(N'Rede',N'Problemas de conectividade e infraestrutura de rede',8,1),
(N'Acesso',N'Criação, bloqueio ou alteração de acessos',4,1),
(N'E-mail',N'Problemas relacionados a correio eletrônico',8,1),
(N'Impressão',N'Problemas de impressão e impressoras',12,1),
(N'Segurança',N'Incidentes ou solicitações de segurança',2,1),
(N'Outros',N'Chamados não classificados nas demais categorias',48,1);

insert into Prioridade (nome,peso,descricao)
values
(N'Baixa',1,N'Baixo impacto e baixa urgência'),
(N'Normal',2,N'Impacto moderado e operação ainda possível'),
(N'Alta',3,N'Alto impacto ou comprometimento relevante da operação'),
(N'Crítica',4,N'Interrupção grave ou risco elevado ao negócio');

insert into Tag (nome)
values
(N'notebook'),
(N'rede'),
(N'senha'),
(N'vpn'),
(N'email'),
(N'impressora'),
(N'urgente'),
(N'financeiro'),
(N'home-office'),
(N'segurança'),
(N'sistema'),
(N'hardware');

insert into Status (nome,descricao,indicaEncerramento)
values
(N'Aberto',N'Chamado registrado e aguardando triagem',0),
(N'Em triagem',N'Chamado em análise inicial',0),
(N'Em atendimento',N'Chamado em atendimento por técnico',0),
(N'Aguardando usuário',N'Chamado aguardando retorno do solicitante',0),
(N'Resolvido',N'Solução aplicada e aguardando fechamento',0),
(N'Fechado',N'Chamado encerrado após resolução',1),
(N'Cancelado',N'Chamado encerrado sem conclusão do atendimento',1);

insert into TransicaoStatus (statusOrigem_id,statusDestino_id)
values
(1,2),
(1,7),
(2,3),
(2,7),
(3,4),
(3,5),
(3,7),
(4,3),
(4,7),
(5,3),
(5,6),
(5,7);

;with Numeros as
(
	select 1 as n
	union all
	select n + 1
	from Numeros
	where n < 150
),
Base as
(
	select
		n,
		((n - 1) % 8) + 1 as categoria_id,
		((n - 1) % 4) + 1 as prioridade_id,
		((n - 1) % 7) + 1 as status_id,
		((n - 1) % 5) + 1 as equipeSuporte_id,
		((n - 1) % 36) + 1 as funcionario_id,
		dateadd(
			hour,
			n % 9,
			dateadd(
				day,
				-((150 - n) * 2),
				cast('2026-09-25 08:00:00' as datetime2)
			)
		) as dataAbertura
	from Numeros
)
insert into ChamadoSuporte
(
	titulo,
	descricao,
	dataAbertura,
	dataLimite,
	dataResolucao,
	dataFechamento,
	funcionario_id,
	prioridade_id,
	categoria_id,
	status_id,
	equipeSuporte_id,
	tecnicoResponsavel_id
)
select
	concat(N'Chamado de teste ',n),
	case categoria_id
		when 1 then N'Equipamento apresenta falha durante o uso.'
		when 2 then N'Aplicação apresenta erro durante a execução.'
		when 3 then N'Usuário relata lentidão ou indisponibilidade de rede.'
		when 4 then N'Solicitação relacionada a credenciais ou permissões.'
		when 5 then N'Falha no envio ou recebimento de mensagens.'
		when 6 then N'Problema ao imprimir documento corporativo.'
		when 7 then N'Evento que necessita análise da equipe de segurança.'
		else N'Solicitação geral encaminhada ao suporte.'
	end,
	dataAbertura,
	dateadd(
		hour,
		case categoria_id
			when 1 then 24
			when 2 then 16
			when 3 then 8
			when 4 then 4
			when 5 then 8
			when 6 then 12
			when 7 then 2
			else 48
		end,
		dataAbertura
	),
	case
		when status_id in (5,6)
			then dateadd(hour,6 + (n % 30),dataAbertura)
		else null
	end,
	case
		when status_id = 6
			then dateadd(hour,40 + (n % 10),dataAbertura)
		when status_id = 7
			then dateadd(hour,2 + (n % 20),dataAbertura)
		else null
	end,
	funcionario_id,
	prioridade_id,
	categoria_id,
	status_id,
	equipeSuporte_id,
	case
		when status_id in (1,2) and n % 2 = 0 then null
		when equipeSuporte_id = 1 then case when n % 2 = 0 then 2 else 3 end
		when equipeSuporte_id = 2 then case when n % 2 = 0 then 4 else 5 end
		when equipeSuporte_id = 3 then case when n % 2 = 0 then 6 else 7 end
		when equipeSuporte_id = 4 then 8
		when equipeSuporte_id = 5 then case when n % 2 = 0 then 9 else 10 end
	end
from Base
option (maxrecursion 0);

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	1,
	dataAbertura,
	N'Chamado registrado.',
	1,
	null,
	1
from ChamadoSuporte;

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	2,
	dateadd(minute,15,dataAbertura),
	N'Chamado encaminhado para triagem.',
	isnull(tecnicoResponsavel_id,1),
	1,
	case
		when status_id = 7 then 7
		else 2
	end
from ChamadoSuporte
where status_id <> 1;

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	3,
	dateadd(minute,45,dataAbertura),
	N'Atendimento iniciado.',
	isnull(tecnicoResponsavel_id,1),
	2,
	3
from ChamadoSuporte
where status_id in (3,4,5,6);

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	4,
	dateadd(hour,2,dataAbertura),
	N'Aguardando informações adicionais do solicitante.',
	isnull(tecnicoResponsavel_id,1),
	3,
	4
from ChamadoSuporte
where status_id = 4;

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	4,
	isnull(dataResolucao,dateadd(hour,4,dataAbertura)),
	N'Solução aplicada ao chamado.',
	isnull(tecnicoResponsavel_id,1),
	3,
	5
from ChamadoSuporte
where status_id in (5,6);

insert into HistoricoChamado
(
	chamadoSuporte_id,
	sequencia,
	dataHora,
	observacao,
	contaUsuario_id,
	statusAnterior_id,
	statusNovo_id
)
select
	id,
	5,
	dataFechamento,
	N'Chamado fechado após resolução.',
	isnull(tecnicoResponsavel_id,1),
	5,
	6
from ChamadoSuporte
where status_id = 6;

;with TagsChamado as
(
	select
		id as chamadoSuporte_id,
		((id - 1) % 12) + 1 as tag1,
		((id + 3) % 12) + 1 as tag2
	from ChamadoSuporte
)
insert into ChamadoTag (tag_id,chamadoSuporte_id)
select tag1,chamadoSuporte_id
from TagsChamado
union all
select tag2,chamadoSuporte_id
from TagsChamado;

insert into Comentario (texto,dataHora,interno,chamadoSuporte_id,contaUsuario_id)
select
	N'Chamado recebido e registrado para acompanhamento.',
	dateadd(minute,10,dataAbertura),
	0,
	id,
	1
from ChamadoSuporte;

insert into Comentario (texto,dataHora,interno,chamadoSuporte_id,contaUsuario_id)
select
	N'Análise técnica realizada. Verificações iniciais concluídas.',
	dateadd(hour,1,dataAbertura),
	1,
	id,
	isnull(tecnicoResponsavel_id,1)
from ChamadoSuporte
where status_id in (3,4,5,6);

insert into Comentario (texto,dataHora,interno,chamadoSuporte_id,contaUsuario_id)
select
	N'Solução aplicada e registrada para validação.',
	isnull(dataResolucao,dateadd(hour,3,dataAbertura)),
	0,
	id,
	isnull(tecnicoResponsavel_id,1)
from ChamadoSuporte
where status_id in (5,6);

insert into Comentario (texto,dataHora,interno,chamadoSuporte_id,contaUsuario_id)
select
	N'Chamado cancelado após revisão da solicitação.',
	dateadd(hour,1,dataAbertura),
	1,
	id,
	1
from ChamadoSuporte
where status_id = 7;

insert into ChamadoEquipamento (equipamentoTi_id,chamadoSuporte_id)
select
	((id - 1) % 50) + 1,
	id
from ChamadoSuporte
where categoria_id in (1,6);







select
	DB_NAME() as bancoAtual,
	@@SPID as sessao,
	@@TRANCOUNT as transacoesAbertas;

select count(*) as quantidade
from dbo.TipoEquipamento;

select *
from dbo.TipoEquipamento;
















