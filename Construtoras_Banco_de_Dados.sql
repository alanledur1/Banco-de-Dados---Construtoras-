
------- Criação das tabelas CONSTRUTORA ALFA ---------------------------------------------
CREATE TABLE Categorias
(
    cod_categoria   NUMERIC(10),
    descricao       VARCHAR(100),
    CONSTRAINT PK_CATEGORIA PRIMARY KEY (cod_categoria)
);

CREATE TABLE Equipamentos
(
    cod_equipamento     NUMERIC(10),
    nome                VARCHAR(60),
    valor_diaria        VARCHAR(8),
    fk_categoria_cod    NUMERIC(10),
    CONSTRAINT PK_EQUIPAMENTO PRIMARY KEY (cod_equipamento)
);

CREATE TABLE Construtoras 
(
    cod_construtora_pk      NUMERIC(5) NOT NULL,
    nome                    VARCHAR(100) NOT NULL,
    nome_fantasia           VARCHAR(100) NOT NULL,
    endereco                VARCHAR(150) NULL, 
    CONSTRAINT PK_CONSTRUTORA PRIMARY KEY (cod_construtora_pk)
);

CREATE TABLE Telefones
(
    id_telefone     NUMERIC(5),
    tel_cod         NUMERIC(5),
    telefone        VARCHAR(16),
    CONSTRAINT PK_TELEFONE PRIMARY KEY (id_telefone)
);

CREATE TABLE Obras
(
    cod_obra_pk             NUMERIC(6) NOT NULL,
    nome                    VARCHAR(60) NOT NULL,
    logradouro_endereco     VARCHAR(100) NOT NULL,
    numero_endereco         NUMERIC(5) NOT NULL,
    complemento_endereco    VARCHAR(100) NULL,
    fk_construtora_cod      NUMERIC(5),
    CONSTRAINT PK_OBRA PRIMARY KEY (cod_obra_pk)
);

CREATE TABLE Trabalhadores
(
    cpf         VARCHAR(15) NOT NULL,
    nome        VARCHAR(60) NOT NULL,
    salario     VARCHAR(8) NOT NULL,
    fk_obra_cod NUMERIC(6) NOT NULL,
    CONSTRAINT PK_TRABALHADOR PRIMARY KEY (cpf)
);

CREATE TABLE Aluguel
(
    fk_equipamento_obra_cod NUMERIC(6),
    fk_equipamento_cod      NUMERIC(10),
    data_inicio             DATE,
    data_termino            DATE
);


------- Alterando as tabelas para receberem as chaves estrangeiras ---------------------------------------------

ALTER TABLE Telefones
ADD CONSTRAINT fk_construtora_telefone
FOREIGN KEY (tel_cod) 
REFERENCES Construtoras (cod_construtora_pk);

ALTER TABLE Obras
ADD CONSTRAINT fk_construtora_obra
FOREIGN KEY (fk_construtora_cod)
REFERENCES Construtoras (cod_construtora_pk);

ALTER TABLE Trabalhadores
ADD CONSTRAINT fk_trabalhador_obra
FOREIGN KEY (fk_obra_cod)
REFERENCES Obras (cod_obra_pk);

ALTER TABLE Equipamentos
ADD CONSTRAINT fk_equip_categ
FOREIGN KEY (fk_categoria_cod)
REFERENCES  Categorias (cod_categoria);

ALTER TABLE Aluguel
ADD CONSTRAINT fk_aluguel_equi 
FOREIGN KEY (fk_equipamento_cod) 
REFERENCES Equipamentos (cod_equipamento);

ALTER TABLE Aluguel
ADD CONSTRAINT fk_aluguel_obra
FOREIGN KEY (fk_equipamento_obra_cod)
REFERENCES Obras (cod_obra_pk);


------- Inserindo conteúdo nas tabelas ---------------------------------------------

--- Categorias ---------------------------------------------------------------------------------- 
INSERT INTO Categorias(cod_categoria, descricao) VALUES (1, 'Concretagem');
INSERT INTO Categorias(cod_categoria, descricao) VALUES (2, 'Acesso e Elevação');
INSERT INTO Categorias(cod_categoria, descricao) VALUES (3, 'Geradores e Compressores');
INSERT INTO Categorias(cod_categoria, descricao) VALUES (4, 'Andaimes');
INSERT INTO Categorias(cod_categoria, descricao) VALUES (5, 'Ferramenta Elétrica');

--- Equipamentos ---------------------------------------------------------------------------------- 
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (301, 'Betoneira', '100.00', 1);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (302, 'Cortadora de Piso', '10.00', 1);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (303, 'Mangote', '30.50', 1);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (304, 'Guincho', '250.00', 2);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (305, 'Gerador', '451.00', 3);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (306, 'Piso Metálico', '150.00', 4);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (307, 'Furadeira de bancada', '65.00', 5);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (308, 'Parafusadeira', '37.00', 5);
INSERT INTO Equipamentos(cod_equipamento, nome, valor_diaria, fk_categoria_cod) VALUES (309, 'Plaina', '25.00', 5);

--- Construtoras ---------------------------------------------------------------------------------- 
INSERT INTO Construtoras(cod_construtora_pk, nome, nome_fantasia ) VALUES (10, 'Construtora Alfa S.A', 'Alfa Incorporações');

--- Telefones ---------------------------------------------------------------------------------- 
INSERT INTO Telefones(id_telefone, tel_cod, telefone) VALUES (1, 10, '(51) 3333-3334');
INSERT INTO Telefones(id_telefone, tel_cod, telefone) VALUES (2, 10, '(51) 3333-3335');
INSERT INTO Telefones(id_telefone, tel_cod, telefone) VALUES (3, 10, '(51) 3333-3336');

--- Obras ---------------------------------------------------------------------------------- 
INSERT INTO Obras(cod_obra_pk, nome, logradouro_endereco, numero_endereco, complemento_endereco, fk_construtora_cod)
VALUES (115, 'Condomínio dos Lagos', 'Travessa dos Lagos', 100, 'Norte', 10);
INSERT INTO Obras(cod_obra_pk, nome, logradouro_endereco, numero_endereco, complemento_endereco, fk_construtora_cod)
VALUES (116, 'Condomínio Araras', 'Avenida Rio Grande', 22, 'Lado A', 10);

--- Trabalhadores ---------------------------------------------------------------------------------- 
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('101.101.101-34', 'José Chaves', '2200.00', 115);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('102.102.102-91', 'Pedro Passos', '3502.18', 115);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('218.561.442-83', 'João Gomes', '2800.87', 115);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('366.128.430-47', 'Kaike Lima', '2400.35', 115);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('103.103.103-18', 'Maria Aparecida', '3800.27', 115);

INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('565.456.472-29', 'Gustavo Martins', '2100.00', 116);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('719.775.293-05', 'Daniel Silva', '2500.89', 116);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('631.635.057-08', 'Felipe Santos', '3405.65', 116);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('104.104.104-52', 'Carlos Dutra', '2900.00', 116);
INSERT INTO Trabalhadores(cpf, nome, salario, fk_obra_cod) VALUES ('105.105.105-85', 'Mário Pires', '4323.29', 116);

--- Aluguel ---------------------------------------------------------------------------------- 
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (115, 301, TO_DATE('18/03/2022', 'DD/MM/YYYY'), TO_DATE('24/10/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (115, 304, TO_DATE('20/04/2022', 'DD/MM/YYYY'), TO_DATE('02/08/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (115, 306, TO_DATE('06/07/2021', 'DD/MM/YYYY'), TO_DATE('18/07/2021', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (115, 307, TO_DATE('04/03/2022', 'DD/MM/YYYY'), TO_DATE('20/03/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (115, 309, TO_DATE('04/08/2021', 'DD/MM/YYYY'), TO_DATE('10/08/2021', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (116, 304, TO_DATE('22/10/2022', 'DD/MM/YYYY'), TO_DATE('25/10/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (116, 305, TO_DATE('07/03/2022', 'DD/MM/YYYY'), TO_DATE('10/03/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (116, 306, TO_DATE('12/09/2022', 'DD/MM/YYYY'), TO_DATE('21/09/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (116, 307, TO_DATE('16/08/2022', 'DD/MM/YYYY'), TO_DATE('24/08/2022', 'DD/MM/YYYY'));
INSERT INTO Aluguel(fk_equipamento_obra_cod, fk_equipamento_cod, data_inicio, data_termino)
VALUES (116, 308, TO_DATE('23/10/2022', 'DD/MM/YYYY'), TO_DATE('25/10/2022', 'DD/MM/YYYY'));

