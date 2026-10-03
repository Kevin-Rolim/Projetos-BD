use ServiceFlow

--Receber data de abertura e quantidade de horas do SLA e devolver a data limite.
create or alter function fn_CalcularDataLimiteSLA (@dataAbertura datetime2, @idSLA int)
returns datetime2
as
begin
	return dateadd(hour,(select prazoSlaHora from Categoria where id = @idSLA),@dataAbertura)
end

declare @idSLA int = 1
select 
	SYSDATETIME() [Data de Abertura],
	dbo.fn_CalcularDataLimiteSLA(SYSDATETIME(), @idSLA) DataLimite

--Receber limite/resolução e devolver algo como No prazo, Vencido, Resolvido no prazo ou Resolvido fora do prazo.
create or alter function fn_SituacaoSLA (@dataLimite datetime2, @dataResolucao datetime2)
returns varchar(30)
as
begin
	return 
		case 
			when @dataLimite < @dataResolucao and @dataResolucao is not null 
				then 'Resolvido fora do prazo'
			when @dataLimite > @dataResolucao and @dataResolucao is not null
				then 'Resolvido dentro do prazo'
			when @dataLimite = @dataResolucao and @dataResolucao is not null
				then 'No Prazo'
			when @dataResolucao is null
				then 'Vencida'
		end
end

declare @horas int = 5
declare @resolucao int = null
select dbo.fn_SituacaoSLA (dateadd(hour,@horas,sysdatetime()),dateadd(hour,@resolucao,sysdatetime()))

--Receber um funcionario_id e devolver os chamados daquele funcionário.
create or alter function fn_ChamadosPorFuncionario(@idFunc int)
returns table
as
	return	
		select
			count(f.id) [Qtd. Chamados]
		from ChamadoSuporte cs
		inner join Funcionarios f
			on cs.funcionario_id = f.id
		where f.id = @idFunc
		group by f.id


declare @idFunc int = 1
select 
	f.nome [Nome do Funcionário],
	chamados.[Qtd. Chamados]
from Funcionarios f
--Um charme só para eu poder exibir da forma que eu gosto
cross apply dbo.fn_ChamadosPorFuncionario(f.id) chamados 
where f.id = @idFunc 




