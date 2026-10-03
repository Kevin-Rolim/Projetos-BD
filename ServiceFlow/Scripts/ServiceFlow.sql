--use master

--create database ServiceFlow

use ServiceFlow


create table Departamentos
(
	id					int identity(1,1)		not null
		constraint 		Pk_Departamentos
			primary key,
	nome				nvarchar(50)			not null,
	centroCusto			nvarchar(20)			not null,
	situacaoAtividade	bit						not null
		constraint		Df_Departamentos_situacaoAtividade
			default 1
)


create table Funcionarios
(
	id					int identity(1,1)		not null
		constraint 		Pk_Funcionarios
			primary key,
	nome				nvarchar(100)			not null,
	cpf					char(11)				not null,
	email				nvarchar(150)			not null,
	telefone			nvarchar(15)			null,
	dataAdmissao		date					not null,
	situacaoAtividade	bit						not null
		constraint		Df_Funcionarios_situacaoAtividade
			default 1,
	departamento_id		int						not null,

	constraint			Uq_Funcionarios_cpf
		unique (cpf),

	constraint			Uq_Funcionarios_email
		unique (email),

	constraint			Fk_Funcionarios_Departamento
		foreign key (departamento_id)
		references Departamentos(id)
)


create table TipoEquipamento
(
	id					int identity(1,1)		not null
		constraint		Pk_TipoEquipamento
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			null,

	constraint			Uq_TipoEquipamento_nome
		unique (nome)
)


create table Fabricante
(
	id					int identity(1,1)		not null
		constraint		Pk_Fabricante
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			not null,

	constraint			Uq_Fabricante_nome
		unique (nome)
)


create table Modelo
(
	id					int identity(1,1)		not null
		constraint		Pk_Modelo
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			not null,
	tipoEquipamento_id	int						not null,
	fabricante_id		int						not null,

	constraint			Fk_Modelo_tipoEquipamento_id
		foreign key (tipoEquipamento_id)
		references TipoEquipamento(id),

	constraint			Fk_Modelo_fabricante_id
		foreign key (fabricante_id)
		references Fabricante(id),

	constraint			Uq_Modelo_fabricante_nome
		unique (fabricante_id,nome)
)


create table SituacaoEquipamento
(
	id					int identity(1,1)		not null
		constraint		Pk_SituacaoEquipamento
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			null,

	constraint			Uq_SituacaoEquipamento_nome
		unique (nome)
)


create table EquipamentoTi
(
	id						int identity(1,1)		not null
		constraint			Pk_EquipamentoTi
			primary key,
	numeroPatrimonio		nvarchar(50)			not null,
	numeroSerie				nvarchar(50)			not null,
	dataAquisicao			date					not null,
	modelo_id				int 					not null,
	situacaoEquipamento_id	int						not null,

	constraint			Uq_EquipamentoTi_numeroPatrimonio
		unique (numeroPatrimonio),

	constraint			Uq_EquipamentoTi_numeroSerie
		unique (numeroSerie),

	constraint			Fk_EquipamentoTi_modelo_id
		foreign key (modelo_id)
		references Modelo(id),

	constraint			Fk_EquipamentoTi_situacaoEquipamento_id
		foreign key (situacaoEquipamento_id)
		references SituacaoEquipamento(id)
)


create table AlocacaoEquipamento
(
	equipamentoTi_id	int						not null,
	dataHoraEntrega		datetime2				not null,
	dataHoraDevolucao	datetime2				null,
	funcionario_id		int						not null,

	constraint			Pk_AlocacaoEquipamento
		primary key (equipamentoTi_id,dataHoraEntrega),

	constraint			Fk_AlocacaoEquipamento_equipamentoTi_id
		foreign key (equipamentoTi_id)
		references EquipamentoTi(id),

	constraint			Fk_AlocacaoEquipamento_funcionario_id
		foreign key (funcionario_id)
		references Funcionarios(id),

	constraint			Ck_AlocacaoEquipamento_periodo
		check(
			dataHoraDevolucao is null
			or dataHoraDevolucao >= dataHoraEntrega
		)
)


create table PerfilUsuario
(
	id					int identity(1,1)		not null
		constraint		Pk_PerfilUsuario
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			null,

	constraint			Uq_PerfilUsuario_nome
		unique (nome)
)


create table EquipesSuporte
(
	id					int identity(1,1)		not null
		constraint		Pk_EquipesSuporte
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			null,
	situacaoAtividade	bit						not null
		constraint		Df_EquipesSuporte_situacaoAtividade
			default 1,

	constraint			Uq_EquipesSuporte_nome
		unique (nome)
)


create table ContaUsuario
(
	id					int identity(1,1)		not null
		constraint		Pk_ContaUsuario
			primary key,
	login				nvarchar(50)			not null,
	hashSenha			varchar(255)			not null,
	dataCriacao			datetime2				not null
		constraint		Df_ContaUsuario_dataCriacao
			default sysdatetime(),
	dataUltimoAcesso	datetime2				null,
	situacaoAtividade	bit						not null
		constraint		Df_ContaUsuario_situacaoAtividade
			default 1,
	funcionario_id		int						not null,
	perfilUsuario_id	int						not null,

	constraint			Uq_ContaUsuario_login
		unique (login),

	constraint			Uq_ContaUsuario_funcionario_id
		unique (funcionario_id),

	constraint			Fk_ContaUsuario_funcionario_id
		foreign key (funcionario_id)
		references Funcionarios(id),

	constraint			Fk_ContaUsuario_perfilUsuario_id
		foreign key (perfilUsuario_id)
		references PerfilUsuario(id),

	constraint			Ck_ContaUsuario_dataUltimoAcesso
		check(
			dataUltimoAcesso is null
			or dataUltimoAcesso >= dataCriacao
		)
)


create table EquipeTecnico
(
	contaUsuario_id		int						not null,
	equipeSuporte_id	int						not null,
	dataHoraEntrada		datetime2				not null,
	dataHoraSaida		datetime2				null,

	constraint			Pk_EquipeTecnico
		primary key (contaUsuario_id,equipeSuporte_id,dataHoraEntrada),

	constraint			Fk_EquipeTecnico_contaUsuario_id
		foreign key (contaUsuario_id)
		references ContaUsuario(id),

	constraint			Fk_EquipeTecnico_equipeSuporte_id
		foreign key (equipeSuporte_id)
		references EquipesSuporte(id),

	constraint			Ck_EquipeTecnico_periodo
		check(
			dataHoraSaida is null
			or dataHoraSaida >= dataHoraEntrada
		)
)


create table Categoria
(
	id					int identity(1,1)		not null
		constraint		Pk_Categoria
			primary key,
	nome				nvarchar(100)			not null,
	descricao			nvarchar(250)			null,
	prazoSlaHora		smallint				not null,
	situacaoAtividade	bit						not null
		constraint		Df_Categoria_situacaoAtividade
			default 1,

	constraint			Uq_Categoria_nome
		unique (nome),

	constraint			Ck_Categoria_prazoSlaHora
		check(prazoSlaHora > 0)
)


create table Prioridade
(
	id					int identity(1,1)		not null
		constraint		Pk_Prioridade
			primary key,
	nome				nvarchar(100)			not null,
	peso				tinyint					not null,
	descricao			nvarchar(200)			null,

	constraint			Uq_Prioridade_nome
		unique (nome),

	constraint			Uq_Prioridade_peso
		unique (peso),

	constraint			Ck_Prioridade_peso
		check(peso > 0)
)


create table Tag
(
	id					int identity(1,1)		not null
		constraint		Pk_Tag
			primary key,
	nome				nvarchar(50)			not null,

	constraint 			Uq_Tag_nome
		unique (nome)
)


create table Status
(
	id					int identity(1,1)		not null
		constraint		Pk_Status
			primary key,
	nome				nvarchar(50)			not null,
	descricao			nvarchar(200)			not null,
	indicaEncerramento	bit						not null
		constraint		Df_Status_indicaEncerramento
			default 0,

	constraint			Uq_Status_nome
		unique (nome)
)


create table TransicaoStatus
(
	statusOrigem_id		int						not null,
	statusDestino_id	int						not null,

	constraint			Pk_TransicaoStatus
		primary key (statusOrigem_id,statusDestino_id),

	constraint			Fk_TransicaoStatus_statusOrigem_id
		foreign key (statusOrigem_id)
		references Status(id),

	constraint			Fk_TransicaoStatus_statusDestino_id
		foreign key (statusDestino_id)
		references Status(id),

	constraint			Ck_TransicaoStatus_statusDiferentes
		check(statusOrigem_id <> statusDestino_id)
)


create table ChamadoSuporte
(
	id					int identity(1,1)		not null
		constraint		Pk_ChamadoSuporte
			primary key,
	titulo				nvarchar(100)			not null,
	descricao			nvarchar(200)			null,
	dataAbertura		datetime2				not null
		constraint		Df_ChamadoSuporte_dataAbertura
			default sysdatetime(),
	dataLimite			datetime2				not null,
	dataResolucao		datetime2				null,
	dataFechamento		datetime2				null,
	funcionario_id		int						not null,
	prioridade_id		int						not null,
	categoria_id		int						not null,
	status_id			int 					not null,
	equipeSuporte_id	int						not null,
	tecnicoResponsavel_id int					null,

	constraint			Fk_ChamadoSuporte_funcionario_id
		foreign key (funcionario_id)
		references Funcionarios(id),

	constraint			Fk_ChamadoSuporte_prioridade_id
		foreign key (prioridade_id)
		references Prioridade(id),

	constraint			Fk_ChamadoSuporte_categoria_id
		foreign key (categoria_id)
		references Categoria(id),

	constraint			Fk_ChamadoSuporte_status_id
		foreign key (status_id)
		references Status(id),

	constraint			Fk_ChamadoSuporte_equipeSuporte_id
		foreign key (equipeSuporte_id)
		references EquipesSuporte(id),

	constraint			Fk_ChamadoSuporte_tecnicoResponsavel_id
		foreign key (tecnicoResponsavel_id)
		references ContaUsuario(id),

	constraint			Ck_ChamadoSuporte_dataLimite
		check(dataLimite >= dataAbertura),

	constraint			Ck_ChamadoSuporte_dataResolucao
		check(
			dataResolucao is null
			or dataResolucao >= dataAbertura
		),

	constraint			Ck_ChamadoSuporte_dataFechamento
		check(
			dataFechamento is null
			or dataFechamento >= dataAbertura
		),

	constraint			Ck_ChamadoSuporte_resolucaoFechamento
		check(
			dataResolucao is null
			or dataFechamento is null
			or dataFechamento >= dataResolucao
		)
)


create table HistoricoChamado
(
	chamadoSuporte_id	int 					not null,
	sequencia			int						not null,
	dataHora			datetime2				not null
		constraint		Df_HistoricoChamado_dataHora
			default sysdatetime(),
	observacao			nvarchar(200)			null,
	contaUsuario_id	int						not null,
	statusAnterior_id	int						null,
	statusNovo_id		int						not null,

	constraint			Pk_HistoricoChamado
		primary key (chamadoSuporte_id,sequencia),

	constraint			Ck_HistoricoChamado_sequencia
		check(sequencia > 0),

	constraint			Fk_HistoricoChamado_chamadoSuporte_id
		foreign key (chamadoSuporte_id)
		references ChamadoSuporte(id),

	constraint			Fk_HistoricoChamado_contaUsuario_id
		foreign key (contaUsuario_id)
		references ContaUsuario(id),

	constraint			Fk_HistoricoChamado_statusAnterior_id
		foreign key (statusAnterior_id)
		references Status(id),

	constraint			Fk_HistoricoChamado_statusNovo_id
		foreign key (statusNovo_id)
		references Status(id)
)


create table ChamadoTag
(
	tag_id				int						not null,
	chamadoSuporte_id	int						not null,

	constraint			Pk_ChamadoTag
		primary key (tag_id,chamadoSuporte_id),

	constraint			Fk_ChamadoTag_tag_id
		foreign key (tag_id)
		references Tag(id),

	constraint			Fk_ChamadoTag_chamadoSuporte_id
		foreign key (chamadoSuporte_id)
		references ChamadoSuporte(id)
)


create table Comentario
(
	id					int identity(1,1)		not null
		constraint		Pk_Comentario
			primary key,
	texto				nvarchar(1000)			not null,
	dataHora			datetime2				not null
		constraint		Df_Comentario_dataHora
			default sysdatetime(),
	interno				bit						not null
		constraint		Df_Comentario_interno
			default 0,
	chamadoSuporte_id	int						not null,
	contaUsuario_id	int						not null,

	constraint			Fk_Comentario_chamadoSuporte_id
		foreign key (chamadoSuporte_id)
		references ChamadoSuporte(id),

	constraint			Fk_Comentario_contaUsuario_id
		foreign key (contaUsuario_id)
		references ContaUsuario(id)
)


create table ChamadoEquipamento
(
	equipamentoTi_id	int						not null,
	chamadoSuporte_id	int						not null,

	constraint			Pk_ChamadoEquipamento
		primary key (equipamentoTi_id,chamadoSuporte_id),

	constraint			Fk_ChamadoEquipamento_equipamentoTi_id
		foreign key (equipamentoTi_id)
		references EquipamentoTi(id),

	constraint			Fk_ChamadoEquipamento_chamadoSuporte_id
		foreign key (chamadoSuporte_id)
		references ChamadoSuporte(id)
)