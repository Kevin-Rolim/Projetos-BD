use ServiceFlow

--Abrir um chamado validando funcionário, categoria, equipe e demais dados; calcular dataLimite;
-- definir status inicial e registrar o primeiro histórico.

create or alter procedure sp_AbrirChamado
	@titulo nvarchar(100), 
	@descricao nvarchar(200),
	@idFuncionario int,
	@idPrioridade int,
	@idCategoria int,
	@idEquipeSuporte int,
	@idContaUsuario int
as
begin
	set nocount on;
	set xact_abort on;
	begin try
		begin transaction;
		if not exists (
			select 1
			from Funcionarios
			where id = @idFuncionario and situacaoAtividade = 1
		)throw 50001, 'Funcionário inexistente ou inativo.', 1;
		if not exists (
			select 1
			from Prioridade
			where id = @idPrioridade
		)throw 50002, 'Prioridade inexistente.', 1;
		if not exists (
			select 1
			from Categoria
			where id = @idCategoria and situacaoAtividade = 1
		)throw 50003, 'Categoria inexistente ou inativa.', 1;
		if not exists (
			select 1
			from EquipesSuporte
			where id = @idEquipeSuporte and situacaoAtividade = 1
		)throw 50004, 'Equipe de suporte inexistente ou inativa.', 1;

		if not exists (
			select 1
			from ContaUsuario
			where id = @idContaUsuario and situacaoAtividade = 1
		)throw 50005, 'Conta de usuário inexistente ou inativa.', 1;
		declare @prazoSlaHora smallint;
		declare @idStatusInicial int;
		declare @dataAbertura datetime2;
		declare @dataLimite datetime2;
		declare @idChamado int;
		select @prazoSlaHora = prazoSlaHora
		from Categoria
		where id = @idCategoria;
		select @idStatusInicial = id
		from Status
		where nome = 'Aberto';
		if @idStatusInicial is null
			throw 50006, 'Status inicial Aberto não cadastrado.', 1;
		set @dataAbertura = sysdatetime();
		set @dataLimite = dateadd(
			hour,
			@prazoSlaHora,
			@dataAbertura
		)insert into ChamadoSuporte (
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
		)values (
			@titulo,
			@descricao,
			@dataAbertura,
			@dataLimite,
			null,
			null,
			@idFuncionario,
			@idPrioridade,
			@idCategoria,
			@idStatusInicial,
			@idEquipeSuporte,
			null
		)set @idChamado = scope_identity();
		insert into HistoricoChamado (
			chamadoSuporte_id,
			sequencia,
			dataHora,
			observacao,
			contaUsuario_id,
			statusAnterior_id,
			statusNovo_id
		)
		values (
			@idChamado,
			1,
			@dataAbertura,
			'Abertura do chamado',
			@idContaUsuario,
			null,
			@idStatusInicial
		)commit transaction;
		select @idChamado [idChamado];
	end try
	begin catch

		if @@trancount > 0
			rollback transaction;
		throw;
	end catch
end;

--(titulo,descricao,idFuncionario,idPrioridade,idCategoria,idEquipeSuporte,idContaUsuario)
exec dbo.sp_AbrirChamado 'Chamado de teste 151',null,1,1,1,1,1

--Atribuir ou trocar o técnico responsável, validando se a conta é de técnico e se pertence atualmente à equipe 
--responsável.

create or alter procedure sp_AtribuirTecnico(@idCS int, @idTecnico int)
as
begin
	set nocount on
	set xact_abort on

	begin try
		begin tran
		if not exists (
			select 1
			from ChamadoSuporte
			where id = @idCS
		)throw 50001, 'Chamado inexistente.', 1;
		if not exists (
			select 1
			from ContaUsuario
			where id = @idTecnico
				and situacaoAtividade = 1
		)throw 50002, 'Técnico inexistente ou inativo.', 1;
		if not exists (
			select 1
			from ContaUsuario cu
			inner join PerfilUsuario pu
				on cu.perfilUsuario_id = pu.id
			where cu.id = @idTecnico and pu.nome = 'Técnico'
		)throw 50003, 'Conta não pertence a um técnico.', 1;
		if not exists (
			select 1
			from EquipeTecnico et
			inner join ChamadoSuporte cs
				on et.equipeSuporte_id = cs.equipeSuporte_id
			where et.contaUsuario_id = @idTecnico and cs.id = @idCS and et.dataHoraSaida is null
		)throw 50004, 'Técnico não pertence atualmente à equipe responsável pelo chamado.', 1;
		update ChamadoSuporte
		set tecnicoResponsavel_id = @idTecnico
		where id = @idCS
		commit
	end try
	begin catch
		if @@trancount > 0
			rollback
	end catch
end

-- id do chamado, id do tecnico
exec dbo.sp_AtribuirTecnico 

-- Vetificar dados para a procedure sp_AtribuirTecnico
select * from ChamadoSuporte
select
	f.id Id,
	f.nome [Técnico],
	es.nome [Equipe de Suporte]
	from Funcionarios f
	inner join ContaUsuario cu
		on cu.funcionario_id = f.id
	inner join PerfilUsuario pu
		on cu.perfilUsuario_id = pu.id
	inner join EquipeTecnico et
		on cu.id = et.contaUsuario_id
	inner join EquipesSuporte es 
		on et.equipeSuporte_id = es.id
	where pu.id = 2

select * from PerfilUsuario pu 

--Alterar o status somente se a transição estiver cadastrada em TransicaoStatus;
--registrar histórico e preencher datas de resolução/fechamento quando necessário.

create or alter procedure sp_AlterarStatusChamado(@idCS int,@idStatus int,@idContaUsuario int)
as
begin
	set nocount on
	set xact_abort on

	begin try
		begin tran
		if not exists (select 1	from ChamadoSuporte	where id = @idCS)throw 50001, 'Chamado inexistente.', 1;
		if not exists (select 1	from Status	where id = @idStatus)throw 50002, 'Status inexistente.', 1
		if not exists (select 1	from ContaUsuario where id = @idContaUsuario)throw 50003, 'Conta de usuário inexistente.', 1
		declare @idStatusAnterior int
		declare @nomeStatus nvarchar(50)
		declare @sequencia int
		declare @dataHora datetime2
		select @idStatusAnterior = status_id
		from ChamadoSuporte
		where id = @idCS
		if not exists (
		select 1 from TransicaoStatus 
		where statusOrigem_id = @idStatusAnterior and statusDestino_id = @idStatus
		)throw 50004, 'Não é possível fazer essa transição.', 1
		
		select @nomeStatus = nome from Status where id = @idStatus
		set @dataHora = sysdatetime()
		update ChamadoSuporte set status_id = @idStatus	where id = @idCS
		if @nomeStatus = 'Resolvido'
		begin
			update ChamadoSuporte
			set dataResolucao = @dataHora
			where id = @idCS;
		end
		if @nomeStatus = 'Fechado'
		begin
			update ChamadoSuporte
			set dataFechamento = @dataHora
			where id = @idCS;
		end
		select @sequencia = isnull(max(sequencia),0) + 1
		from HistoricoChamado
		where chamadoSuporte_id = @idCS;
		insert into HistoricoChamado (
			chamadoSuporte_id,
			sequencia,
			dataHora,
			observacao,
			contaUsuario_id,
			statusAnterior_id,
			statusNovo_id
		)values (@idCS,@sequencia,@dataHora,null,@idContaUsuario,@idStatusAnterior,@idStatus
		)commit
	end try
	begin catch
		if @@trancount > 0
			rollback
	end catch
end










