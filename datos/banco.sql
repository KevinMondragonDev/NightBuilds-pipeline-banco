-- Base de práctica del módulo 06 (PostgreSQL). Generado por generar_datos.py
--   createdb -U postgres banco_python
--   psql -U postgres -d banco_python -f 06_ingenieria_de_datos/datos/banco.sql

DROP TABLE IF EXISTS cuentas;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id          INT PRIMARY KEY,
    nombre      VARCHAR(80) NOT NULL,
    ciudad      VARCHAR(50),
    fecha_alta  DATE NOT NULL,
    segmento    VARCHAR(10) NOT NULL CHECK (segmento IN ('basico', 'plus', 'premium'))
);

CREATE TABLE cuentas (
    id          INT PRIMARY KEY,
    cliente_id  INT NOT NULL REFERENCES clientes(id),
    tipo        VARCHAR(10) NOT NULL CHECK (tipo IN ('debito', 'credito', 'ahorro')),
    saldo       NUMERIC(12,2) NOT NULL
);

INSERT INTO clientes (id, nombre, ciudad, fecha_alta, segmento) VALUES
  (1, 'Ana López', NULL, '2022-10-15', 'basico'),
  (2, 'Bruno Díaz', 'CDMX', '2021-07-15', 'premium'),
  (3, 'Carla Méndez', NULL, '2021-04-15', 'basico'),
  (4, 'Diego Ruiz', 'Guadalajara', '2022-09-15', 'basico'),
  (5, 'Elena Torres', 'Querétaro', '2022-05-15', 'basico'),
  (6, 'Fernando Gil', 'Guadalajara', '2020-05-15', 'basico'),
  (7, 'Gabriela Soto', 'Querétaro', '2020-12-15', 'basico'),
  (8, 'Héctor Vega', 'CDMX', '2021-12-15', 'plus'),
  (9, 'Irene Campos', NULL, '2022-04-15', 'plus'),
  (10, 'Javier Ortiz', 'Monterrey', '2021-05-15', 'basico'),
  (11, 'Karla Núñez', NULL, '2020-05-15', 'basico'),
  (12, 'Luis Peña', 'CDMX', '2024-09-15', 'plus');

INSERT INTO cuentas (id, cliente_id, tipo, saldo) VALUES
  (1, 1, 'credito', 67144.46),
  (2, 2, 'debito', 109001.68),
  (3, 3, 'debito', -8085.75),
  (4, 4, 'ahorro', 93116.38),
  (5, 5, 'credito', 137026.71),
  (6, 6, 'debito', 62893.62),
  (7, 7, 'debito', -1872.16),
  (8, 8, 'ahorro', 139216.34),
  (9, 9, 'debito', -19130.9),
  (10, 10, 'credito', 3269.69),
  (11, 11, 'ahorro', 92086.32),
  (12, 12, 'ahorro', -4089.87),
  (13, 1, 'ahorro', 17293.98),
  (14, 2, 'debito', 98059.19),
  (15, 3, 'debito', 52997.81);
