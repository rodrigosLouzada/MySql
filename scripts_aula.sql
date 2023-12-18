/*CREATE TABLE cliente(
	i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    s_nome_cliente VARCHAR(50) NOT NULL,
    s_cpf_cliente VARCHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);
CREATE schema aula;
DROP schema aula; 
ALTER TABLE cliente MODIFY COLUMN s_nome_cliente VARCHAR(50); 
ALTER TABLE cliente ADD i_tipo_cliente INT NOT NULL DEFAULT 1; 
ALTER TABLE cliente DROP COLUMN i_tipo_cliente;

aula 08
insert into tipocliente values (01 , "pessoa física");
insert into tipocliente values (02, "pessoa jurídica");
insert into tipocliente values (03, "cliente especial");

insert into cliente(i_cliente_cliente,s_nome_cliente,s_cpf_cliente,d_nasc_cliente,i_tipo_cliente) values(04,"Gordinho",00000000000,"2022-09-12",03);
insert into cliente values(01, "Rodrigo", "0000000000", "1998-02-13", 01);
insert into cliente values(02, "dinho", "00000000001", "2022-02-13", 02);
insert into cliente values(03, "gordinho", "00000000002", "2018-02-13", 03);
select * from tipocliente;
select * from cliente;

 aula 09 
 select * from cliente_aux;

insert into cliente_aux 
	(i_cliente_cliente,s_nome_cliente,s_cpf_cliente,d_nasc_cliente,i_tipo_cliente)
select 
	i_cliente_cliente,
	s_nome_cliente,
	s_cpf_cliente,
	d_nasc_cliente,
	i_tipo_cliente
from cliente;
*/

select * from cliente;
CREATE TABLE `cliente_aux` (
  `i_cliente_cliente` int NOT NULL AUTO_INCREMENT,
  `s_nome_cliente` varchar(50) DEFAULT NULL,
  `s_cpf_cliente` varchar(11) NOT NULL,
  `d_nasc_cliente` datetime DEFAULT NULL,
  `i_tipo_cliente` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`i_cliente_cliente`),
  KEY `fk_tipocliente` (`i_tipo_cliente`),
  CONSTRAINT `fk_tipocliente_aux` FOREIGN KEY (`i_tipo_cliente`) REFERENCES `tipocliente` (`i_tipocliente_tipocliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

select * from cliente_aux;
/*  aula 10
já que são todas as tabelas, e não algumas, se poderia omitir as colunas da primeira tabela 
e na segunda com o select * from que seleciona todas as colunas da tabela */
insert into cliente_aux 
	(i_cliente_cliente,s_nome_cliente,s_cpf_cliente,d_nasc_cliente,i_tipo_cliente)
select 
	i_cliente_cliente,
	s_nome_cliente,
	s_cpf_cliente,
	d_nasc_cliente,
	i_tipo_cliente
from cliente;

select * from cliente;
update cliente set s_nome_cliente = "Rodrigo Louzada", s_cpf_cliente = "12345678900"

 where i_cliente_cliente = 1;
 
 update cliente set i_tipo_cliente = 1 where i_cliente_cliente > 0;
 delete from cliente where i_cliente_cliente > 0;
 
 /* é o mesmo comando, mas simplificado e que usa todas as tabelas de cliente para serem inseridas */
 insert into cliente select * from cliente_aux;
 
 /* aula 11 */
 delete from cliente where i_cliente_cliente>0;
 insert into cliente select * from cliente_aux;
 
 insert into cliente values (05, "apagar", "00000000000", "1980-02-01", 03);
 delete from cliente where i_cliente_cliente = 5;
 
 /* aula 12 uso de operações e funcoes */
 select  i_cliente_cliente, upper(s_nome_cliente) ,i_tipo_cliente *2  from cliente;
 
 /* aula 13, alias- apelidos-labels */
  select  tbc.i_cliente_cliente as idCliente,
  upper(tbc.s_nome_cliente) as nomeClienteM ,
  tbc.i_tipo_cliente as tipoCliente  
  from cliente tbc;
  
   /* aula 14, DISTINCT */
   
   insert into venda values(1,1 , "2022-12-12", 123.5);
   insert into venda values (2, 2, "1980-10-10", 32.4);
   insert into venda values(3, 1, "1978-03-10", 45.5);
   select * from venda;

select distinct i_cliente_cliente from venda;

/*aula 15 */

select max(c.i_cliente_cliente)+1 as 
i_cliente_cliente from cliente c;

SELECT MAX(i_cliente_cliente) + 1 FROM cliente; 
/*o nome seria o resultado de max,
mas antes era uma coluna própria de 'c', agora vem da coluna direta de cliente
 */

insert into cliente values( 
(select max(c.i_cliente_cliente)+1 as i_cliente_cliente from cliente c),
"joao",
"12365678999",
 "1998-09-09",
 1);
 select * from cliente;
 
 /* aula 16 */
 
(select i_cliente_cliente, s_nome_cliente from cliente) c;
  
select * from 
 (select i_cliente_cliente, s_nome_cliente from cliente) c;
 
select
 c.i_cliente_cliente ,
 c.s_nome_cliente
 from 
 (select i_cliente_cliente, s_nome_cliente from cliente) c;
 
create view nomescli as 
 select
 i_cliente_cliente, s_nome_cliente 
 from cliente;

/* aula 17 */

select  i_cliente_cliente, s_cpf_cliente from cliente;

create view cpfcliente as 
select i_cliente_cliente, s_cpf_cliente from cliente;
select * from cpfcliente;

select i_cliente_cliente, s_nome_cliente,
 day(d_nasc_cliente) as "aniversário cliente"
from cliente
where month(d_nasc_cliente) = month(curdate());

select i_cliente_cliente, s_nome_cliente,
 day(d_nasc_cliente) as "aniversário cliente"
from cliente
where month(d_nasc_cliente) = 2;

select i_cliente_cliente, s_nome_cliente,
 day(d_nasc_cliente) as "aniversário cliente"
from cliente
where month(d_nasc_cliente) in(2,3,4);

create view anivesariantesMes as
select i_cliente_cliente, s_nome_cliente,
 day(d_nasc_cliente) as "aniversário cliente"
from cliente
where month(d_nasc_cliente) = month(curdate());

select * from anivesariantesmes;

/*aula 18 */
select * from cliente 
where 
s_cpf_cliente = "12345678999" OR
 s_cpf_cliente = "00000000001";
 
select * from cliente
where
 s_cpf_cliente in(2,3) and
 i_tipo_cliente != 1 and
 month(d_nasc_cliente) > 2;
 
 select * from cliente
 where i_tipo_cliente in(2,3) and
 (month(d_nasc_cliente) >=4 and month(d_nasc_cliente) <= 9);

 /*aula 19 */

select * from cliente;
select * from tipocliente;

select i_cliente_cliente,
	s_nome_cliente,
	s_cpf_cliente,
	d_nasc_cliente,
	i_tipo_cliente
from cliente
	inner join tipocliente on 
    i_tipo_cliente = i_tipocliente_tipocliente;
    
select i_cliente_cliente,
	c.s_nome_cliente,
	c.s_cpf_cliente,
	c.d_nasc_cliente,
	tc.s_dsctipocliente_tipocliente
from cliente c
	inner join tipocliente tc on 
    c.i_tipo_cliente = tc.i_tipocliente_tipocliente;

select 
	v.i_venda_venda,
    c.s_nome_cliente,
    c.s_cpf_cliente,
    v.d_data_venda,
    v.f_valor_venda,
    tc.s_dsctipocliente_tipocliente
 from venda v
	inner join cliente c on v.i_cliente_cliente = c.i_cliente_cliente
    inner join tipocliente tc on c.i_tipo_cliente = tc.i_tipocliente_tipocliente;
 