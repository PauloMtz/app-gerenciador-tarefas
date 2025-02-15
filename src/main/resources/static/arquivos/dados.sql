create table localidades (
    id bigint not null primary key auto_increment,
    cidade varchar(60) not null,
    estado varchar(2) not null
) engine = InnoDB charset = utf8;

create table perfil (
    id bigint not null primary key auto_increment,
    perfil varchar(255)
) engine=InnoDB charset = utf8;

create table tarefas (
    id bigint not null primary key auto_increment,
    categoria enum(
        'JARDINAGEM',
        'LIMPEZA',
        'MANUT_PREDIAL',
        'RESERVAS'
    ) not null,
    concluida bit not null,
    data_conclusao datetime(6),
    data_criacao datetime(6) not null,
    data_expiracao datetime(6) not null,
    descricao varchar(100) not null,
    titulo varchar(100) not null,
    usuario_id bigint,
    foreign key (usuario_id) references usuarios (id)
) engine = InnoDB charset = utf8;

create table usuarios (
    id bigint not null primary key auto_increment,
    ativo bit not null,
    email varchar(100) not null,
    nome varchar(100) not null,
    password varchar(255) not null,
    data_atualizacao datetime(6),
    data_cadastro datetime(6) not null,
    localidade_id bigint,
    foreign key (localidade_id) references localidades (id)
) engine = InnoDB charset = utf8;

create table usuario_perfil (
    usuario_id bigint not null,
    perfil_id bigint not null,
    foreign key (usuario_id) references usuarios (id),
    foreign key (perfil_id) references perfil (id)
) engine=InnoDB charset = utf8;

insert into localidades (id, cidade, estado) values (1, 'Belo Horizonte', 'MG');
insert into localidades (id, cidade, estado) values (2, 'São Paulo', 'SP');
insert into localidades (id, cidade, estado) values (3, 'Campinas', 'SP');
insert into localidades (id, cidade, estado) values (4, 'Vitória', 'ES');
insert into localidades (id, cidade, estado) values (5, 'Londrina', 'PR');
insert into localidades (id, cidade, estado) values (6, 'Curitiba', 'PR');
insert into localidades (id, cidade, estado) values (7, 'Rio Claro', 'SP');
insert into localidades (id, cidade, estado) values (8, 'Uberlândia', 'MG');
insert into localidades (id, cidade, estado) values (9, 'Rio de Janeiro', 'RJ');

insert into perfil (id, perfil) values (1, 'USER');
insert into perfil (id, perfil) values (2, 'ADMIN');

INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (1,true,NULL,current_timestamp,'jose.teste@email.com','José Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',3);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (2,true,NULL,current_timestamp,'lorena.silva@email.com','Lorena Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',7);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (3,true,NULL,current_timestamp,'maria.rita@email.com','Maria Rita','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',4);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (4,true,NULL,current_timestamp,'ribamar.teste@email.com','Ribamar Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',8);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (5,true,NULL,current_timestamp,'ana.beatriz@email.com','Ana Beatriz','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',5);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (6,true,NULL,current_timestamp,'fernanda.beatriz@email.com','Fernanda Beatriz','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',1);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (7,true,NULL,current_timestamp,'marcio.silva@email.com','Márcio Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',9);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (8,true,NULL,current_timestamp,'teobaldo.silva@email.com','Teobaldo Silva','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',2);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (9,true,NULL,current_timestamp,'sebastiao.teste@email.com','Sebastião Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',6);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (10,true,NULL,current_timestamp,'maria.carla@email.com','Maria Carla','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',3);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (11,true,NULL,current_timestamp,'alberto.teste@email.com','Alberto Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',9);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (12,true,NULL,current_timestamp,'edmar.teste@email.com','Edmar Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',2);
INSERT INTO usuarios (id, ativo, data_atualizacao, data_cadastro, email, nome, password, localidade_id) 
    VALUES (13,true,NULL,current_timestamp,'thaissa.teste@email.com','Thaíssa Teste','$2a$10$Yy4ULEwUyyt1ANSF0N7kVuR4xUh2YN8edQq7fyVAXIFMux85RMqrq',5);

INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (1, 2);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (2, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (3, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (4, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (5, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (6, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (7, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (8, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (9, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (10, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (11, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (12, 1);
INSERT INTO usuario_perfil (usuario_id, perfil_id) VALUES (13, 1);

INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (1,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Porta do salão está empenada, não fecha totalmente','Manutenção na porta do salão de festas',2);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    values (2,'JARDINAGEM',false,NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 4 DAY),'A grama está muito alta e com muito mato. Favor aparar.','Aparar a grama do jardim da área centrar',3);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    values (3,'RESERVAS',false,NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Solicito reserva do salão de festas para o próximo final de semana','Reserva do são de festas',4);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    values (4,'LIMPEZA',false,NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Solicito limpeza do salão de festas para a próxima sexta-feira','Limpeza do são de festas',4);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (5,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Porta do elevador não fecha totalmente','Manutenção na porta do elevador',5);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (6,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Fazer a manutenção preventiva na bomba da torre de água','Manutenção preventiva na bomba de água',4);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (7,'LIMPEZA',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Efetuar a limpeza do bloco 07 na próxima semana','Limpeza do bloco 7',13);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (8,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 4 DAY),'Efetuar manutenção corretiva no portão de entrada porque o mesmo está travando','Manutenção no portão de entrada',11);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (9,'RESERVAS',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Solicito reservar o salão de festas para o próximo feriado','Reserva do salão de festas',9);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (10,'JARDINAGEM',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Solicitamos efetuar a poda das árvores no canteiro central da rua do condomínio','Poda de árvores na rua do condomínio',7);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (11,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Verificar o telhado do bloco 4 porque está apresentando vazamentos nos dias de chuva','Verificar telhado do bloco 4',4);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (12,'RESERVAS',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Solicito reserva do salão de festas para o feriado do mês que vem, inclusive o prolongamento para o final de semana','Reserva do salão de festas no feriado do mês que vem',8);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (13,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Favor averificar a porta de vidro da entrada principal do bloco 8. A mesma parece estar travando.','Verificar a porta da entrada principal do bloco 8',2);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (14,'JARDINAGEM',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Favor efetuar a poda do gramado dos fundos porque o gramado está muito alto','Aparar a grama no fundo do condomínio',10);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (15,'LIMPEZA',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Solicito efetuar a limpeza do bloco 5 nos próximos dias porque o mesmo está apresentando a necessidade de limpeza','Limpeza do bloco 5 nos próximos dias',6);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (16,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Porta do elevador do bloco 2 não fecha totalmente','Manutenção na porta do elevador do bloco 2',12);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (17,'LIMPEZA',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Favor efetuar a limpeza do ambiente de dispensa do lixo','Limpeza no local de dispensa do lixo',5);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (18,'RESERVAS',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Solicito reserva do salão de festas para o segundo final de semana do mês que vem','Reserva do salão de festas',7);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (19,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 3 DAY),'Favor verificar as janelas do lado do fundo do bloco 8 porque tem algumas com vidros quebrados','Verificar janelas dos fundos do bloco 8',9);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (20,'LIMPEZA',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 4 DAY),'Solicito limpeza da vala de escoamento da água de chuva na rua do condomínio na altura do bloco 3','Limpeza da vala de escoamento da água de chuva',13);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (21,'JARDINAGEM',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Efetuar a poda dos galhos das árvores na rua do condomínio que estão caindo em cima dos carros que passam pela rua.','Poda dos galhos das árvores na rua do condomínio',5);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (22,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 DAY),'Verificar as lâmpada do salão de festas porque algumas delas estão apresentando instabilidade.','Verificar as lâmpadas do salão de festas',7);
INSERT INTO tarefas (id, categoria, concluida, data_conclusao, data_criacao, data_expiracao, descricao, titulo, usuario_id)
    VALUES (23,'MANUT_PREDIAL',false, NULL,current_timestamp,DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 2 DAY),'Verificar a porta do elevador do bloco 1 porque a mesma não fecha totalmente','Manutenção na porta do elevador do bloco 1',12);
