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


 /*aula 20  a partir daquele campo que tem os tipos semelhantes agrupados, ele faz uma opereação, 
 enquanto que o order by alinha todos os tipos sem os agregar ao terem valores semelhantes*/
 
 select 
 s_nome_cliente 
 from cliente 
 group by s_nome_cliente;
 
 select 
 count(i_cliente_cliente) as Qtde
 from cliente 
 group by i_tipo_cliente;

select i_tipo_cliente from cliente; 

select 
i_tipo_cliente
from cliente 
group by i_tipo_cliente;

select 
	i_tipo_cliente, 
	count(i_cliente_cliente) as Qtde
 from 
	cliente 
 group by i_tipo_cliente;
 
 select 
	tc.s_dsctipocliente_tipocliente, 
	count(c.i_cliente_cliente) as Qtde
 from 
	cliente c
    inner join 
    tipocliente tc on tc.i_tipocliente_tipocliente = c.i_tipo_cliente
 group by c.i_tipo_cliente;
 
 select * from venda;
 
 select d_data_venda from venda
 group by d_data_venda;
 
  select count(v.i_venda_venda) as "qtds de vendas do dia"
  from venda v
 group by d_data_venda;

 /*aula 21 */
 
select v.d_data_venda,
count(v.i_venda_venda)  as "qtds de vendas do dia"
from venda v
group by v.d_data_venda 
having d_data_venda > "2020-10-01";

select v.d_data_venda,
count(v.i_venda_venda)  as "qtds de vendas do dia"
from venda v
group by v.d_data_venda 
having count(v.i_venda_venda) >= 2;

/* aula 22 a partir daquele campo que tem os tipos semelhantes agrupados, ele faz uma opereação, 
enquanto que o order by alinha todos os tipos sem os agregar ao terem valores semelhantes*/

select * from cliente order by s_nome_cliente;

select *
 from cliente 
 order by 
 i_tipo_cliente, s_nome_cliente;
 
 select 
	*
 from 
	cliente 
 order by 
	5;
    
    select 
	*
 from 
	cliente 
 order by 
	2 DESC; 
    
    select *
    from 
    cliente 
    order by 5, 2 desc;
    
	select 
		*
    from 
		cliente 
    order by 5 desc, 2 asc;
    
    select 
		* 
    from 
		cliente 
    order by 
		right(s_cpf_cliente,3);


/* aula 23 */

insert into cliente values (15, 'Valkisneide','11223344556',null,1);
insert into cliente values (16,'Alcinclésio','65544332211',null,2);
insert into cliente values (17,'Nestisgerson','74125896300',null,3);
insert into cliente values (18,'Mordonório','36925814799',null,1);
insert into cliente values (19,'Mordonório','36925814799',null,2);
insert into cliente values (20,'Salomildo','98765432147',null,3);

update cliente
set i_cliente_cliente = 12
where i_cliente_cliente = 20;
select * from cliente;

select * from cliente
order by 1 desc;

select * from cliente
where d_nasc_cliente IS NULL;

select * from cliente 
where d_ IS NOT NULL;

/* aula 24 */

select * from cliente 
where d_nasc_cliente IS NOT NULL AND i_tipo_cliente = 1;

select * from cliente 
where d_nasc_cliente IS NULL OR i_tipo_cliente = 1;

select * from cliente 
where
	NOT i_tipo_cliente = 1;
    
select * from cliente 
where 
	NOT i_tipo_cliente = 1 AND NOT i_tipo_cliente = 2;
    
select * from cliente
where 
	(NOT i_tipo_cliente != 1 AND i_tipo_cliente != 2) 
    AND d_nasc_cliente IS NOT NULL;

 /* aula 25 */
    
    select * from cliente limit 5 ;
    
    select * from venda 
    order by f_valor_venda desc limit 3;
    
select * 
from venda v
inner join cliente c on c.i_cliente_cliente = v.i_cliente_cliente
order by f_valor_venda desc limit 3;

select c.s_nome_cliente, v.i_venda_venda, v.d_data_venda, v.f_valor_venda
from venda v
inner join cliente c on c.i_cliente_cliente = v.i_cliente_cliente
order by f_valor_venda desc limit 3;

/* aula 26 */

select max(f_valor_venda) from venda;
select min(f_valor_venda) from venda;

select *,max(f_valor_venda) from venda;

select * from venda;

select * from venda
where f_valor_venda = (select max(f_valor_venda) from venda);

select c.s_nome_cliente, v.i_venda_venda, v.d_data_venda, v.f_valor_venda 
from venda v
inner join cliente c on c.i_cliente_cliente = v.i_cliente_cliente
where v.f_valor_venda = (select min(f_valor_venda) from venda);

/* aula 27 */

select * from venda;

select sum(f_valor_venda) from venda;
select round(sum(f_valor_venda) , 2) from venda;

select round(sum(f_valor_venda) , 2) from venda
where d_data_venda > "2010-01-01" ;

select round(sum(f_valor_venda), 2) from venda;

select round(avg(f_valor_venda), 2) from venda;

select round(avg(f_valor_venda)) from venda
where 
	f_valor_venda > (select min(f_valor_venda) from venda)
AND
	f_valor_venda < (select max(f_valor_venda) from venda);
    
select round(sum(f_valor_venda)) from venda
where 
	f_valor_venda > (select min(f_valor_venda) from venda)
AND
	f_valor_venda < (select max(f_valor_venda) from venda);
    
select 
	count(f_valor_venda) as "qtd de vendas",
	round(sum(f_valor_venda)) as "valor médio das vendas"
from venda;

/* aula 28 */

select * from cliente
where s_nome_cliente = "dinho";

select * from cliente 
where s_nome_cliente like "d%o";

select * from cliente
where s_nome_cliente like "____o";

select * from cliente
where s_nome_cliente like "_______";

/*aula 29 */

select * from cliente
where 
right(s_cpf_cliente, 1) = 0 or right(s_cpf_cliente, 1) = 1;

select * from cliente
where right(s_cpf_cliente,1) in (0,1);

select * from cliente
where right(s_cpf_cliente,3) in (000,111);

select d_nasc_cliente from cliente 
where 
d_nasc_cliente > "1999-01-01" and d_nasc_cliente < "2022-01-01";

select * from cliente
where d_nasc_cliente 
in(
select d_nasc_cliente from cliente 
where 
d_nasc_cliente > "1999-01-01" and d_nasc_cliente < "2022-01-01");

/*aula 30 */

select * from tabela;

select * from cliente 
where i_tipo_cliente in (1,2,3);

select * from cliente 
where i_tipo_cliente between 1 and 3;

select * from cliente
where d_nasc_cliente between "1998-02-13" and "2019-12-12";

select * from venda 
where (d_data_venda between "1998-02-13" and "2019-12-12")
and i_cliente_cliente not in (2,3)
and f_valor_venda > 20
;

/* aula 31*/

select c.i_cliente_cliente, c.s_nome_cliente 
from cliente c
inner join venda v 
	on c.i_cliente_cliente = v.i_cliente_cliente
;

select * from venda;

select c.i_cliente_cliente, c.s_nome_cliente, v.i_venda_venda
from cliente c
left join venda v 
	on c.i_cliente_cliente = v.i_cliente_cliente ;
    
    select c.i_cliente_cliente, c.s_nome_cliente, v.i_venda_venda
from cliente c
right join venda v 
	on c.i_cliente_cliente = v.i_cliente_cliente ;


/* aula 32 */

select * from cliente;

select * 
from cliente c1, cliente c2 ;

select * from 
	cliente c1, cliente c2
where
	c1.i_tipo_cliente = c2.i_tipo_cliente
order by 
	c1.i_tipo_cliente ;
    
select * from 
	cliente c1, cliente c2
where
	c1.i_tipo_cliente = c2.i_tipo_cliente 
    and c1.s_nome_cliente = "Rodrigo"
order by 
	c1.i_tipo_cliente ;


/* aula 33 */

select i_cliente_cliente, s_cpf_cliente from cliente;
select i_cliente_cliente, s_cpf_cliente from cliente_aux;

select i_cliente_cliente, s_cpf_cliente from cliente
union
select i_cliente_cliente, s_cpf_cliente from cliente_aux;

select  "Cliente" as Tabela , i_cliente_cliente, s_cpf_cliente from cliente
union
select "Cliente aux" , i_cliente_cliente, s_cpf_cliente from cliente_aux;

select  "Cliente" as Tabela , i_cliente_cliente, s_cpf_cliente from cliente
union
select "Cliente aux" , i_cliente_cliente, s_cpf_cliente from cliente_aux
union 
select "Venda" , v.i_cliente_cliente , c.s_nome_cliente from venda v
inner join cliente c on v.i_cliente_cliente = c.i_cliente_cliente;

/* aula 34 */
select * from produtovenda;
select * from cliente ;
select * from venda where i_cliente_cliente = 10;

select * from cliente 
where exists 
(select * from venda where i_cliente_cliente = 10);

select * from cliente 
where exists 
(select * from venda where i_cliente_cliente = 1);


select * from cliente c
where exists
(select * from venda v where v.i_cliente_cliente = c.i_cliente_cliente);

/* aula 35 */

select * from cliente;

select 
i_cliente_cliente,
s_nome_cliente,
s_cpf_cliente,
case 
	when d_nasc_cliente is null then now() 
    when d_nasc_cliente > "2004-01-01" then "maior de idade"
	when d_nasc_cliente < "2004-01-01" then "menor de idade"
    else d_nasc_cliente
end "faixa etaria" ,
i_tipo_cliente
 from cliente;
 
 
 select 
i_cliente_cliente,
s_nome_cliente,
s_cpf_cliente,
case 
	when (datediff(now(), d_nasc_cliente)/365) > 18 then "maior de idade" 
    else  "menor de idade" 
    end "faixa etária" ,
i_tipo_cliente
 from cliente;
 
 select 
i_cliente_cliente,
s_nome_cliente,
s_cpf_cliente,
case 
	when (datediff(now(), d_nasc_cliente)/365) > 18 then "maior de idade" 
    else  "menor de idade" 
    end "faixa etária" ,
case 
	when i_tipo_cliente  > 3 then "cliente vip"
    else "cliente comum"
end "importancia cliente"
 from cliente;


 /*AULA 36 */
 select * from produtovenda;

select *,
	round((f_precoun_produtovenda * IFNULL(i_qtde_produtovenda,0)),2) as "total vendas"
from produtovenda;

update produtovenda set i_qtde_produtovenda = 
null where i_produtovenda_produtovenda = 1;


/*aula 37 */

DELIMITER $$
CREATE PROCEDURE textosparamentro()
BEGIN
	DECLARE x varchar(30);
    SET x = "java is better than js";
    SELECT x;

END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE texto(IN curso varchar(30))
BEGIN
	DECLARE x varchar(30);
    SET x = "java is better than js";
    SELECT x, curso;


END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE basico()
BEGIN

DECLARE X INT;
SET X = 10;
SELECT X;

END $$
DELIMITER ;

DELIMITER $$
CREATE procedure multi( IN num1 int)
BEGIN

DECLARE num2 int;
SET num2 = 4;
SELECT num2 *num1 as "multiplicar p/ 4" ;

END $$
DELIMITER ;


CALL basico();
CALL texto();
call textosparamentro();
CALL texto("precisa de um parametro");
call multi(4);


/* aula 38*/

DELIMITER $$
create procedure idade (IN idCliente int, OUT idade int)
BEGIN
	DECLARE dt datetime;
	set dt = (select d_nasc_cliente from cliente 
    where i_cliente_cliente = idCliente);

	set idade = year(now()) - year(dt) ;
END $$
DELIMITER ;

select *,i_cliente_cliente from cliente;
call idade(21, @idadeCliente);
select @idadeCliente;


DELIMITER $$
create procedure idadeFaixaEtaria (IN idCliente int, OUT idade int, OUT res varchar(20))
BEGIN
	DECLARE dt datetime;
	set dt = (select d_nasc_cliente from cliente 
    where i_cliente_cliente = idCliente);

	set idade = year(now()) - year(dt) ;
    
    IF(idade >= 18) THEN
		set res = "maior";
	ELSE 
		set res = "menor";
    END IF ;
END $$
DELIMITER ;

select *,i_cliente_cliente from cliente;
call idadeFaixaEtaria(21, @idadeCliente, @resultado);
select @idadeCliente, @resultado;


/* aula 39*/ 

DELIMITER $$
CREATE PROCEDURE loop1 (OUT soma INT)
BEGIN

DECLARE x int DEFAULT 0;

WHILE (x < 10)DO
	set x = x + 1;
    
END WHILE;

SET soma = x;

END $$
DELIMITER ;

call loop1(@ret);
select @ret;


DELIMITER $$
CREATE PROCEDURE loop2 (IN max INT,OUT soma INT)
BEGIN

DECLARE x int DEFAULT 0;

WHILE (x < max)DO
	set x = x + 1;
END WHILE;

SET soma = x;

END $$
DELIMITER ;

call loop2(10,@ret);
select @ret;


DELIMITER $$
CREATE PROCEDURE loop3 (IN max INT, OUT soma INT)
BEGIN
DECLARE x int DEFAULT 0;

meuloop: LOOP
	IF(x >= max)THEN
		LEAVE meuloop;
	END IF;
    
    IF(x < max)THEN
		SET x = x + 1;
    END IF;
END LOOP;

SET soma = x;
    
END $$
DELIMITER ;

call loop3(100,@res);
select @res;


/* aula 40  */

DELIMITER $$
CREATE PROCEDURE cursoR10(OUT soma float(10,2))
begin
DECLARE vv float (10,2) default 0;
declare fimloop int default 0;

declare meucursor CURSOR FOR SELECT f_valor_venda from venda;
declare continue handler for not found set fimloop = 1;

set soma= 0;

open meucursor;
while(fimloop != 1)do
	fetch meucursor into vv;
	set soma = soma + vv;
end while;

end $$
DELIMITER ;

call cursoR10(@dinho);
select @dinho ;

/*aula 42 sql injection
seria uma forma do usuario entrar com uma query/comando pelo elemento
e essa query seria rodada pelo sistema, sendo perigoso o usuario comum ter acesso a query e modificaçoes de tabela
no caso, em formulario js

no caso, se obtem os dados do formulario, os coloca em uma variavel em que sera utilizado na query do mysql
, se o usuario enviar um dado que seja true, ele tem acesso a ambos!
tanto um valor fixo ou "" or ""="" or "123" = "123"
ou enviar após a senha ou usuario ";" e depois o uso dd drop table .... ou delete .....
- para evitar isso, não se usa os dados diretamente na query, mas parametros, a depender da linguagem
classe, orientação a objeto(depende da linguagem) e a função com o parametro, ou no mysql  set @exemplo = "rodrigo"
serve para insert, update,

 */


 select * from cliente;


select * from cliente where s_usr_cliente = '' or '''' = '''' 
and s_senha_cliente = '' or ''''='''';

select * from cliente where s_usr_cliente = '' 
and s_senha_cliente = '';


/*select * from cliente where s_usr_cliente ="aaa"; drop table cliente; */

SET @nome = "rodrigo";
select * from cliente where s_nome_cliente = @nome;
SET @nome =" "" or """" = """" "; /* doesnt work */

/*aula 42 */
select s_nome_cliente from cliente where i_cliente_cliente = 1;
select LOCATE("D", s_nome_cliente) from cliente;
select LOCATE ("R", s_nome_cliente) as "cliente R", s_nome_cliente 
 from cliente;
 
 select substr(s_nome_cliente,3,3), s_nome_cliente from cliente;
 select substr(s_nome_cliente,3,2), s_nome_cliente from cliente
 where i_cliente_cliente = 1;
 
 select CONCAT("Nome: ", s_nome_cliente) from cliente
 where i_cliente_cliente = 1;
 
 select concat("primeiro nome: ", s_nome_cliente, " sobrenome?" ) from cliente
 where i_cliente_cliente = 1;
 
select lower(s_nome_cliente) from cliente;
select upper(s_nome_cliente) from cliente;

 
 select *, FORMAT(f_valor_venda,5) as "várias casas" from venda;
 
 select char_length(s_nome_cliente) as "tamanho de nome" from cliente;