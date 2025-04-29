USE db_senso2015;

describe dados;
SELECT UF,Sexo,Cor FROM dados;

SELECT idade FROM dados;

-- idade mínima e idade máxima
SELECT MIN(idade) AS idade_minima, MAX(idade) AS idade_maxima FROM dados;

select * from dados;
SELECT AVG(Idade) FROM dados;

-- AVG
-- ROUND( )
-- Formatar...
SELECT AVG(Idade) FROM dados;
SELECT ROUND(AVG(Idade),0) FROM dados;



