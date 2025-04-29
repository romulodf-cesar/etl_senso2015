USE db_senso2015;
-- Adiciona uma coluna ID com auto-incremento à tabela
-- Move a coluna ID para a primeira posição

-- Remove a restrição de chave primária (se necessário)
-- Remove a coluna ID
ALTER TABLE dados 
DROP COLUMN id;
ALTER TABLE dados
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
SELECT * FROM dados;
SELECT COUNT(*) FROM dados;
SELECT * 
FROM dados 
ORDER BY id DESC 
LIMIT 5;

SELECT id, AnosEstudo FROM dados ORDER BY 
id DESC LIMIT 5;

-- Subquery
-- Seleciona os últimos cinco registros e os ordena em ordem crescente por ID
SELECT id,AnosEstudo 
FROM (
    SELECT id,AnosEstudo 
    FROM dados 
    ORDER BY id DESC 
    LIMIT 5
) AS subquery 
ORDER BY id ASC;
