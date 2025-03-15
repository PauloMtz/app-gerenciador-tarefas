select t.categoria as Categoria, count(*) as Qtde from tarefas t 
	group by t.categoria;

+---------------+------+
| Categoria     | Qtde |
+---------------+------+
| JARDINAGEM    |    4 |
| LIMPEZA       |    5 |
| MANUT_PREDIAL |   10 |
| RESERVAS      |    4 |
+---------------+------+

select count(*) as qtde, concluida from tarefas group by concluida;

+------+----------------------+
| qtde | concluida            |
+------+----------------------+
|   13 | 0x00                 |
|   10 | 0x01                 |
+------+----------------------+

select u.nome as Usuário, count(*) as Qtde from tarefas t 
	inner join usuarios u on t.usuario_id = u.id
	group by u.nome;

+------------------+------+
| Usuário          | Qtde |
+------------------+------+
| Alberto Teste    |    1 |
| Ana Beatriz      |    3 |
| Edmar Teste      |    2 |
| Fernanda Beatriz |    1 |
| Lorena Silva     |    2 |
| Márcio Silva     |    3 |
| Maria Carla      |    1 |
| Maria Rita       |    1 |
| Ribamar Teste    |    4 |
| Sebastião Teste  |    2 |
| Teobaldo Silva   |    1 |
| Thaíssa Teste    |    2 |
+------------------+------+

select count(*) as Qtde, t.data_criacao as Data from tarefas t 
	group by month(t.data_criacao);

+------+----------------------------+
| Qtde | Data                       |
+------+----------------------------+
|    2 | 2024-02-11 16:31:33.000000 |
|    1 | 2024-03-25 16:31:33.000000 |
|    3 | 2024-04-15 16:31:33.000000 |
|    2 | 2024-05-15 16:31:33.000000 |
|    1 | 2024-06-15 16:31:33.000000 |
|    1 | 2024-07-15 16:31:34.000000 |
|    2 | 2024-08-15 16:31:34.000000 |
|    2 | 2024-09-15 16:31:34.000000 |
|    4 | 2024-10-15 16:31:34.000000 |
|    1 | 2024-11-15 16:31:34.000000 |
|    2 | 2024-12-13 16:31:34.000000 |
+------+----------------------------+

select count(id) as Qtde, date_format(t.data_criacao, '%Y-%m') as Mes from tarefas t 
	group by Mes;

+------+---------+
| Qtde | Mes     |
+------+---------+
|    2 | 2024-02 |
|    1 | 2024-03 |
|    3 | 2024-04 |
|    2 | 2024-05 |
|    1 | 2024-06 |
|    1 | 2024-07 |
|    2 | 2024-08 |
|    2 | 2024-09 |
|    4 | 2024-10 |
|    1 | 2024-11 |
|    2 | 2024-12 |
+------+---------+
