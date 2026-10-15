CREATE TABLE participacoes (
  id              VARCHAR(50) PRIMARY KEY,
  nome            VARCHAR(60) NOT NULL,
  data_part       DATE,
  hora_part       TIME,
  pontuacao_total INT,
  pontuacao_max   INT,
  aproveitamento  DECIMAL(5,1),
  fluxos_concluidos INT
  -- demais colunas do CSV, se quiser
);

SELECT nome, pontuacao_total
FROM participacoes
ORDER BY pontuacao_total DESC;

SELECT RANK() OVER (
         ORDER BY pontuacao_total DESC, aproveitamento DESC, tentativas_incorretas ASC
       ) AS posicao,
       nome, pontuacao_total, aproveitamento, fluxos_concluidos
FROM participacoes;