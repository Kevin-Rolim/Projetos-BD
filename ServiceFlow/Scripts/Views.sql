use ServiceFlow
--Exibir o chamado já enriquecido com solicitante, departamento, categoria, prioridade, 
--status, equipe e técnico responsável. É a visão principal para consultas e relatórios.

create or alter view vw_ChamadosDetalhados
as
	select
		cs.id					[Chamado],
		cs.titulo				[Título],
		f.nome					[Nome do Solicitante],
		d.nome					[Departamento],
		c.nome					[Categoria],
		p.nome					[Prioridade],
		s.nome					[Status],
		es.nome					[Equipe de Suporte],
		cu.login				[Técnico Responsável],
		cs.dataAbertura			[Data de Abertura],
		cs.dataLimite			[Data Limite],
		cs.dataResolucao		[Data de Resolução],
		cs.dataFechamento		[Data de Fechamento]
	from ChamadoSuporte cs
		inner join Funcionarios f
			on cs.funcionario_id = f.id
		inner join Departamentos d
			on f.departamento_id = d.id
		inner join Prioridade p
			on cs.prioridade_id = p.id
		inner join Categoria c
			on cs.categoria_id = c.id
		inner join Status s
			on cs.status_id = s.id
		inner join EquipesSuporte es
			on cs.equipeSuporte_id = es.id
		left join ContaUsuario cu
			on cs.tecnicoResponsavel_id = cu.id

select * from vw_ChamadosDetalhados	
		
select * from ChamadoSuporte
select * from Funcionarios
select * from Departamentos
select * from Prioridade
select * from Categoria
select * from Status
select * from EquipesSuporte
select * from ContaUsuario
select * from EquipeTecnico 

--Retornar apenas chamados cujo status não representa encerramento, 
--mostrando prioridade, equipe, técnico, abertura e limite do SLA.

create or alter view vw_ChamadosAbertos
as
	select 
		p.nome 			[Prioridade],
		es.nome 		[Equipe],
		cu.login		[Técnico],
		cs.dataAbertura	[Data de Abertura],
		cs.dataLimite	[Data Limite],
		c.prazoSlaHora	[Limite do SLA]
	from chamadoSuporte cs
		inner join Prioridade p
			on cs.prioridade_id = p.id 
		inner join EquipesSuporte es
			on cs.equipeSuporte_id = es.id
		left join ContaUsuario cu
			on cs.tecnicoResponsavel_id = cu.id 
		inner join Categoria c
			on cs.categoria_id = c.id 
		inner join Status s
			on cs.status_id = s.id
	where s.indicaEncerramento = 0
	
select * from vw_ChamadosAbertos	

--Mostrar cada chamado com data de abertura, limite, resolução e situação do SLA: 
--dentro do prazo, vencido, resolvido no prazo ou resolvido fora do prazo.

create or alter view vw_ChamadosSLA
as
	select 
		cs.titulo			[Chamado],
		cs.dataAbertura 	[Data de Abertura],
		cs.dataLimite		[Data Limite],
		cs.dataResolucao	[Data da Resolução],
		case 
			when cs.dataResolucao is not null and cs.dataResolucao > cs.dataLimite
				then 'Resolvido Fora do Prazo'
			when cs.dataResolucao is not null and cs.dataResolucao < cs.dataLimite
				then 'Resolvido dentro Prazo'
			when cs.dataResolucao is not null and cs.dataResolucao = cs.dataLimite
				then 'Resolvido no Prazo'
			when cs.dataResolucao is null and getdate() > cs.dataLimite and s.indicaEncerramento = 0
				then 'Vencido'
			when cs.dataResolucao is null and getdate() <= cs.dataLimite and s.indicaEncerramento = 0
				then 'Dentro do Prazo'
			else 'Encerrado sem Resolução'
		end 				[Estado]
	from ChamadoSuporte cs
		inner join Status s 
			on cs.status_id = s.id

select * from vw_chamadosSLA


--Agrupar chamados ainda não encerrados por equipe, mostrando quantidade total e distribuição por prioridade/status.

create or alter view vw_BacklogEquipes
as
	select 
		es.nome				[Equipe],
		s.nome				[Status],
		p.nome				[Prioridade],
		count(cs.id)		[Chamados não Encerrados]
	from ChamadoSuporte cs
		inner join EquipesSuporte es
			on cs.equipeSuporte_id = es.id
		inner join Status s 
			on cs.status_id = s.id
		inner join Prioridade p 
			on cs.prioridade_id = p.id
	where s.indicaEncerramento = 0
	group by es.nome, s.nome, p.nome
	
select * from vw_BacklogEquipes

--Consolidar por técnico quantidade atribuída, resolvida/fechada e tempo médio de resolução.
create or alter view vw_DesempenhoTecnicos
as
	select
		f.nome	[Nome Técnico],
		count(f.nome) [Quantidade Atribuida],
		sum(case
				when s.nome = 'Resolvido' or s.nome = 'Fechado' then 1
				else 0
			end) [Resolvida/Fechada],
		avg(case
				when cs.dataResolucao is not null
					then datediff(hour,cs.dataAbertura,cs.dataResolucao)
				when cs.dataFechamento is not null
					then datediff(hour,cs.dataAbertura,cs.dataFechamento)
			end) [Média/HR]
	from EquipeTecnico et
		inner join ContaUsuario cu
			on et.contaUsuario_id = cu.id
		inner join Funcionarios f
			on cu.funcionario_id = f.id
		left join ChamadoSuporte cs
			on cs.tecnicoResponsavel_id = cu.id
		inner join Status s
			on cs.status_id = s.id
	group by f.nome
	
select * from vw_DesempenhoTecnicos

--Mostrar somente equipamentos com alocação atual, incluindo funcionário, 
--departamento, modelo, fabricante e data de entrega.

create or alter view vw_EquipamentosEmUso
as
	select 
		m.nome 				[Equipamento],
		fa.nome				[Fabricante],
		et.numeroPatrimonio	[Patrimônio],
		et.numeroSerie		[Número de Série],
		f.nome				[Funcionário],
		d.nome				[Departamento],
		ae.dataHoraEntrega 	[Data de Entrega]
	from AlocacaoEquipamento ae
	inner join EquipamentoTi et
		on ae.equipamentoTi_id = et.id
	inner join Funcionarios f 
	    on ae.funcionario_id = f.id
	inner join Departamentos d 
	    on f.departamento_id = d.id
	inner join Modelo m
		on et.modelo_id = m.id
	inner join Fabricante fa
		on m.fabricante_id = fa.id
	where ae.dataHoraDevolucao is null
	
select * from vw_EquipamentosEmUso
	

