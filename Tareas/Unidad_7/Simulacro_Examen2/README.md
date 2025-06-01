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
- **Usuario**: `root`
- **Contraseña**: `bae`

> ***Lee atentamente cada una de los puntos y cuestiones y realiza***.

## 📄 Parte 1: Consultas para Explorar la Estructura de las Tablas

1. Mostrar las columnas de la tabla `estudiantes`.

```sql
 show columns from estudiantes;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int          | NO   | PRI | NULL    |       |
| nombre | varchar(100) | YES  |     | NULL    |       |
| email  | varchar(100) | YES  |     | NULL    |       |
| ciudad | varchar(50)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
```

2. Mostrar las columnas de la tabla `cursos`.

```sql
    show columns from cursos;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| id          | int          | NO   | PRI | NULL    |       |
| nombre      | varchar(100) | YES  |     | NULL    |       |
| profesor_id | int          | YES  | MUL | NULL    |       |
| creditos    | int          | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

```

3. Mostrar las columnas de la tabla `matriculas`.

```sql
    show columns from matriculas;
+---------------+------+------+-----+---------+-------+
| Field         | Type | Null | Key | Default | Extra |
+---------------+------+------+-----+---------+-------+
| id            | int  | NO   | PRI | NULL    |       |
| estudiante_id | int  | YES  | MUL | NULL    |       |
| curso_id      | int  | YES  | MUL | NULL    |       |
| fecha         | date | YES  |     | NULL    |       |
+---------------+------+------+-----+---------+-------+
```

---

## 📊 Parte 2: Consultas Avanzadas sobre Datos

4. Mostrar cada estudiante con la cantidad de cursos en los que está matriculado.

```sql
select e.nombre as estudiante, count(m.curso_id) from matriculas as m join estudiantes as e on m.estudiante_id=e.id group by e.id;
+---------------+-------------------+
| estudiante    | count(m.curso_id) |
+---------------+-------------------+
| Mara Lpez     |                 3 |
| Juan Prez     |                 3 |
| Luca Fernndez |                 2 |
| Carlos Ruiz   |                 3 |
+---------------+-------------------+
```

5. Mostrar cada estudiante con el total de créditos acumulados.

```sql
select e.nombre, sum(c.creditos) from matriculas as m join estudiantes as e on m.estudiante_id=e.id join cursos as c on m.curso_id=c.id group by e.id;
+---------------+-----------------+
| nombre        | sum(c.creditos) |
+---------------+-----------------+
| Mara Lpez     |              18 |
| Juan Prez     |              16 |
| Luca Fernndez |              12 |
| Carlos Ruiz   |              16 |
+---------------+-----------------+
```

6. Mostrar cursos con la cantidad de estudiantes matriculados, ordenados de mayor a menor.

```sql
select c.nombre, count(e.id) as estudiantes_matriculados from matriculas as m join estudiantes as e on m.estudiante_id=e.id join cursos as c on m.curso_id=c.id group by c.nombre order by count(e.id) desc;
+----------------------+--------------------------+
| nombre               | estudiantes_matriculados |
+----------------------+--------------------------+
| lgebra Lineal        |                        2 |
| Programacin I        |                        2 |
| Estructuras de Datos |                        2 |
| Clculo I             |                        1 |
| Mecnica Clsica       |                        1 |
+----------------------+--------------------------+
```

7. Mostrar la media de créditos por curso.

```sql
select nombre, avg(creditos) from cursos group by id;
+----------------------+---------------+
| nombre               | avg(creditos) |
+----------------------+---------------+
| lgebra Lineal        |        6.0000 |
| Programacin I        |        5.0000 |
| Mecnica Clsica       |        6.0000 |
| Estructuras de Datos |        5.0000 |
| Clculo I             |        6.0000 |
+----------------------+---------------+
```

8. Listar los cursos que no tienen estudiantes matriculados.

```sql
select c.nombre from matriculas as m right join cursos as c on m.curso_id = c.id where c.id is null;

Empty set (0.007 sec)
```

9. Mostrar el nombre del profesor y cuántos cursos imparte.

```sql
select p.nombre, count(c.id) from profesores as p join cursos as c on p.id=c.profesor_id group by p.id;
+-----------------+-------------+
| nombre          | count(c.id) |
+-----------------+-------------+
| Dra. Ana Torres |           2 |
| Dr. Luis Gmez   |           2 |
| Dra. Marta Daz  |           1 |
+-----------------+-------------+
```

10. Mostrar los profesores que no imparten ningún curso.

```sql 
select p.nombre from profesores as p left join cursos as c on p.id=c.profesor_id where p.id is null;
Empty set (0.002 sec)
```

11. Mostrar la ciudad con mayor número de estudiantes registrados.

```sql
select ciudad, count(id) from estudiantes group by ciudad order by count(id) desc limit 1;
+--------+-----------+
| ciudad | count(id) |
+--------+-----------+
| Madrid |         1 |
+--------+-----------+
```

12. Mostrar estudiantes que están matriculados en más de 1 curso.

```sql
select e.nombre, count(m.curso_id) from estudiantes as e join matriculas as m on e.id=m.estudiante_id group by e.nombre having count(m.curso_id)>1;
+---------------+-------------------+
| nombre        | count(m.curso_id) |
+---------------+-------------------+
| Mara Lpez     |                 2 |
| Juan Prez     |                 2 |
| Luca Fernndez |                 2 |
| Carlos Ruiz   |                 2 |
+---------------+-------------------+

```

13. Listar cursos junto a su clasificación según créditos:
    - 6 o más: "Alta carga"
    - Menos de 6: "Carga estándar"

```sql
select *, case when creditos >= 6 then 'Alta Carga' else 'Carga estandar' end as clasificacion_creditos from cursos;
+----+----------------------+-------------+----------+------------------------+
| id | nombre               | profesor_id | creditos | clasificacion_creditos |
+----+----------------------+-------------+----------+------------------------+
|  1 | lgebra Lineal        |           1 |        6 | Alta Carga             |
|  2 | Programacin I        |           2 |        5 | Carga estandar         |
|  3 | Mecnica Clsica       |           3 |        6 | Alta Carga             |
|  4 | Estructuras de Datos |           2 |        5 | Carga estandar         |
|  5 | Clculo I             |           1 |        6 | Alta Carga             |
+----+----------------------+-------------+----------+------------------------+
```

14. Listar estudiantes y clasificar su carga académica:
    - Más de 12 créditos: "Carga Alta"
    - 6 a 12 créditos: "Carga Media"
    - Menos de 6 créditos: "Carga Baja"

```sql
SELECT e.nombre,
  SUM(c.creditos) AS total_creditos,
  IF(SUM(c.creditos) > 12, 'Carga Alta',
     IF(SUM(c.creditos) >= 6, 'Carga Media', 'Carga Baja')) AS clasificacion
FROM estudiantes e
LEFT JOIN matriculas m ON e.id = m.estudiante_id
LEFT JOIN cursos c ON m.curso_id = c.id
GROUP BY e.id;
+----+---------------+----------------+---------------------+
| id | nombre        | total_creditos | clasificacion_carga |
+----+---------------+----------------+---------------------+
|  1 | Mara Lpez     |             12 | Carga Media         |
|  2 | Juan Prez     |             10 | Carga Media         |
|  3 | Luca Fernndez |             12 | Carga Media         |
|  4 | Carlos Ruiz   |             10 | Carga Media         |
+----+---------------+----------------+---------------------+
```

15. Mostrar cursos en los que se haya matriculado al menos un estudiante de Sevilla.

```sql
select c.nombre, e.nombre as estudiante, e.ciudad from matriculas as m join cursos as c on m.curso_id=c.id join estudiantes as e on m.estudiante_id=e.id where e.ciudad='Sevilla';
+----------------------+-------------+---------+
| nombre               | estudiante  | ciudad  |
+----------------------+-------------+---------+
| Estructuras de Datos | Carlos Ruiz | Sevilla |
| Programacin I        | Carlos Ruiz | Sevilla |
+----------------------+-------------+---------+
```

16. Listar los cursos impartidos por profesores del departamento de Matemáticas.

```sql
 select c.nombre as curso, p.nombre, p.departamento from cursos as c join profesores as p on c.profesor_id=p.id where p.departamento='Matemticas';
+---------------+-----------------+--------------+
| curso         | nombre          | departamento |
+---------------+-----------------+--------------+
| lgebra Lineal | Dra. Ana Torres | Matemticas   |
| Clculo I      | Dra. Ana Torres | Matemticas   |
+---------------+-----------------+--------------+
```

17. Mostrar los cursos en los que se haya inscrito algún estudiante antes del año 2022.

```sql
select c.* from cursos as c join matriculas as m on c.id=m.curso_id where m.fecha < '2022-01-01';
+----+---------------+-------------+----------+
| id | nombre        | profesor_id | creditos |
+----+---------------+-------------+----------+
|  1 | lgebra Lineal |           1 |        6 |
|  5 | Clculo I      |           1 |        6 |
+----+---------------+-------------+----------+
```

18. Mostrar estudiantes que han cursado materias impartidas por el profesor “Dr. Luis Gómez”.

```sql
select e.nombre as estudiante, c.nombre as materia, p.nombre as profesor from matriculas as m join estudiantes as e on m.estudiante_id=e.id join cursos as c on m.curso_id = c.id join profesores as p on c.profesor_id = p.id where p.nombre ='Dr. Luis Gmez';
+----+-------------+----------------+-----------+
| id | nombre      | email          | ciudad    |
+----+-------------+----------------+-----------+
|  2 | Juan Prez   | juan@uni.edu   | Barcelona |
|  4 | Carlos Ruiz | carlos@uni.edu | Sevilla   |
|  4 | Carlos Ruiz | carlos@uni.edu | Sevilla   |
|  2 | Juan Prez   | juan@uni.edu   | Barcelona |
+----+-------------+----------------+-----------+
```

19. Mostrar los cursos más recientes (última matrícula por curso).

```sql
SELECT c.nombre, MAX(m.fecha) AS ultima_matricula
FROM cursos c
JOIN matriculas m ON c.id = m.curso_id
GROUP BY c.id;
+----+-------------+----------------+-----------+
| id | nombre      | email          | ciudad    |
+----+-------------+----------------+-----------+
|  2 | Juan Prez   | juan@uni.edu   | Barcelona |
|  4 | Carlos Ruiz | carlos@uni.edu | Sevilla   |
+----+-------------+----------------+-----------+
```

20. Mostrar el número total de estudiantes por departamento del profesor que imparte el curso.

```sql
select p.departamento, count(distinct m.estudiante_id) from profesores as p join cursos as c on p.id=c.profesor_id join matriculas as m on c.id=m.curso_id group by p.departamento;
+--------------+---------------------------------+
| departamento | count(distinct m.estudiante_id) |
+--------------+---------------------------------+
| Fsica        |                               1 |
| Informtica   |                               2 |
| Matemticas   |                               2 |
+--------------+---------------------------------+
```

---

## ⚙ Parte 3: Procedimiento Almacenado

1. Crear un procedimiento llamado `inscribir_estudiante` que reciba:
   - ID del estudiante
   - ID del curso
   - Fecha de inscripción  
   El procedimiento debe:
   - Verificar que el estudiante no esté ya matriculado en ese curso.
   - Si no lo está, insertarlo en `matriculas`; si ya lo está, lanzar un error.

```sql

DELIMITER //
CREATE PROCEDURE inscribir_estudiante(IN est_id INT, IN curso_id INT, IN fecha DATE)
BEGIN
  DECLARE existe INT;
  SELECT COUNT(*) INTO existe FROM matriculas WHERE estudiante_id = est_id AND curso_id = curso_id;
  IF existe = 0 THEN
    INSERT INTO matriculas(estudiante_id, curso_id, fecha)
    VALUES (est_id, curso_id, fecha);
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estudiante ya está matriculado en este curso';
  END IF;
END //
DELIMITER ;

```

2. Ejecutar el procedimiento para inscribir al estudiante con ID 1 en el curso con ID 2.

```sql
CALL inscribir_estudiante(4, 5, '2025-09-01');
```

3. Eliminar el procedimiento.


```sql
DROP PROCEDURE IF EXISTS inscribir_estudiante;
```

---

## 🪞 Parte 4: Vistas

1. Crear una vista llamada `resumen_matriculas` que muestre:
   - Nombre del estudiante
   - Nombre del curso
   - Nombre del profesor
   - Fecha de matrícula

```sql
CREATE VIEW resumen_matricula as select e.nombre as estudiante_nombre, c.nombre as curso_nombre, p.nombre as profesor_nombre, m.fecha from matriculas as m join estudiantes as e on m.estudiante_id=e.id join cursos as c on m.curso_id=c.id join profesores as p on c.profesor_id=p.id;
```

2. Consultar los datos desde la vista, mostrando nombre del estudiante y curso.

```sql
select estudiante_nombre, curso_nombre, profesor_nombre from resumen_matricula;
+-------------------+----------------------+-----------------+
| estudiante_nombre | curso_nombre         | profesor_nombre |
+-------------------+----------------------+-----------------+
| Mara Lpez         | lgebra Lineal        | Dra. Ana Torres |
| Luca Fernndez     | lgebra Lineal        | Dra. Ana Torres |
| Mara Lpez         | Clculo I             | Dra. Ana Torres |
| Carlos Ruiz       | Clculo I             | Dra. Ana Torres |
| Juan Prez         | Programacin I        | Dr. Luis Gmez   |
| Carlos Ruiz       | Programacin I        | Dr. Luis Gmez   |
| Carlos Ruiz       | Estructuras de Datos | Dr. Luis Gmez   |
| Juan Prez         | Estructuras de Datos | Dr. Luis Gmez   |
| Luca Fernndez     | Mecnica Clsica       | Dra. Marta Daz  |
| Juan Prez         | Mecnica Clsica       | Dra. Marta Daz  |
+-------------------+----------------------+-----------------+
```

3. Eliminar la vista.

```sql
Drop view if exists estudiante_nombre;
```

---

## 🧮 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `promedio_creditos_por_anio` que reciba un año como parámetro y devuelva el promedio de créditos matriculados por estudiante ese año.

```sql
DELIMITER //
CREATE FUNCTION promedio_creditos_por_anio(anio int)
returns decimal(5,2)
Deterministic
READS SQL DATA
BEGIN
    DECLARE promedio_creditos decimal(5,2);
    select avg(c.creditos) into promedio_creditos from cursos as c join matriculas as m on c.id = m.curso_id where year(m.fecha)=anio;
   
    return promedio_creditos;

END //

DELIMITER ;
```

2. Ejecutar la función para el año 2023.

```sql
select promedio_creditos_por_anio(2022);
+----------------------------------+
| promedio_creditos_por_anio(2022) |
+----------------------------------+
|                             5.00 |
+----------------------------------+
```

3. Eliminar la función.

```sql
drop function promedio_creditos_por_anio;
```

---

## 📂 Parte 6: Índices

1. Crear un índice en la columna `fecha` de la tabla `matriculas`.

```sql
create index idx_fecha on matriculas(fecha);
```

2. Crear un índice compuesto en la tabla `matriculas` sobre `estudiante_id` y `curso_id`.

```sql
create index idx_compuesto on matriculas(estudiante_id, curso_id)
```

3. Consultar los índices de la tabla `matriculas`.

```sql
 show index from matriculas;
+------------+------------+---------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name      | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+---------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| matriculas |          0 | PRIMARY       |            1 | id            | A         |           8 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| matriculas |          1 | curso_id      |            1 | curso_id      | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| matriculas |          1 | idx_fecha     |            1 | fecha         | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| matriculas |          1 | idx_compuesto |            1 | estudiante_id | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| matriculas |          1 | idx_compuesto |            2 | curso_id      | A         |           8 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+---------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

```

4. Eliminar ambos índices.

```sql
drop index idx_compuesto on matriculas;
drop index idx_fecha on matriculas;
```

---

## 🕵️ Parte 7: Trigger de Auditoría

1. Crear una tabla llamada `auditoria_matriculas` que registre:
   - Tipo de operación (INSERT)
   - ID del estudiante
   - ID del curso
   - Fecha y hora de la operación
   - Usuario que realizó la acción

```sql

```

2. Crear un trigger `AFTER INSERT` sobre `matriculas` que inserte un registro en `auditoria_matriculas` al realizar una matrícula.

```sql
DELIMITER //
CREATE TRIGGER trigger_auditoria_matriculas
AFTER INSERT ON matriculas
for each row
BEGIN
  INSERT INTO auditoria_matriculas(operacion, estudiante_id, curso_id, fecha_hora, usuario)
  VALUES ('INSERT', NEW.estudiante_id, NEW.curso_id, NOW(), CURRENT_USER());
END;
Delimiter ; 
```

3. Consultar los registros de la auditoría.

```sql
CREATE TABLE auditoria_matriculas (
  operacion VARCHAR(10),
  estudiante_id INT,
  curso_id INT,
  fecha_hora DATETIME,
  usuario VARCHAR(100)
);
INSERT INTO matriculas VALUES
(11, 1, 1, '2021-09-01');

 select * from auditoria_matriculas;
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
| 11 |             1 |        1 | 2021-09-01 |
+----+---------------+----------+------------+
```

4. Eliminar el trigger y la tabla de auditoría.

```sql
Drop trigger trigger_auditoria_matriculas;
drop table auditoria_matriculas;
```

## Referencias

- [Procedimientos en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/PROCEDIMIENTOS.md).
- [Funciones en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/FUNCIONES.md).
- [Vistas en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-6/Vistas.md).
- [Triggers en MySql](https://github.com/jpexposito/code-learn/blob/main/primero/bae/unidad-7/TRIGERS.md).

</div>