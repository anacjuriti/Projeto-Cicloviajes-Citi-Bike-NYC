tripduration
stoptime
start_station_id
start_station_name
start_station_latitude
start_station_longitude	
end_station_id
end_station_name
end_station_latitude
end_station_longitude	
bikeid
usertype
birth_year
gender

-----------------------------------------------------------------
SELECT * FROM `riscorelativo.projeto03.citi_bike_trips`


--A variável tripduration está em segundos, transformar para minutos.
--Comando DATE para simplificar a variável stopttime e facilitar a criação de gráficos.


--variável tripduration de segundos para minutos
CREATE OR REPLACE TABLE riscorelativo.projeto03.citi_bike_trips_minutes AS
SELECT 
    ROUND(tripduration / 60, 2) AS tripduration_minutes,
    DATE(stoptime) AS stop_date,
    start_station_id,
    start_station_name,
    start_station_latitude,
    start_station_longitude,
    end_station_id,
    end_station_name,
    end_station_latitude,
    end_station_longitude,
    bikeid,
    usertype,
    birth_year,
    gender
FROM riscorelativo.projeto03.citi_bike_trips;


--Número de viagens realizadas em média (53.19)
SELECT ROUND(COUNT(*) / COUNT(DISTINCT DATE(stoptime)), 2) AS media_viagens_realizadas
FROM riscorelativo.projeto03.citi_bike_trips;

--Máximo, mínimo, média e desvio padrão (opcional) da duração da viagem
--Total de viagens (amostra de 50000)
--max_duracao_minutos (54566.07)
--min_duracao_minutos (1.0)
--media_duracao_minutos (16.47)
--desvio_padrao_duracao_minutos (255.79)
SELECT 
    COUNT(*) AS total_viagens,
    ROUND(MAX(tripduration / 60), 2) AS max_duracao_minutos,
    MIN(tripduration / 60) AS min_duracao_minutos,
    ROUND(AVG(tripduration / 60), 2) AS media_duracao_minutos,
    ROUND(STDDEV(tripduration / 60), 2) AS desvio_padrao_duracao_minutos
FROM riscorelativo.projeto03.citi_bike_trips;

--Crescimento no número de viagens diárias ao longo do tempo
--940 registros
SELECT
    data,
    total_viagens,
    total_viagens - LAG(total_viagens, 1, 0) OVER (ORDER BY data) AS crescimento_diario
FROM (
    SELECT 
        DATE(stoptime) AS data,
        COUNT(*) AS total_viagens
    FROM riscorelativo.projeto03.citi_bike_trips
    GROUP BY DATE(stoptime)
) AS viagens_por_dia;

--Total de viagens dos usuários, por sexo, idade e/ou tipo de assinatura
-- total de  292 registros
SELECT
    gender,
    CASE
        WHEN birth_year IS NOT NULL THEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year
        ELSE NULL
    END AS idade,
    usertype,
    COUNT(*) AS total_viagens
FROM riscorelativo.projeto03.citi_bike_trips
GROUP BY gender, idade, usertype
ORDER BY gender, idade, usertype;

--
CREATE OR REPLACE TABLE riscorelativo.projeto03.total_viagens_usuarios AS
SELECT 
    CASE 
        WHEN gender = 'female' THEN 'mulheres'
        WHEN gender = 'male' THEN 'homens'
        ELSE gender
    END AS novo_genero,
    CASE
        WHEN birth_year IS NOT NULL THEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year
        ELSE NULL
    END AS idade,
    usertype,
    COUNT(*) AS total_viagens
FROM riscorelativo.projeto03.citi_bike_trips
GROUP BY novo_genero, idade, usertype
ORDER BY novo_genero, idade, usertype;

--
CREATE OR REPLACE TABLE riscorelativo.projeto03.total_viagens_usuarios AS
SELECT 
    CASE 
        WHEN gender = 'female' THEN 'mulheres'
        WHEN gender = 'male' THEN 'homens'
        ELSE gender
    END AS novo_genero,
    CASE
        WHEN birth_year IS NOT NULL THEN EXTRACT(YEAR FROM CURRENT_DATE()) - birth_year
        ELSE NULL
    END AS idade,
    CASE 
        WHEN usertype = 'Customer' THEN 'Cliente'
        WHEN usertype = 'Subscriber' THEN 'Assinante'
        ELSE usertype
    END AS novo_tipo_usuario,
    COUNT(*) AS total_viagens
FROM riscorelativo.projeto03.citi_bike_trips
WHERE gender != 'unknown'
GROUP BY novo_genero, idade, novo_tipo_usuario
ORDER BY novo_genero, idade, novo_tipo_usuario;

