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

select distinct concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo_funcionario, depart.nome_departamento , depen.nome_dependente, (round (datediff(current_date, depen.data_nascimento) / 365)) as idade_dependente,
case
when depen.sexo = 'M' then 'Masculino'
else 'Feminino'
end as sexo_dependente
from funcionario as func
inner join trabalha_em as trab on trab.cpf_funcionario = func.cpf 
inner join departamento as depart on depart.numero_departamento = trab.numero_departamento_do_funcionario 
inner join dependente as depen on depen.cpf_funcionario = func.cpf ;

select distinct concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo_funcionario, depart.nome_departamento, func.salario
from funcionario as func
inner join trabalha_em as trab on trab.cpf_funcionario = func.cpf
inner join departamento as depart on depart.numero_departamento = trab.numero_departamento_do_funcionario 
left join dependente as depen on depen.cpf_funcionario = func.cpf
where depen.nome_dependente  is null;

select depart.nome_departamento, proj.nome_projeto, concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo_funcionario, trab.horas
from funcionario as func
inner join trabalha_em as trab on trab.cpf_funcionario = func.cpf 
inner join projeto as proj on proj.numero_projeto = trab.numero_projeto 
inner join departamento as depart on depart.numero_departamento = proj.numero_departamento 
order by depart.nome_departamento, proj.nome_projeto;

select depart.nome_departamento, proj.nome_projeto,  sum(trab.horas)
from projeto as proj
inner join trabalha_em as trab on trab.numero_projeto = proj.numero_projeto 
inner join departamento as depart on depart.numero_departamento = proj.numero_departamento
where trab.numero_projeto = proj.numero_projeto
group by trab.numero_projeto ;

select distinct trab.numero_departamento_do_funcionario as departamento, avg(funcionario.salario) as media_salarial_departamento
from funcionario
inner join (select distinct cpf_funcionario,numero_departamento_do_funcionario from trabalha_em) as trab on funcionario.cpf = trab.cpf_funcionario
group by numero_departamento_do_funcionario;

select concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo, proj.nome_projeto, trab.horas * 50 as valor_recebido
from funcionario as func
inner join trabalha_em as trab on trab.cpf_funcionario = func.cpf 
inner join projeto as proj on proj.numero_projeto = trab.numero_projeto;

select depart.nome_departamento, proj.nome_projeto, concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome_completo_funcionario
from funcionario as func
inner join trabalha_em as trab on trab.cpf_funcionario = func.cpf 
inner join projeto as proj on proj.numero_projeto = trab.numero_projeto 
inner join departamento as depart on depart.numero_departamento = proj.numero_departamento 
where trab.horas is null;

select concat(func.primeiro_nome,' ', nome_meio,' ', ultimo_nome) as nome, func.sexo as sexo, (round (datediff(current_date, func.data_nascimento) / 365)) as idade
from funcionario as func
union
select depen.nome_dependente as nome, depen.sexo as sexo ,(round (datediff(current_date, depen.data_nascimento ) / 365)) as idade
from dependente as depen order by idade desc;
