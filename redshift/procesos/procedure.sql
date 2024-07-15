\c desastres_db;

DROP PROCEDURE IF EXISTS pETL_Desastres;

CREATE OR REPLACE PROCEDURE pETL_Desastres () LANGUAGE plpgsql
AS $$
  BEGIN
  CREATE TABLE auxiliar AS
  SELECT 
  año, Temperatura, Oxigeno,
  Tsunamis, Olas_Calor, Terremotos, Erupciones,
  R_Menor15, R_15_a_30, R_30_a_45, R_45_a_60, R_M_a_60
  FROM clima
  JOIN desastres ON desastres.año = clima.año
  JOIN muertes ON muertes.año = clima.año
  
  CREATE TABLE auxiliar1 AS
  SELECT 
  CASE
    WHEN 2023<= año <= 2026 THEN '2023 - 2026'
    ELSE '2027 - 2030'
  END AS Cuatrienio,
  AVG(Temperatura) AS Temp_AVG,
  AVG(Oxigeno) AS Oxi_AVG,
  SUM(Tsunamis) AS T_Tsunamis,
  SUM(Olas_Calor) AS T_OlasCalor,
  SUM(Terremotos) AS T_Terremotos,
  SUM(Erupciones) AS T_Erupciones,
  SUM(R_Menor15) + SUM(R_15_a_30) AS Jovenes,
  SUM(R_30_a_45) + SUM(R_45_a_60) AS Adultos, 
  SUM(R_M_a_60) AS Ancianos
  FROM auxiliar
  GROUP BY  Cuatrienio;
  
  SELECT *
    FROM auxiliar1;
  END;
$$;
