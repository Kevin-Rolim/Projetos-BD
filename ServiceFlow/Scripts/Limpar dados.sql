use ServiceFlow;

begin try
	begin transaction;

	delete from ChamadoEquipamento;
	delete from Comentario;
	delete from ChamadoTag;
	delete from HistoricoChamado;
	delete from ChamadoSuporte;

	delete from TransicaoStatus;

	delete from EquipeTecnico;
	delete from ContaUsuario;

	delete from AlocacaoEquipamento;
	delete from EquipamentoTi;
	delete from Modelo;

	delete from SituacaoEquipamento;
	delete from TipoEquipamento;
	delete from Fabricante;

	delete from PerfilUsuario;
	delete from Categoria;
	delete from Prioridade;
	delete from Tag;
	delete from Status;
	delete from EquipesSuporte;

	delete from Funcionarios;
	delete from Departamentos;

	dbcc checkident ('Departamentos', reseed, 0);
	dbcc checkident ('Funcionarios', reseed, 0);
	dbcc checkident ('TipoEquipamento', reseed, 0);
	dbcc checkident ('Fabricante', reseed, 0);
	dbcc checkident ('Modelo', reseed, 0);
	dbcc checkident ('SituacaoEquipamento', reseed, 0);
	dbcc checkident ('EquipamentoTi', reseed, 0);
	dbcc checkident ('PerfilUsuario', reseed, 0);
	dbcc checkident ('EquipesSuporte', reseed, 0);
	dbcc checkident ('ContaUsuario', reseed, 0);
	dbcc checkident ('Categoria', reseed, 0);
	dbcc checkident ('Prioridade', reseed, 0);
	dbcc checkident ('Tag', reseed, 0);
	dbcc checkident ('Status', reseed, 0);
	dbcc checkident ('ChamadoSuporte', reseed, 0);
	dbcc checkident ('Comentario', reseed, 0);

	commit transaction;
end try
begin catch
	if @@trancount > 0
		rollback transaction;

	throw;
end catch;

select 'Departamentos' as tabela, count(*) quantidade from Departamentos
union all
select 'Funcionarios', count(*) from Funcionarios
union all
select 'EquipamentoTi', count(*) from EquipamentoTi
union all
select 'ContaUsuario', count(*) from ContaUsuario
union all
select 'ChamadoSuporte', count(*) from ChamadoSuporte
union all
select 'HistoricoChamado', count(*) from HistoricoChamado
union all
select 'Comentario', count(*) from Comentario;


