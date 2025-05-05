USE db_senso2015;

DESCRIBE dados;
DROP PROCEDURE CalcularMediaIdade;
DELIMITER //
CREATE PROCEDURE CalcularMediaIdade()
BEGIN
    DECLARE media_idade DECIMAL(10,2);
    
    SELECT AVG(idade) INTO media_idade FROM dados;
    
    SELECT ROUND(media_idade,0) AS MediaIdade;
END //
DELIMITER ;

CALL CalcularMediaIdade();
SELECT renda FROM dados;



CALL CalcularMediaIdade();
DROP PROCEDURE CalcularMediaRenda;
DELIMITER //
CREATE PROCEDURE CalcularMediaRenda()
BEGIN
   DECLARE media_renda DECIMAL(10,2);
   DECLARE maximo DECIMAL(10,2);
   DECLARE minimo DECIMAL(10,2);
   SELECT AVG(renda) INTO media_renda FROM dados;
   SELECT MAX(renda) INTO maximo FROM dados;
   SELECT MIN(renda) INTO minimo FROM dados;
   SELECT media_renda AS RendaMedia,maximo AS MAX,minimo AS MIN;
END //
DELIMITER ;
CALL CalcularMediaRenda();
SELECT MAX(renda) FROM dados;
SELECT MIN(renda) FROM dados;
SELECT renda FROM dados WHERE renda >=100000 AND renda <= 200000 ORDER BY renda ASC;
SELECT renda FROM dados WHERE renda >=1 AND renda <= 50;
SELECT COUNT(*) FROM dados WHERE renda = 0.00;
SELECT COUNT(*) FROM dados WHERE renda = 200000;
SELECT id,renda FROM dados WHERE renda = 200000;
DELETE FROM dados WHERE ID = 28111;
DELETE FROM dados WHERE ID = 43694;
DELETE FROM dados WHERE ID = 56142;
SELECT renda FROM dados;
DESCRIBE dados;

ALTER TABLE dados
MODIFY COLUMN renda DECIMAL(10,2);
