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

SHOW VARIABLES LIKE 'event_scheduler';


/*
EVERY 1 MONTH: Define a recorrência mensal.
STARTS '2025-05-05 15:20:00': O evento começa no próximo dia 5 de maio 
de 2025 às 15:20. 
Ajuste a data para o próximo dia 5 desejado
(por exemplo, '2025-06-05' para junho).
ON COMPLETION PRESERVE: Mantém o evento no banco após a execução, 
para que continue funcionando nos meses seguintes.
DO CALL CalcularMediaIdade(): Chama a procedure.



*/

DELIMITER //

CREATE EVENT ExecutarCalcularMediaIdadeOk
ON SCHEDULE
    EVERY 1 MONTH
    STARTS '2025-05-05 15:11:00'
    ON COMPLETION PRESERVE
DO
    CALL CalcularMediaIdade();

DELIMITER ;
SELECT * FROM mysql.user WHERE Event_priv = 'Y';
SET GLOBAL event_scheduler = ON;
SHOW EVENTS;
SHOW CREATE EVENT ExecutarCalcularMediaIdadeOk;
SELECT VERSION();



/* vamos executar */
SELECT @@time_zone;
SET time_zone = '-03:00';
DELIMITER //

CREATE EVENT ExecutarCalcularMediaIdade
ON SCHEDULE
    EVERY 1 MONTH
    STARTS '2025-06-05 15:20:00'
    ON COMPLETION PRESERVE
DO
BEGIN
    IF DAY(CURRENT_DATE) = 5 THEN
        CALL CalcularMediaIdade();
    END IF;
END//

DELIMITER ;
SHOW EVENTS;
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
