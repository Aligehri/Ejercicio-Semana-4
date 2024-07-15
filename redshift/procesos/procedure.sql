\c DESASTRES;

DROP PROCEDURE IF EXISTS pETL_Desastres;

CREATE OR REPLACE PROCEDURE pETL_Desastres () LANGUAGE plpgsql
AS $$
  BEGIN
  DROP TABLE
  END;
  BEGIN
    INSERT INTO DESASTRES_FINAL (Cuatrenio, Temp_AVG, Oxi_AVG, T_Tsunamis, T_OlasCalor, T_Terremotos, T_Erupciones, T_Incendios, M_Jovenes_AVG FLOAT, M_Adutos_AVG, M_Ancianos_AVG)
    SELECT
    CASE
      WHEN 
    END,
  END;
$$;
