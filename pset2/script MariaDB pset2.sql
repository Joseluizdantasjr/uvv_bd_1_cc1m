select distinct trab.numero_departamento_do_funcionario as departamento, avg(funcionario.salario) as media_salarial_departamento
from funcionario
inner join (select distinct cpf_funcionario,numero_departamento_do_funcionario from trabalha_em) as trab on funcionario.cpf = trab.cpf_funcionario
group by numero_departamento_do_funcionario;

select func.sexo, avg(func.salario) as media_salaral_do_sexo
from funcionario as func
group by sexo;


select depart.nome_departamento, concat(funcionario.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo, data_nascimento, (round (datediff(current_date, data_nascimento) / 365)) as idade, salario
from ((funcionario
inner join (select distinct cpf_funcionario,numero_departamento_do_funcionario  from trabalha_em) as trab on funcionario.cpf = trab.cpf_funcionario)
inner join departamento as depart on trab.numero_departamento_do_funcionario = depart.numero_departamento) 
group by nome_departamento, nome_completo;

select concat(funcionario.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo, data_nascimento, (round (datediff(current_date, data_nascimento) / 365)) as idade, salario, 
case when salario < 35000 then salario * 1.2
else salario * 1.15
end as salario_reajustado
from funcionario;

select distinct geren.primeiro_nome as nome_gerente, func.primeiro_nome as nome_funcionario
from funcionario as func
inner join trabalha_em as trab on (trab.cpf_funcionario = func.cpf)
inner join departamento as depart on (trab.numero_departamento_do_funcionario = depart.numero_departamento)
inner join funcionario as geren on (geren.cpf = depart.cpf_gerente)
where geren.primeiro_nome != func.primeiro_nome
order by depart.nome_departamento asc, func.salario desc;
