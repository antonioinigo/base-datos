<div align="justify">

# Tarea 1 de trabajo con índices



Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

Se pide: 
- Elimine la tabla "alumno" si existe. 
```sql
    DROP TABLE IF EXISTS alumno;
    Query OK, 0 rows affected (0,01 sec)
```
- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
```sql
    CREATE TABLE alumno (
    numero_inscripcion INT NOT NULL,
    anio_inscripcion INT NOT NULL,
    nombre VARCHAR(100),
    documento VARCHAR(20),
    domicilio VARCHAR(150),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    PRIMARY KEY (anio_inscripcion, numero_inscripcion)
);

Query OK, 0 rows affected (0,01 sec)
``` 
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
    ```sql
       CREATE UNIQUE INDEX i_documento_unico ON alumno (documento);
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0

        CREATE INDEX i_ciudad_provincia ON alumno (ciudad, provincia);
        Query OK, 0 rows affected (0,00 sec)
        Records: 0  Duplicates: 0  Warnings: 0

    ```
    - Vea los índices de la tabla.
    ```sql
        SHOW INDEX FROM alumno;
    ```

        +--------+------------+--------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table  | Non_unique | Key_name           | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +--------+------------+--------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | alumno |          0 | PRIMARY            |            1 | anio_inscripcion   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | alumno |          0 | PRIMARY            |            2 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | alumno |          0 | i_documento_unico  |            1 | documento          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        | alumno |          1 | i_ciudad_provincia |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        | alumno |          1 | i_ciudad_provincia |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        +--------+------------+--------------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

- Intente ingresar un alumno con clave primaria repetida.
    ```sql
        INSERT INTO alumno VALUES (1, 2024, 'Juan Pérez', '12345678', 'Calle Falsa 123', 'Los Realejos', 'Tenerife');
        INSERT INTO alumno VALUES (1, 2024, 'Jose Pérez', '87654321', 'Calle Falsa 342', 'Los Realejos', 'Tenerife');
    ```
        ERROR 1062 (23000): Duplicate entry '2024-1' for key 'alumno.PRIMARY

- Intente ingresar un alumno con documento repetido.
    ```sql
        INSERT INTO alumno VALUES (2, 2024, 'Lucía Fernández', '12345678', 'Calle Falsa 342', 'Los Realejos', 'Tenerife');
    ```
    ERROR 1062 (23000): Duplicate entry '12345678' for key 'alumno.i_documento_unico'

- Ingrese varios alumnos de la misma ciudad y provincia.
    ```sql
        INSERT INTO alumno VALUES (2, 2024, 'Lucía Fernández', '87654321', 'Calle Falsa 342', 'Los Realejos', 'Tenerife');
        INSERT INTO alumno VALUES (3, 2024, 'Jose Pérez', '87654521', 'Calle Falsa 342', 'Los Realejos', 'Tenerife');
        INSERT INTO alumno VALUES (4, 2024, 'Antonio Inigo', '87654621', 'Calle Falsa 342', 'Los Realejos', 'Tenerife');
    ```

        +--------------------+------------------+-------------------+-----------+-----------------+--------------+-----------+
        | numero_inscripcion | anio_inscripcion | nombre            | documento | domicilio       | ciudad       | provincia |
        +--------------------+------------------+-------------------+-----------+-----------------+--------------+-----------+
        |                  1 |             2024 | Juan Pérez        | 12345678  | Calle Falsa 123 | Los Realejos | Tenerife  |
        |                  2 |             2024 | Lucía Fernández   | 87654321  | Calle Falsa 342 | Los Realejos | Tenerife  |
        |                  3 |             2024 | Jose Pérez        | 87654521  | Calle Falsa 342 | Los Realejos | Tenerife  |
        |                  4 |             2024 | Antonio Inigo     | 87654621  | Calle Falsa 342 | Los Realejos | Tenerife  |
        +--------------------+------------------+-------------------+-----------+-----------------+--------------+-----------+
- Elimina los indices creados, y muestra que ya no se encuentran.
    ```sql
        DROP INDEX i_documento_unico ON alumno;
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0

        DROP INDEX i_ciudad_provincia ON alumno;
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0
    ```
## Referencias

- [Índices en MySql](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html).
- [Apuntes sobre índices](../../Indices.md).

</div>