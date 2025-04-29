USE db_senso2015;
describe dados;
-- ETL e EDA
-- Primeiro Script
-- Mostrando os cinco primeiro registros da tabela dados
SELECT * FROM dados LIMIT 5;
describe dados;
-- Mostrando todos os dados da coluna anos de estudo
ALTER TABLE dados CHANGE `anos_estudo` AnosEstudo longtext;
describe dados;
-- Mostrando todos
SELECT AnosEstudo FROM dados;
-- Mostrando apenas únicos, elimina duplicatas
SELECT DISTINCT AnosEstudo FROM dados;
-- Ordenado
SELECT DISTINCT AnosEstudo
FROM dados
ORDER BY CAST(AnosEstudo AS UNSIGNED);