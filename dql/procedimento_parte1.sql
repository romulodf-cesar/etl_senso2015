USE db_senso2015;
describe dados;
SELECT idade FROM dados;
#filtros
SELECT id,idade FROM dados WHERE idade>=18 LIMIT 5;
SELECT id,idade FROM dados WHERE idade<18 LIMIT 10;
SELECT COUNT(id) AS total_menores FROM dados WHERE idade<18;
SELECT COUNT(id) AS total_maiores FROM dados WHERE idade>=18;
SELECT COUNT(id) AS total_maiores FROM dados WHERE idade>=60;
DELIMITER //
CREATE PROCEDURE AloMundoSenai()
BEGIN
    SELECT 'Alô Mundo!' AS Mensagem;
END //
DELIMITER ;

CALL AloMundoSenai();



DELIMITER //

CREATE PROCEDURE MostrarIdade()
BEGIN
    DECLARE idade INT;
    SET idade = 18;
    SELECT idade AS 'Idade';
END //

DELIMITER ;

CALL MostrarIdade();

DELIMITER //
CREATE PROCEDURE VerificarMaiorIdade()
BEGIN
    DECLARE idade INT;
    SET idade = 18;
    IF idade >= 18 THEN
        SELECT 'maior que 18' AS 'Mensagem';
    ELSE
        SELECT 'menor que 18' AS 'Mensagem';
    END IF;
END //
DELIMITER ;

CALL VerificarMaiorIdade();


DELIMITER //
CREATE PROCEDURE VerificarMaiorIdade()
BEGIN
    DECLARE idade INT;
    SET idade = 18;
    IF idade >= 18 THEN
        SELECT 'maior que 18' AS 'Mensagem';
    ELSE
        SELECT 'menor que 18' AS 'Mensagem';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SomarNumeros(IN numero1 INT, IN numero2 INT)
BEGIN
    DECLARE soma INT;
    SET soma = numero1 + numero2;
    SELECT soma AS 'Resultado da Soma';
END //
DELIMITER ;

CALL SomarNumeros(10,10);



DELIMITER //
CREATE PROCEDURE SomarIdadeMinMaxIbge()
BEGIN
    DECLARE idade_min INT;
    DECLARE idade_max INT;
    DECLARE soma INT;    
    -- Obtém a idade mínima e máxima da tabela 'pessoas'
    SELECT MIN(idade) INTO idade_min FROM dados;
    SELECT MAX(idade) INTO idade_max FROM dados;    
    -- Calcula a soma
    SET soma = idade_min + idade_max;    
    -- Exibe o resultado
    SELECT soma AS 'Soma da Idade Mínima e Máxima';
END //
DELIMITER ;
CALL SomarIdadeMinMaxIbge();
