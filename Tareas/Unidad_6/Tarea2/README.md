<div align="justify">

# Tarea 2 de trabajo con índices


Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)

Se pide:

- Elimine la tabla "cliente" si existe. 
```sql
    DROP TABLE IF EXISTS cliente;
    Query OK, 0 rows affected, 1 warning (0,04 sec)
```
- Cree la tabla si clave primaria y incluye a posteriori esta.
   ```sql
    CREATE TABLE cliente (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    provincia VARCHAR(20),
    telefono VARCHAR(11)
    );
    Query OK, 0 rows affected (0,03 sec)

    ALTER TABLE cliente ADD PRIMARY KEY (documento);
    Query OK, 0 rows affected (0,03 sec)
    Records: 0  Duplicates: 0  Warnings: 0

   ```
- Define los siguientes indices:
  - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
  "documento" ya es una clave primaria por lo que no necesita índice
    ```sql
        CREATE INDEX i_ciudad_provincia ON cliente (ciudad, provincia);
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0
   ```
    - Vea los índices de la tabla.
        ```sql
        SHOW INDEX FROM cliente;
        ```

        +---------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table   | Non_unique | Key_name           | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +---------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | cliente |          0 | PRIMARY            |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | cliente |          1 | i_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        | cliente |          1 | i_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        +---------+------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

- Agregue un índice único por el campo "telefono".
    ```sql
        CREATE UNIQUE INDEX i_telefono_unico ON cliente (telefono);
        Query OK, 0 rows affected (0,02 sec)
        Records: 0  Duplicates: 0  Warnings: 0
   ```
- Elimina los índices.
   ```sql
        DROP INDEX i_ciudad_provincia ON cliente;
        Query OK, 0 rows affected (0,01 sec)
        Records: 0  Duplicates: 0  Warnings: 0

        DROP INDEX i_telefono_unico ON cliente;
        Query OK, 0 rows affected (0,00 sec)
        Records: 0  Duplicates: 0  Warnings: 0

   ```
    
## Referencias

- [Índices en MySql](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html).
- [Apuntes sobre índices](../../Indices.md).

</div>