-- CREATE DATABASE
CREATE DATABASE RankingCBAT;
USE RankingCBAT;


-- CREATE TABLES
CREATE TABLE modalidade (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_modalidade VARCHAR(50) UNIQUE NOT NULL,
    metrica_modalidade VARCHAR(20) NOT NULL CHECK(metrica_modalidade IN ('segundos', 'minutos', 'metros/segundo', 'metros'))
);

CREATE TABLE atleta (
    CPF_atleta VARCHAR(11) PRIMARY KEY,
    nome_atleta VARCHAR(50),
    sobrenome_atleta VARCHAR(50),
    idade_atleta DATE
);

CREATE TABLE campeonato (
    id_campeonato INT AUTO_INCREMENT PRIMARY KEY,
    nome_campeonato VARCHAR(50) UNIQUE NOT NULL,
    categoria_campeonato VARCHAR(20) NOT NULL CHECK(categoria_campeonato IN ('Regional', 'Estadual', 'Nacional', 'Panamericano', 'Mundial', 'Olímpico')), 
    data_inicio_campeonato DATE NOT NULL,
    data_termino_campeonato DATE NOT NULL,
    pais_campeonato CHAR(2) NOT NULL,
    estado_campeonato CHAR(2),
    cidade_campeonato VARCHAR(50) NOT NULL
);

CREATE TABLE classificacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    posicao_classificacao TINYINT(2) NOT NULL,
    resultado_classificacao VARCHAR(10) NOT NULL,
    id_modalidade INT NOT NULL,
    CPF_atleta VARCHAR(14) NOT NULL,
    id_campeonato INT NOT NULL,
    
    FOREIGN KEY (id_modalidade) REFERENCES modalidade(id_modalidade),
    FOREIGN KEY (CPF_atleta) REFERENCES atleta(CPF_atleta),
    FOREIGN KEY (id_campeonato) REFERENCES campeonato(id_campeonato)
);


-- INSERTS
INSERT INTO modalidade (nome_modalidade, metrica_modalidade) VALUES 
('Corrida 100m', 'segundos'),
('Corrida 200m', 'segundos'),
('Salto em distância', 'metros'),
('Lançamento de dardo', 'metros');

INSERT INTO atleta VALUES 
('00000000001', 'Lucas', 'Chaves', '2007-04-01'),
('00000000002', 'Mateus', 'Vieira', '2007-04-08'),
('00000000003', 'Ana', 'Moraes', '2006-01-01'),
('00000000004', 'Igor', 'Silva', '2006-01-01');

INSERT INTO campeonato (nome_campeonato, categoria_campeonato, data_inicio_campeonato, data_termino_campeonato, pais_campeonato, estado_campeonato, cidade_campeonato) VALUES
('Campeonato Jeremias da Silva', 'Regional', '2024-02-26', '2024-02-26', 'BR', 'MG', 'Uberlândia'), 
('Campeonato Mineiro Roberto Antônio', 'Estadual', '2024-03-20', '2024-03-20', 'BR', 'MG', 'Belo Horizonte'), 
('Copa do Brasil', 'Nacional', '2024-04-14', '2024-04-16', 'BR', 'PE', 'Recife'), 
('Campeonato PanAmericano de Atletismo', 'Panamericano', '2024-05-10', '2024-05-15', 'BR', 'RJ', 'Rio de Janeiro'), 
('Campeonato Mundial de Atletismo', 'Mundial', '2024-07-12', '2024-07-20', 'GR', NULL, 'Atenas'), 
('Olímpiadas', 'Olímpico', '2024-08-01', '2024-08-11', 'FR', NULL, 'Paris');

-- EMBARALHADO PELO CHATGPT
INSERT INTO classificacao (posicao_classificacao, resultado_classificacao, id_modalidade, CPF_atleta, id_campeonato) VALUES
(1, '10.00', 1, '00000000001', 1), 
(2, '10.20', 1, '00000000002', 1), 
(3, '10.30', 1, '00000000003', 1), 
(1, '20.50', 2, '00000000001', 2), 
(2, '21.00', 2, '00000000002', 2), 
(3, '21.50', 2, '00000000004', 2), 
(1, '8.50', 3, '00000000003', 3), 
(2, '8.20', 3, '00000000004', 3), 
(3, '7.90', 3, '00000000001', 3), 
(1, '70.00', 4, '00000000002', 4), 
(2, '68.00', 4, '00000000003', 4), 
(3, '65.50', 4, '00000000004', 4);


-- ALTER TABLES

ALTER TABLE campeonato ADD descricao TEXT;
ALTER TABLE campeonato DROP COLUMN descricao;
ALTER TABLE atleta MODIFY CPF_atleta VARCHAR(14);



