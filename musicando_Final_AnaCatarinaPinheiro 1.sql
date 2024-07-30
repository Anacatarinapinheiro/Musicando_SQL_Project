-- Para desactivar
SET SQL_SAFE_UPDATES = 0;

DROP DATABASE IF EXISTS Musicando;
CREATE DATABASE Musicando;
USE Musicando;

DROP TABLE IF EXISTS pais;
CREATE TABLE pais (
    cod_pais INT AUTO_INCREMENT PRIMARY KEY,
    nome_pais VARCHAR(50)
    ); 

-- Importar diretamente do ficheiro csv  
-- LOAD DATA INFILE 'C:/Tabela_Paises.csv'
-- INTO TABLE pais
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO pais VALUES
(0, 'Uruguai'),
(0, 'Ucrânia'),
(0, 'Emirados Árabes Unidos'),
(0, 'Árabia Saudita'),
(0, 'Qatar'),
(0, 'Kuwait'),
(0, 'Omã'),
(0, 'Irão'),
(0, 'Iraque'),
(0, 'Afeganistão');

DROP TABLE IF EXISTS genero;
CREATE TABLE genero (
    cod_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome_genero VARCHAR(50)
    ); 
    
-- Importar diretamente do ficheiro csv  
-- LOAD DATA INFILE 'C:/Tabela_Genero.csv'
-- INTO TABLE genero
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO genero VALUES
(0, 'Funk'),
(0, 'Gospel'),
(0, 'EDM'),
(0, 'Ambient'),
(0, 'Disco'),
(0, 'Techno'),
(0, 'House'),
(0, 'Grunge'),
(0, 'Dubstep'),
(0, 'World');

DROP TABLE IF EXISTS utilizadores;
CREATE TABLE utilizadores (
    cod_utilizador INT AUTO_INCREMENT PRIMARY KEY,
    nome_utilizador VARCHAR(50),
    email VARCHAR(50),
    tipo_subscricao VARCHAR(50),
    cod_pais int,
	FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais));

-- Importar diretamente do ficheiro csv  
-- LOAD DATA INFILE 'C:/Tabela_Utilizadores.csv'
-- INTO TABLE utilizadores
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO utilizadores VALUES
(0,'MatildeRT','matildeRT@gmail.com','Standard',2),
(0, 'SkaterBoy8', 'skaterboy8@gmail.com', 'Standard', '3'),
(0, 'LuisaMusica100', 'LuisaMusica100@hotmail.com', 'Premium', '4'),
(0, 'MiguelFGR', 'MiguelFGR@hotmail.com', 'Standard', '5'),
(0, 'Beemusic', 'beemusic123@gmail.com', 'Premium', '1'),
(0, 'calebPT', 'calebpt@hotmail.com', 'Standard', '6'),
(0, 'anasoundw', 'anasoundw@gmail.com', 'Premium', '7'),
(0, 'Jackson2024', 'jackson2024@hotmail.com', 'Premium', '10'),
(0, 'HarperMain', 'harpersoul@gmail.com', 'Standard', '9'),
(0, 'antoniobanderas', 'antoniozorro@hotmail.com', 'Premium', '8');


DROP TABLE IF EXISTS artista;
CREATE TABLE artista (
    cod_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(50),
    num_seguidores int,
    cod_genero int,
    cod_pais int,
    FOREIGN KEY (cod_genero) REFERENCES genero(cod_genero),
    FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais));
    
-- Importar diretamente do ficheiro csv  
-- LOAD DATA INFILE 'C:/Tabela_Artistas.csv'
-- INTO TABLE artista
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
insert into artista values
(0, 'Daniel Fernando', 50401874, 8, 3),
(0, 'Amália Rodrigues', 74211847, 4, 2),
(0, 'Anjos', 64418894, 1, 5),
(0, 'Quim Barreiros', 41685313, 2, 6),
(0, 'DZRT', 99888274, 10, 1),
(0, 'Ágata', 98835892, 9, 8),
(0, 'Xutos&Pontapés', 14803376, 3, 10),
(0, 'Salvador Sobral', 19074950, 7, 7),
(0, 'Toranja', 51048776, 5, 4),
(0, 'Doce', 58368137, 6, 9);


DROP TABLE IF EXISTS evento;
CREATE TABLE evento (
    cod_evento INT AUTO_INCREMENT PRIMARY KEY,
    data_evento date,
    cidade varchar(50),
    cod_artista int,
    cod_pais int,
    FOREIGN KEY (cod_artista) REFERENCES artista(cod_artista), 
    FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais));  
    
-- Importar diretamente do ficheiro csv   
-- LOAD DATA INFILE "C:/Tabela_Eventos.csv"
-- INTO TABLE evento
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';
    
-- 10 novos valores que podem ser inseridos:
INSERT INTO evento VALUES
(0, '2024-04-08', 'New York City', 1,10),
(0, '2024-06-18', 'Florida', 2, 9),
(0, '2024-08-16', 'Inglewood', 3, 8),
(0, '2024-02-08', 'Nashville', 4, 7),
(0, '2024-03-06', 'New Orleans', 5, 6),
(0, '2024-05-02', 'Seattle', 6, 5),
(0, '2024-05-18', 'Tokyo', 7, 4),
(0, '2024-06-03', 'Orlando', 8, 3),
(0, '2024-03-19', 'Oklahoma City', 9, 2),
(0, '2024-10-31', 'Melbourne', 10, 1),
(0, '2024-02-07', 'Las Vegas', 1, 10);

DROP TABLE IF EXISTS album;
CREATE TABLE album (
    cod_album INT AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(50),
    ano_lancamento date,
    cod_artista int,
    FOREIGN KEY (cod_artista) REFERENCES artista(cod_artista));
    
-- Importar o ficheiro csv:
-- LOAD DATA INFILE "C:/Tabela_Album.csv"
-- INTO TABLE album
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO album VALUES
(0, "Mundo", '2001-10-18', 1),
(0, "DAlma", '2007-11-11', 2),
(0, "Amália Hoje", '2009-01-01', 3),
(0, "Aurora", '2004-04-19', 4),
(0, "Os Dias são a Noite", '2016-10-10', 5),
(0, "Rosa Negra", '1992-02-12', 6),
(0, "Sangue Oculto", '1997-02-14', 7),
(0, "Fado Promessa", '2008-12-01', 8),
(0, "Lisboa", '1996-06-25', 9),
(0, "Desfado", '2012-03-22', 10);

    
DROP TABLE IF EXISTS musica;
CREATE TABLE musica (
    cod_musica INT AUTO_INCREMENT PRIMARY KEY,
    nome_musica VARCHAR(50),
    duracao_musica int,
    cod_artista int,
    cod_album int,
    cod_genero int,
    FOREIGN KEY (cod_artista) REFERENCES artista(cod_artista),
    FOREIGN KEY (cod_album) REFERENCES album(cod_album),
    FOREIGN KEY (cod_genero) REFERENCES genero(cod_genero));
    
-- Importar diretamente do ficheiro csv:
-- LOAD DATA INFILE 'C:/Tabela_Musicas.csv'
-- INTO TABLE musica
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO musica VALUES
(0, "Ai Se Ele Cai", 260, 1, 10, 1),
(0, "Meu Amor de Longe", 232, 2, 9, 2),
(0, "Desfado", 295, 3, 8, 3),
(0, "A Vida Toda", 187, 4, 7, 4),
(0, "Chuva", 241, 5, 6, 5),
(0, "Holy Grail", 338, 6, 5, 6),
(0, "E Depois do Adeus", 253,7, 4, 7),
(0, "O Homem do Leme", 83, 8, 3, 8),
(0, "Primavera", 167, 9, 2, 9),
(0, "Talking to the Moon", 217, 10, 1,10),
(0, "Amor a Portugal", 216, 1, 10, 1);


DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist (
    cod_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nome_playlist VARCHAR(50),
    cod_utilizador int,
	FOREIGN KEY (cod_utilizador) REFERENCES utilizadores(cod_utilizador));
     
-- Importar diretamente do ficheiro csv:
-- LOAD DATA INFILE "C:/Tabela_Playlist.csv"
-- INTO TABLE playlist
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO playlist VALUES
(0, 'Saudade Sonora', 1),
(0, 'Noite Lisboeta', 2),
(0, 'Cores de Portugal', 3),
(0, 'Melodias Lusitanas', 10),
(0, 'Ondas do Fado', 9),
(0, 'Sabor a Mar', 8),
(0, 'Caminhos da Música Portuguesa', 4),
(0, 'Alma Lusa', 5),
(0, 'Jazz Jokes', 6),
(0, 'Vozes de Portugal', 7),
(0, 'Ritmos Tropicais', 1);


DROP TABLE IF EXISTS playlistMusica;
CREATE TABLE playlistMusica (
    cod_musica_na_playlist INT AUTO_INCREMENT PRIMARY KEY,
    cod_playlist int,
    cod_musica int,
    FOREIGN KEY (cod_playlist) REFERENCES playlist (cod_playlist),
    FOREIGN KEY (cod_musica) REFERENCES musica (cod_musica));
    
-- Importar diretamente do ficheiro csv:
-- LOAD DATA INFILE "C:/Tabela_MusicaNaPlaylist.csv"
-- INTO TABLE playlistMusica
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO playlistMusica VALUES
(0, 6, 5),
(0, 3, 8),
(0, 4, 4),
(0, 2, 1),
(0, 1, 9),
(0, 7, 7),
(0, 9, 2),
(0, 10, 6),
(0, 5, 3),
(0, 8, 10);

    
DROP TABLE IF EXISTS HistoricoReproducao;
CREATE TABLE HistoricoReproducao (
    cod_historico INT AUTO_INCREMENT PRIMARY KEY,
    data_reproducao date,
    duracao_stream int,
    cod_utilizador int,
    cod_musica int,
    cod_pais int,
    FOREIGN KEY (cod_utilizador) REFERENCES utilizadores(cod_utilizador),
    FOREIGN KEY (cod_musica) REFERENCES musica(cod_musica),
    FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais));  
    
-- Importar diretamente do ficheiro csv:
-- LOAD DATA INFILE "C:/Tabela_Historico.csv"
-- INTO TABLE HistoricoReproducao
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO HistoricoReproducao VALUES
(0, '2024-11-09', 508, 1, 10, 8),
(0, '2024-12-22', 998, 2, 9, 10),
(0, '2025-02-14', 1837, 3, 8, 7),
(0, '2025-07-20', 1142, 4, 7, 1),
(0, '2025-07-02', 1146, 5, 6, 4),
(0, '2025-10-08', 168, 6, 5, 2),
(0, '2024-02-20', 122, 7, 4, 5),
(0, '2025-02-27', 207, 8, 3, 9),
(0, '2024-07-15', 967, 9, 2, 6),
(0, '2024-08-24', 327, 10, 1, 3);


DROP TABLE IF EXISTS seguidores;
CREATE TABLE seguidores (
    cod_seguidor INT AUTO_INCREMENT PRIMARY KEY,
    data_seguiu date,
    cod_utilizador int,
    cod_artista int,
    FOREIGN KEY (cod_utilizador) REFERENCES utilizadores(cod_utilizador),
    FOREIGN KEY (cod_artista) REFERENCES artista(cod_artista));  

-- Importar diretamente do ficheiro csv:
-- LOAD DATA INFILE "C:/ Tabela_Seguidores.csv"
-- INTO TABLE seguidores
-- FIELDS TERMINATED BY ';'
-- LINES TERMINATED BY '\n';

-- 10 novos valores que podem ser inseridos:
INSERT INTO seguidores VALUES
(0, '2024-11-09', 10, 8),
(0, '2024-12-22', 9, 10),
(0, '2025-02-14', 8, 7),
(0, '2025-07-20', 4, 7),
(0, '2025-07-02', 6, 4),
(0, '2025-10-08', 5, 2),
(0, '2024-02-20', 7, 5),
(0, '2025-02-27', 8, 3),
(0, '2024-07-15', 9, 6),
(0, '2024-08-24', 10, 3);

-- Para voltar a activar:
SET SQL_SAFE_UPDATES = 1;


-- CUNSULTAS PARA O PROJETO

-- 1) Total De Horas de Streaming
SELECT 
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Total De Horas de Streaming"
FROM historicoreproducao;

-- 2) Top 5 utilizadores que mais fazem stream
SELECT utilizadores.nome_utilizador as "Nome de Utilizador",
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Horas por utilizador" FROM historicoreproducao
inner join utilizadores on historicoreproducao.cod_utilizador = utilizadores.cod_utilizador
GROUP BY historicoreproducao.cod_utilizador
ORDER BY SUM(duracao_stream) DESC
LIMIT 5;

-- 3) Que tipo de utilizador ouve mais Free ou Premium
SELECT utilizadores.tipo_subscricao as "Tipo de Subscrição",
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Horas por tipo de utilizador" FROM historicoreproducao
inner join utilizadores on historicoreproducao.cod_utilizador = utilizadores.cod_utilizador
GROUP BY utilizadores.tipo_subscricao ORDER BY SUM(duracao_stream) DESC;
    
-- 4) Quais os gêneros mais ouvidos    
SELECT genero.nome_genero as "Gênero",
    CONCAT(
        (SUM(historicoreproducao.duracao_stream) DIV 3600), ':',
        LPAD((SUM(historicoreproducao.duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(historicoreproducao.duracao_stream) % 60, 2, '0')
    ) AS "Total de streaming por gênero"
FROM historicoreproducao
INNER JOIN musica ON historicoreproducao.cod_musica = musica.cod_musica
INNER JOIN artista ON musica.cod_artista = artista.cod_artista
INNER JOIN genero ON artista.cod_genero = genero.cod_genero
GROUP BY genero.cod_genero
ORDER BY SUM(historicoreproducao.duracao_stream) DESC;

-- 5) Em Portugal, em média, quanto tempo os utilizadores ouvem música?
SELECT pais.nome_pais as "Pais",
    CONCAT(
        (SUM(duracao_stream) / COUNT(duracao_stream)) DIV 3600, ':',
        LPAD(((SUM(duracao_stream) / COUNT(duracao_stream)) DIV 60) % 60, 2, '0'), ':',
        LPAD((SUM(duracao_stream) / COUNT(duracao_stream)) % 60, 2, '0')
    ) AS "Média de stream em Portugal" FROM historicoreproducao
INNER JOIN pais ON historicoreproducao.cod_pais = pais.cod_pais
WHERE pais.nome_pais = "Portugal";

-- 6) Quais os artistas mais ouvidos
SELECT artista.nome_artista as "Artista",
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Artistas mais ouvidos" FROM historicoreproducao
INNER JOIN musica ON historicoreproducao.cod_musica = musica.cod_musica
inner join artista on musica.cod_artista = artista.cod_artista
GROUP BY artista.cod_artista
ORDER BY SUM(duracao_stream) DESC
LIMIT 5;

-- 7) Quais os artistas que lançaram album entre 2010 e 2015
select 	artista.nome_artista as "Artista", album.nome_album as "Album", album.ano_lancamento from album 
inner join artista on album.cod_artista = artista.cod_artista 
where year(ano_lancamento) between 2010 and 2015 order by ano_lancamento;

-- 8) Qual o artista com mais seguidores
SELECT MAX(num_seguidores) AS "Nº Seguidores", nome_artista AS "Artista" FROM artista  GROUP BY nome_artista 
ORDER BY MAX(num_seguidores) DESC limit 5 ;

-- 9) Qual os artistas, onde e quando que têm eventos entre Junho e Agosto
SELECT artista.nome_artista as "Artista", evento.data_evento as "Data", pais.nome_pais as "Pais", evento.cidade as "Cidade" FROM evento
inner join artista on evento.cod_artista = artista.cod_artista
inner join pais on evento.cod_pais = pais.cod_pais
where month(data_evento) between 06 and 08 order by data_evento;

-- 10) Quais as música mais ouvida em Portugal em 2024
SELECT artista.nome_artista as "Artista", musica.nome_musica as "Música", pais.nome_pais as "Pais",
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Tempo Ouvido" FROM historicoreproducao
INNER JOIN musica ON historicoreproducao.cod_musica = musica.cod_musica
inner join artista on musica.cod_artista = artista.cod_artista
inner join pais on historicoreproducao.cod_pais = pais.cod_pais
WHERE pais.nome_pais = "Portugal" and year(historicoreproducao.data_reproducao)=2024
GROUP BY artista.cod_artista
ORDER BY SUM(duracao_stream) DESC
LIMIT 5;

-- 11) Qual o album da musica mais ouvida em Janeiro de 2025 na Alemanha
SELECT album.nome_album as "Album", musica.nome_musica as "Música", pais.nome_pais as "Pais",
    CONCAT(
        (SUM(duracao_stream) DIV 3600), ':',
        LPAD((SUM(duracao_stream) DIV 60) % 60, 2, '0'), ':',
        LPAD(SUM(duracao_stream) % 60, 2, '0')
    ) AS "Tempo ouvido" FROM historicoreproducao
INNER JOIN musica ON historicoreproducao.cod_musica = musica.cod_musica
inner join artista on musica.cod_artista = artista.cod_artista
Inner join album on musica.cod_album = album.cod_album
inner join pais on historicoreproducao.cod_pais = pais.cod_pais
WHERE pais.nome_pais = "Alemanha" and year(historicoreproducao.data_reproducao)=2025 and month(historicoreproducao.data_reproducao)=01
GROUP BY artista.cod_artista
ORDER BY SUM(duracao_stream) DESC
LIMIT 1;

-- 12) qual a playlist com mais músicas
SELECT playlist.nome_playlist AS "Playlist", COUNT(playlistmusica.cod_musica) AS "Número de Músicas" FROM playlist
INNER JOIN playlistmusica ON playlist.cod_playlist = playlistmusica.cod_playlist
GROUP BY playlist.cod_playlist
ORDER BY COUNT(playlistmusica.cod_musica) DESC
LIMIT 1;

-- 13)  Quais os artistas com letra a começar por letra T
SELECT nome_artista as "Artista" FROM artista WHERE nome_artista LIKE 'T%';

-- 14) Qual a média de albums por artista 
SELECT round(AVG(numero_de_albuns)) AS media_de_albuns_por_artista
FROM (
    SELECT artista.cod_artista, COUNT(album.cod_album) AS numero_de_albuns
    FROM artista
    INNER JOIN album ON artista.cod_artista = album.cod_artista
    GROUP BY artista.cod_artista
) AS subquery;

-- 15) Qual o artista que tem mais albuns
SELECT artista.nome_artista AS "Artista", COUNT(album.cod_album) AS "Número de Álbuns"
FROM artista
INNER JOIN album ON artista.cod_artista = album.cod_artista
GROUP BY artista.cod_artista
ORDER BY COUNT(album.cod_album) DESC
LIMIT 1;

-- 16) Qual o artista com menos albuns?
SELECT artista.nome_artista AS "Artista", COUNT(album.cod_album) AS "Número de Álbuns"
FROM artista
LEFT JOIN album ON artista.cod_artista = album.cod_artista
GROUP BY artista.cod_artista
ORDER BY COUNT(album.cod_album) ASC
LIMIT 1;

-- 17) Todas as músicas e respetivos albúns de um artista
SELECT artista.nome_artista as "Artista", musica.nome_musica AS "Música", album.nome_album AS "Álbum"
FROM musica
JOIN album ON musica.cod_album = album.cod_album
JOIN artista ON album.cod_artista = artista.cod_artista
WHERE artista.nome_artista LIKE 'Taylor Swift';

-- 18) Mostra todos os seguidores de um artista
SELECT utilizadores.nome_utilizador AS "Nome do Utilizador", seguidores.data_seguiu as "Quando Seguiu"
FROM seguidores
JOIN utilizadores ON seguidores.cod_utilizador = utilizadores.cod_utilizador
join artista on seguidores.cod_artista = artista.cod_artista
WHERE artista.nome_artista = 'Adele';

-- 19) Se quiser apagar um utilizador
DELETE FROM utilizadores WHERE cod_utilizador = 91;

