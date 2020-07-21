create database correios
default character set utf8
default collate utf8_general_ci;

create table remetente (
nomeRemetente varchar (30) not null,
cpfRemetente varchar (20) not null,
volume int not null,
primary key (cpfRemetente)
)default charset = utf8;

insert into remetente (nomeRemetente, cpfRemetente, volume) 
values
('João Vitor Maia', '744.286.397-11', '1' ),
('Elaine Pereira Nascimento', '214.653.921-66', '5' ),
('Maria Dolores', '002.255.963-52', '2' ),
('Janaina Fraga', '062.231.888-38', '1' );
select * from remetente;

create table destinatarios (
nomeDestinatario varchar (30) not null,
cpfDestinatario varchar (20) not null,
cep varchar (20) not null,
endereçodeEntrega varchar (100) not null,
primary key (cpfDestinatario)
)default charset = utf8;
describe destinatarios;

insert into destinatarios (nomeDestinatario, cpfDestinatario, cep, endereçodeEntrega)
values
('Pedro josé', '898.603.322-01', '53020-302', 'Rua Mq. Gonçalves, 113, Encruzilhada - Recife, PE'),
('Marina Albuquerque', '774.683.922-04', '02102-230', 'Rua Lp. de Melo, 188, Jacilândia - Salvador, BA' ),
('Joana Feitosa de Lima', '055.125.363-22', '23300-510', 'Rua Juca Tatu, 203, Prazeres - Jb. dos Guararapes, PE' ),
('Roberto Garcia Marques', '165.221.218-78', '30450-244','Av Jacarandáia, 704, Peixinhos - Olinda, PE');
select * from destinatarios;

create table infoEntrega (
idEntrega int not null,
tipoProduto varchar (30) not null,
dataPostagem date not null,
dataPrevistaEntrega date not null,
primary key (idEntrega)
)default charset = utf8;

alter table infoEntrega
add column remetenteCPF varchar (30) after idEntrega;

alter table infoEntrega
add foreign key (remetenteCPF)
references remetente (cpfRemetente);

insert into infoEntrega (idEntrega, tipoProduto, dataPostagem, dataPrevistaEntrega)
values 
('58782', 'Eletrodoméstico', '2020-07-20', '2020-08-05'),
('62851', 'Roupa', '2020-07-15', '2020-07-31'),
('54654', 'Instrumento Musical','2020-07-18', '2020-08-04'),
('52563', 'Artigo Esportivo', '2020-07-13', '2020-07-29');
select*from infoEntrega;

select * from infoEntrega
where dataPrevistaEntrega>'2020-08-01'
order by dataPrevistaEntrega;

select idEntrega, tipoProduto from infoEntrega
where idEntrega = '52563';

select * from infoEntrega
where dataPostagem between'2020-07-10'and '2020-07-15';

update infoEntrega
set tipoProduto = 'Eletroeletrônico'
where idEntrega = '58782';

update infoEntrega 
set dataPrevistaEntrega = '2020-07-28'
where idEntrega = '62851';

update remetente
set nomeRemetente = 'João Paulo Maia'
where cpfRemetente = '744.286.397-11';




