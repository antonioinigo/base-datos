<div align="justify">

# Code, Learn & Practice("Simulacro de bbdd 🧪: Consultas, Índices, Vistas, Funciones y Procedimientos")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## 🧾 Contexto

Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas. Además, deberás demostrar habilidades en consultas SQL, índices, vistas, procedimientos y funciones. Si la base de datos no estuvira creada, a continuación tienes el [init.sql](docker-init/init.sql).

## Base de datos en docker

Crea una carpeta y añade el fichero **docker-compose.yml** y el directorio **docker-init**.

Ejecuta a continuación el siguiente comando:

```sql
docker compose up -d 
```

Obtendrar una salida similar a la siguiente:

```console
 docker compose up -d   
[+] Running 2/2
 ✔ Container adminer_container  Started                                                                                                             0.9s 
 ✔ Container mysql_container    Started    
```

A continuación ejecuta el siguiente comando:

```console
docker exec -it mysql_container mysql -u root -p
```

Indica el *password* que es **bae**.

A continuación debes de estar dentro de la consola:

```sql
....
....
....
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

> **IMPORTANTE**: *Para salir de la consola se debe de ejecutar* ***exit***.

Verifica las bases de datos que tienes cargadas: (*SHOW DATABASES;*)

```console
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bae                |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| universidad        |
+--------------------+
6 rows in set (0.00 sec)
```

Usa la base de datos **universidad**: (*use universidad;*)

```console
use universidad;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
```

También podemos acceder a través del navegador. Para ello utilizaremos **Adminer** porque *simula la línea de comandos, y nos ayuda a aprender*. Una vez que accedas a [http://localhost:8099](http://localhost:8099), Adminer te pedirá los siguientes datos:

> Puedes consultar la documentación [aquí](https://www.adminer.org/en/).

- **Sistema**: `MySQL`
- **Servidor**: `db`  
  *Es el nombre del servicio del contenedor MySQL dentro del mismo `docker-compose` (Adminer y MySQL están en la misma red `db-network`).*
- **Usuario**: `bae`
- **Contraseña**: `bae`

> ***Lee atentamente cada una de los puntos y cuestiones y realiza***.

## 🔎 Parte 1: Consultas SQL

### A. Consultas Simples

1. Mostrar todos los cursos disponibles.

```sql
select * from cursos;
+----+----------------------+-------------+----------+
| id | nombre               | profesor_id | creditos |
+----+----------------------+-------------+----------+
|  1 | lgebra Lineal        |           1 |        6 |
|  2 | Programacin I        |           2 |        5 |
|  3 | Mecnica Clsica       |           3 |        6 |
|  4 | Estructuras de Datos |           2 |        5 |
|  5 | Clculo I             |           1 |        6 |
+----+----------------------+-------------+----------+
```

2. Mostrar el nombre de todos los profesores.

```sql
select nombre from profesores;
+-----------------+
| nombre          |
+-----------------+
| Dra. Ana Torres |
| Dr. Luis Gmez   |
| Dra. Marta Daz  |
+-----------------+
```

3. Listar todas las matrículas.

```sql
select * from matriculas;
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  1 |             1 |        1 | 2021-09-01 |
|  2 |             2 |        2 | 2022-09-01 |
|  3 |             3 |        3 | 2023-09-02 |
|  4 |             4 |        4 | 2024-09-03 |
|  5 |             1 |        5 | 2020-09-04 |
|  6 |             2 |        4 | 2022-09-05 |
|  7 |             3 |        1 | 2023-09-06 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
```

4. Ver los nombres y correos de los estudiantes.

```sql
select nombre, email from estudiantes;
+---------------+----------------+
| nombre        | email          |
+---------------+----------------+
| Mara Lpez     | maria@uni.edu  |
| Juan Prez     | juan@uni.edu   |
| Luca Fernndez | lucia@uni.edu  |
| Carlos Ruiz   | carlos@uni.edu |
+---------------+----------------+
```

5. Ver los cursos y su número de créditos.

```sql
select id, nombre, creditos from cursos;
+----+----------------------+----------+
| id | nombre               | creditos |
+----+----------------------+----------+
|  1 | lgebra Lineal        |        6 |
|  2 | Programacin I        |        5 |
|  3 | Mecnica Clsica       |        6 |
|  4 | Estructuras de Datos |        5 |
|  5 | Clculo I             |        6 |
+----+----------------------+----------+
```
---

### B. Consultas con `WHERE`. Obligatorio utilizar **WHERE** donde se **combine dos o más tablas**

1. Obtener los cursos impartidos por profesores del departamento de Informática.

```sql
select * from cursos as c, profesores as p where c.profesor_id=p.id and p.departamento='Informtica';
+----+----------------------+-------------+----------+----+---------------+--------------+
| id | nombre               | profesor_id | creditos | id | nombre        | departamento |
+----+----------------------+-------------+----------+----+---------------+--------------+
|  2 | Programacin I        |           2 |        5 |  2 | Dr. Luis Gmez | Informtica   |
|  4 | Estructuras de Datos |           2 |        5 |  2 | Dr. Luis Gmez | Informtica   |
+----+----------------------+-------------+----------+----+---------------+--------------+
```

2. Obtener los estudiantes que viven en Madrid.

```sql
select * from estudiantes where ciudad = 'Madrid';
+----+-----------+---------------+--------+
| id | nombre    | email         | ciudad |
+----+-----------+---------------+--------+
|  1 | Mara Lpez | maria@uni.edu | Madrid |
+----+-----------+---------------+--------+
```

3. Mostrar los cursos con más de 5 créditos.

```sql
select * from cursos where creditos > 5;
+----+----------------+-------------+----------+
| id | nombre         | profesor_id | creditos |
+----+----------------+-------------+----------+
|  1 | lgebra Lineal  |           1 |        6 |
|  3 | Mecnica Clsica |           3 |        6 |
|  5 | Clculo I       |           1 |        6 |
+----+----------------+-------------+----------+
```

4. Ver las matrículas realizadas después del año 2022.

```sql
select * from matriculas as m, estudiantes as e, cursos as c where m.estudiante_id=e.id and m.curso_id = c.id and m.fecha > '2022-12-31';
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
| id | estudiante_id | curso_id | fecha      | id | nombre        | email          | ciudad   | id | nombre               | profesor_id | creditos |
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
|  3 |             3 |        3 | 2023-09-02 |  3 | Luca Fernndez | lucia@uni.edu  | Valencia |  3 | Mecnica Clsica       |           3 |        6 |
|  7 |             3 |        1 | 2023-09-06 |  3 | Luca Fernndez | lucia@uni.edu  | Valencia |  1 | lgebra Lineal        |           1 |        6 |
|  4 |             4 |        4 | 2024-09-03 |  4 | Carlos Ruiz   | carlos@uni.edu | Sevilla  |  4 | Estructuras de Datos |           2 |        5 |
|  8 |             4 |        2 | 2024-09-06 |  4 | Carlos Ruiz   | carlos@uni.edu | Sevilla  |  2 | Programacin I        |           2 |        5 |
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
```

5. Ver los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
 select * from cursos as c, profesores as p where c.profesor_id=p.id and p.nombre ='Dra. Ana Torres';
+----+---------------+-------------+----------+----+-----------------+--------------+
| id | nombre        | profesor_id | creditos | id | nombre          | departamento |
+----+---------------+-------------+----------+----+-----------------+--------------+
|  1 | lgebra Lineal |           1 |        6 |  1 | Dra. Ana Torres | Matemticas   |
|  5 | Clculo I      |           1 |        6 |  1 | Dra. Ana Torres | Matemticas   |
+----+---------------+-------------+----------+----+-----------------+--------------+
```

---

### C. Consultas con `JOIN`.  Obligatorio utilizar **JOIN** donde se **combine dos o más tablas**

> (Devuelven el mismo resultado que las anteriores, pero usando combinaciones de tablas)

1. Mostrar cursos impartidos por profesores del departamento de Informática.

```sql
select * from cursos as c join profesores as p on c.profesor_id=p.id where p.departamento='Informtica';
+----+----------------------+-------------+----------+----+---------------+--------------+
| id | nombre               | profesor_id | creditos | id | nombre        | departamento |
+----+----------------------+-------------+----------+----+---------------+--------------+
|  2 | Programacin I        |           2 |        5 |  2 | Dr. Luis Gmez | Informtica   |
|  4 | Estructuras de Datos |           2 |        5 |  2 | Dr. Luis Gmez | Informtica   |
+----+----------------------+-------------+----------+----+---------------+--------------+
```

2. Obtener estudiantes que viven en Madrid.

```sql
select * from estudiantes where ciudad = 'Madrid';
+----+-----------+---------------+--------+
| id | nombre    | email         | ciudad |
+----+-----------+---------------+--------+
|  1 | Mara Lpez | maria@uni.edu | Madrid |
+----+-----------+---------------+--------+
```

3. Mostrar cursos con más de 5 créditos.

```sql
select * from cursos where creditos > 5;
+----+----------------+-------------+----------+
| id | nombre         | profesor_id | creditos |
+----+----------------+-------------+----------+
|  1 | lgebra Lineal  |           1 |        6 |
|  3 | Mecnica Clsica |           3 |        6 |
|  5 | Clculo I       |           1 |        6 |
+----+----------------+-------------+----------+
```

4. Listar matrículas realizadas después del año 2022.

```sql
select * from matriculas as m join estudiantes as e on m.estudiante_id=e.id join cursos as c on m.curso_id = c.id where m.fecha > '2022-12-31';
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
| id | estudiante_id | curso_id | fecha      | id | nombre        | email          | ciudad   | id | nombre               | profesor_id | creditos |
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
|  3 |             3 |        3 | 2023-09-02 |  3 | Luca Fernndez | lucia@uni.edu  | Valencia |  3 | Mecnica Clsica       |           3 |        6 |
|  7 |             3 |        1 | 2023-09-06 |  3 | Luca Fernndez | lucia@uni.edu  | Valencia |  1 | lgebra Lineal        |           1 |        6 |
|  4 |             4 |        4 | 2024-09-03 |  4 | Carlos Ruiz   | carlos@uni.edu | Sevilla  |  4 | Estructuras de Datos |           2 |        5 |
|  8 |             4 |        2 | 2024-09-06 |  4 | Carlos Ruiz   | carlos@uni.edu | Sevilla  |  2 | Programacin I        |           2 |        5 |
+----+---------------+----------+------------+----+---------------+----------------+----------+----+----------------------+-------------+----------+
```

5. Mostrar los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
+----+---------------+-------------+----------+----+-----------------+--------------+
| id | nombre        | profesor_id | creditos | id | nombre          | departamento |
+----+---------------+-------------+----------+----+-----------------+--------------+
|  1 | lgebra Lineal |           1 |        6 |  1 | Dra. Ana Torres | Matemticas   |
|  5 | Clculo I      |           1 |        6 |  1 | Dra. Ana Torres | Matemticas   |
+----+---------------+-------------+----------+----+-----------------+--------------+
```
---

### D. Consultas con Subconsultas

> (Devuelven el mismo resultado que las anteriores, pero usando subconsultas)

1. Cursos impartidos por profesores del departamento de Informática.

```sql
select * from cursos where profesor_id in (select id from profesores where departamento = 'Informtica');
+----+----------------------+-------------+----------+
| id | nombre               | profesor_id | creditos |
+----+----------------------+-------------+----------+
|  2 | Programacin I        |           2 |        5 |
|  4 | Estructuras de Datos |           2 |        5 |
+----+----------------------+-------------+----------+
```

2. Obtener estudiantes que viven en Madrid.

```sql
select * from estudiantes where ciudad = 'Madrid';
+----+-----------+---------------+--------+
| id | nombre    | email         | ciudad |
+----+-----------+---------------+--------+
|  1 | Mara Lpez | maria@uni.edu | Madrid |
+----+-----------+---------------+--------+
```

3. Mostrar cursos con más de 5 créditos.

```sql
select * from cursos where creditos > 5;
+----+----------------+-------------+----------+
| id | nombre         | profesor_id | creditos |
+----+----------------+-------------+----------+
|  1 | lgebra Lineal  |           1 |        6 |
|  3 | Mecnica Clsica |           3 |        6 |
|  5 | Clculo I       |           1 |        6 |
+----+----------------+-------------+----------+
```

4. Matrículas realizadas después del año 2022.

```sql
select * from matriculas where fecha > '2022-12-31' and estudiante_id in (select id from estudiantes) and curso_id in (select id from cursos);
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  3 |             3 |        3 | 2023-09-02 |
|  7 |             3 |        1 | 2023-09-06 |
|  4 |             4 |        4 | 2024-09-03 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
```

5. Cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
select * from cursos where profesor_id in(select id from profesores where nombre ='Dra. Ana Torres');
+----+---------------+-------------+----------+
| id | nombre        | profesor_id | creditos |
+----+---------------+-------------+----------+
|  1 | lgebra Lineal |           1 |        6 |
|  5 | Clculo I      |           1 |        6 |
+----+---------------+-------------+----------+
```

---

## 📂 Parte 2: Índices

1. Crear un índice en la columna `ciudad` de la tabla `estudiantes`.

```sql
Create index idx_ciudad on estudiantes(ciudad);
```

2. Crear un índice en la columna `departamento` de la tabla `profesores`.

```sql
create index idx_departamento on profesores(departamento);
```

3. Consultar los índices creados.

```sql
show index from estudiantes;
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| estudiantes |          0 | PRIMARY    |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| estudiantes |          1 | idx_ciudad |            1 | ciudad      | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+


show index from profesores;
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| profesores |          0 | PRIMARY          |            1 | id           | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesores |          1 | idx_departamento |            1 | departamento | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

4. Eliminar ambos índices.

```sql
drop index idx_ciudad on estudiantes;
drop index idx_departamento on profesores;
```
---

## 🪞 Parte 3: Vistas

1. Crear una vista llamada `vista_matriculas_completas` que muestre:
   - nombre del estudiante,
   - nombre del curso,
   - fecha de la matrícula.

```sql
Create view vistas_matriculas_completas as select e.nombre as nombre, c.nombre as curso, m.fecha from matriculas as m join estudiantes as e on m.estudiante_id = e.id join cursos as c on m.curso_id = c.id;
+---------------+----------------------+------------+
| nombre        | curso                | fecha      |
+---------------+----------------------+------------+
| Mara Lpez     | lgebra Lineal        | 2021-09-01 |
| Mara Lpez     | Clculo I             | 2020-09-04 |
| Juan Prez     | Programacin I        | 2022-09-01 |
| Juan Prez     | Estructuras de Datos | 2022-09-05 |
| Luca Fernndez | Mecnica Clsica       | 2023-09-02 |
| Luca Fernndez | lgebra Lineal        | 2023-09-06 |
| Carlos Ruiz   | Estructuras de Datos | 2024-09-03 |
| Carlos Ruiz   | Programacin I        | 2024-09-06 |
+---------------+----------------------+------------+
```

2. Consultar datos desde la vista, mostrando el nombre del estudiante y la fecha de matrícula.

```sql
select nombre, fecha from vistas_matriculas_completas;
+---------------+------------+
| nombre        | fecha      |
+---------------+------------+
| Mara Lpez     | 2021-09-01 |
| Mara Lpez     | 2020-09-04 |
| Juan Prez     | 2022-09-01 |
| Juan Prez     | 2022-09-05 |
| Luca Fernndez | 2023-09-02 |
| Luca Fernndez | 2023-09-06 |
| Carlos Ruiz   | 2024-09-03 |
| Carlos Ruiz   | 2024-09-06 |
+---------------+------------+
```

3. Eliminar la vista.

```sql
drop view vistas_matriculas_completas;
```

---

## ⚙ Parte 4: Procedimiento Almacenado

1. Crear un procedimiento llamado `cursos_por_profesor` que reciba el nombre del profesor como parámetro y devuelva los cursos que imparte y su número de créditos.

```sql
Delimiter //
Create procedure cursos_por_profesor(in profesor text)
begin
select c.nombre, c.creditos from cursos as c join profesores as p on c.profesor_id = p.id where p.nombre = profesor;
end //

Delimiter ;
```

2. Ejecutar el procedimiento con el nombre “Dr. Luis Gómez”.

```sql
Call cursos_por_profesor('Dr. Luis Gmez');
+----------------------+----------+
| nombre               | creditos |
+----------------------+----------+
| Programacin I        |        5 |
| Estructuras de Datos |        5 |
+----------------------+----------+
```

3. Eliminar el procedimiento.

```sql
Drop procedure cursos_por_profesor;
```

---

## 🔢 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `total_creditos_estudiante` que reciba el ID de un estudiante y devuelva el total de créditos que ha matriculado.

```sql
Delimiter //
create function total_creditos_estudiante(ID int) 
returns int
deterministic
begin
    declare total_creditos int;
    select sum(c.creditos) into total_creditos from cursos as c join matriculas as m on c.id = m.curso_id join estudiantes as e on m.estudiante_id = e.id where e.id = ID;
    return total_creditos;
end //

Delimiter ;
```

2. Ejecutar la función para un estudiante específico.

```sql
select total_creditos_estudiante(1);
+------------------------------+
| total_creditos_estudiante(1) |
+------------------------------+
|                           12 |
+------------------------------+

```

3. Eliminar la función.

```sql
Drop function total_creditos_estudiante;
```

</div>