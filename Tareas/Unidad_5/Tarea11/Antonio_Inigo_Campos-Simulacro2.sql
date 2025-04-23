-- 1. Consultas Básicas (8 consultas - 1.6 puntos)
-- Listar todos los libros disponibles
 select * from libro where disponible = 1;
 /*
 *
    +----+-----------------------------------+------------------------+-----------------+-----------------+------------+
    | id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
    +----+-----------------------------------+------------------------+-----------------+-----------------+------------+
    | 1  | El Quijote                        | Miguel de Cervantes    | Clásico         | 1605            | 1          |
    | 3  | 1984                              | George Orwell          | Ciencia ficción | 1949            | 1          |
    | 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
    | 7  | Ficciones                         | Jorge Luis Borges      | Cuentos         | 1944            | 1          |
    | 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
    +----+-----------------------------------+------------------------+-----------------+-----------------+------------+
 */

-- Mostrar socios de Madrid ordenados por apellido
select * from socio where ciudad ='Madrid' order by apellido1;
/*
*
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid | 2023-02-18 | B         |
+----+--------+-----------+-----------+--------+------------+-----------+
*/

-- Libros publicados después de 1950
select * from libro where año_publicacion > 1950;
/*
*
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad              | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
| 6  | Rayuela                           | Julio Cortázar         | Experimental    | 1963            | 0          |
| 8  | Los pilares de la Tierra          | Ken Follett            | Histórica       | 1989            | 0          |
| 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
| 10 | La casa de los espíritus          | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
*/

-- Bibliotecarios con más de 3 años de antigüedad
select * from bibliotecario where antiguedad > 3;
/*
*
+----+-----------+-----------+-----------+------------+
| id |  nombre   | apellido1 | apellido2 | antiguedad |
+----+-----------+-----------+-----------+------------+
| 1  | Daniel    | Vázquez   | Gil       | 5          |
| 4  | Lucía     | Reyes     | Martín    | 7          |
| 6  | Isabel    | Morales   | Iglesias  | 4          |
| 7  | Francisco | Santana   | Méndez    | 6          |
+----+-----------+-----------+-----------+------------+
*/

-- Préstamos realizados en 2023
select * from prestamo where fecha_prestamo regexp '^2023';
/*
*
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 1  | 2023-01-10     | 2023-01-24       | 1        | 2        |
| 2  | 2023-02-15     | 2023-03-01       | 3        | 4        |
| 3  | 2023-03-20     |                  | 5        | 6        |
| 4  | 2023-04-05     | 2023-04-19       | 2        | 8        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 6  | 2023-01-22     | 2023-02-05       | 6        | 2        |
| 7  | 2023-02-18     | 2023-03-04       | 7        | 4        |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 9  | 2023-04-10     | 2023-04-24       | 9        | 8        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 11 | 2023-01-05     | 2023-01-19       | 1        | 1        |
| 12 | 2023-02-10     | 2023-02-24       | 2        | 3        |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 14 | 2023-04-20     | 2023-05-04       | 4        | 7        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
*/

-- Socios sin segundo apellido
select * from socio where apellido2 is null;
/*
*
+----+----------+-----------+-----------+-----------+------------+-----------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+----------+-----------+-----------+-----------+------------+-----------+
| 3  | Ana      | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 9  | Patricia | Romero    |           | Barcelona | 2023-01-15 | A         |
+----+----------+-----------+-----------+-----------+------------+-----------+

*/

-- Libros del género "Realismo mágico"
select * from libro where genero = 'Realismo mágico';
/*
*
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| id |          titulo          |         autor          |     genero      | año_publicacion | disponible |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad     | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 10 | La casa de los espíritus | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
*/

-- Préstamos no devueltos (fecha_devolucion IS NULL)
select * from prestamo where fecha_devolucion is null;
/*
*
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 3  | 2023-03-20     |                  | 5        | 6        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
*/

-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (sin JOIN)
select s.nombre, l.titulo from prestamo as p, socio as s, libro as l where p.id_socio = s.id and p.id_libro = l.id;
/*
*
+----------+-----------------------------------+
|  nombre  |              titulo               |
+----------+-----------------------------------+
| Laura    | Cien años de soledad              |
| Ana      | Orgullo y prejuicio               |
| Elena    | Rayuela                           |
| Carlos   | Los pilares de la Tierra          |
| David    | La casa de los espíritus          |
| Javier   | Cien años de soledad              |
| Sofía    | Orgullo y prejuicio               |
| Miguel   | Rayuela                           |
| Patricia | Los pilares de la Tierra          |
| Antonio  | La casa de los espíritus          |
| Laura    | El Quijote                        |
| Carlos   | 1984                              |
| Ana      | La sombra del viento              |
| David    | Ficciones                         |
| Elena    | El amor en los tiempos del cólera |
+----------+-----------------------------------+
*/

-- Libros prestados a socios de Barcelona (sin JOIN)
select l.titulo from prestamo as p, socio as s, libro as l where p.id_socio = s.id and p.id_libro = l.id and s.ciudad = 'Barcelona';
/*
*
+--------------------------+
|          titulo          |
+--------------------------+
| Los pilares de la Tierra |
| Los pilares de la Tierra |
| 1984                     |
+--------------------------+
*/

-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
select s.* from prestamo as p, socio as s, libro as l where p.id_socio = s.id and p.id_libro = l.id and l.titulo = 'Cien años de soledad';
/*
*
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 6  | Javier | Ruiz      | Moreno    | Bilbao | 2020-07-22 | A         |
+----+--------+-----------+-----------+--------+------------+-----------+
*/

-- Bibliotecarios que han gestionado préstamos (sin JOIN)
No se puede realizar esta consulta, ya que no hay una relación directa entre bibliotecarios y préstamos en la tabla de préstamos. 

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
select * from prestamo where julianday(fecha_devolucion) - julianday(fecha_prestamo) > 14 and fecha_devolucion is not null;
/*
*
Todos los libros han sido devueltos a tiempo.
*/


-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)
select s.* from socio as s where not exists (select * from prestamo as p where p.id_socio = s.id);
/*
*
Todos los socios han tomado prestado al menos un libro.
*/


-- Libros más prestados (sin JOIN)
select l.titulo, count(p.id_libro) as veces_prestado from libro as l, prestamo as p where l.id = p.id_libro group by l.titulo order by veces_prestado desc;
/*
*
+-----------------------------------+----------------+
|              titulo               | veces_prestado |
+-----------------------------------+----------------+
| Rayuela                           | 2              |
| Orgullo y prejuicio               | 2              |
| Los pilares de la Tierra          | 2              |
| La casa de los espíritus          | 2              |
| Cien años de soledad              | 2              |
| La sombra del viento              | 1              |
| Ficciones                         | 1              |
| El amor en los tiempos del cólera | 1              |
| El Quijote                        | 1              |
| 1984                              | 1              |
+-----------------------------------+----------------+
*/

-- Autores cuyos libros han sido prestados (sin JOIN)
select distinct l.autor from libro as l, prestamo as p where l.id=p.id_libro;
/*
*
+------------------------+
|         autor          |
+------------------------+
| Gabriel García Márquez |
| Jane Austen            |
| Julio Cortázar         |
| Ken Follett            |
| Isabel Allende         |
| Miguel de Cervantes    |
| George Orwell          |
| Carlos Ruiz Zafón      |
| Jorge Luis Borges      |
+------------------------+

*/



-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (JOIN)
select s.nombre, l.titulo from prestamo as p join socio as s on p.id_socio = s.id join libro as l on p.id_libro = l.id;
/*
*
+----------+-----------------------------------+
|  nombre  |              titulo               |
+----------+-----------------------------------+
| Laura    | Cien años de soledad              |
| Ana      | Orgullo y prejuicio               |
| Elena    | Rayuela                           |
| Carlos   | Los pilares de la Tierra          |
| David    | La casa de los espíritus          |
| Javier   | Cien años de soledad              |
| Sofía    | Orgullo y prejuicio               |
| Miguel   | Rayuela                           |
| Patricia | Los pilares de la Tierra          |
| Antonio  | La casa de los espíritus          |
| Laura    | El Quijote                        |
| Carlos   | 1984                              |
| Ana      | La sombra del viento              |
| David    | Ficciones                         |
| Elena    | El amor en los tiempos del cólera |
+----------+-----------------------------------+
*/

-- Libros prestados a socios de Barcelona (JOIN)
select l.titulo from prestamo as p join socio as s on p.id_socio = s.id join libro as l on p.id_libro = l.id where s.ciudad = 'Barcelona';
/*
*
+--------------------------+
|          titulo          |
+--------------------------+
| Los pilares de la Tierra |
| Los pilares de la Tierra |
| 1984                     |
+--------------------------+

*/

-- Socios que han tomado prestado "Cien años de soledad" (JOIN)
select s.* from prestamo as p join socio as s on p.id_socio = s.id join libro as l on p.id_libro = l.id where l.titulo = 'Cien años de soledad';
/*
*
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 6  | Javier | Ruiz      | Moreno    | Bilbao | 2020-07-22 | A         |
+----+--------+-----------+-----------+--------+------------+-----------+
*/

-- Bibliotecarios que han gestionado préstamos (JOIN)
No se puede realizar esta consulta, ya que no hay una relación directa entre bibliotecarios y préstamos en la tabla de préstamos.
/*
*

*/

-- Préstamos con datos completos (socio, libro, bibliotecario)
no se puede realizar esta consulta, ya que no hay una relación directa entre bibliotecarios y préstamos en la tabla de préstamos.
/*
*

*/

-- Socios con sus préstamos activos (JOIN)
select s.*, p.* from socio as s join prestamo as p on s.id = p.id_socio where p.fecha_devolucion is null;
/*
*
+----+---------+-----------+-----------+----------+------------+-----------+----+----------------+------------------+----------+----------+
| id | nombre  | apellido1 | apellido2 |  ciudad  | fecha_alta | categoria | id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+---------+-----------+-----------+----------+------------+-----------+----+----------------+------------------+----------+----------+
| 5  | Elena   | Martín    | Díaz      | Madrid   | 2023-02-18 | B         | 3  | 2023-03-20     |                  | 5        | 6        |
| 4  | David   | Pérez     | Gómez     | Sevilla  | 2021-11-30 | A         | 5  | 2023-05-12     |                  | 4        | 10       |
| 8  | Miguel  | Navarro   | Torres    | Málaga   | 2021-04-12 | B         | 8  | 2023-03-25     |                  | 8        | 6        |
| 10 | Antonio | Domingo   | Santos    | Valencia | 2020-12-08 | C         | 10 | 2023-05-15     |                  | 10       | 10       |
| 3  | Ana     | Sánchez   |           | Valencia | 2022-01-10 | C         | 13 | 2023-03-15     |                  | 3        | 5        |
| 5  | Elena   | Martín    | Díaz      | Madrid   | 2023-02-18 | B         | 15 | 2023-05-25     |                  | 5        | 9        |
+----+---------+-----------+-----------+----------+------------+-----------+----+----------------+------------------+----------+----------+
*/

-- Libros nunca prestados (LEFT JOIN)
select l.* from libro as l left join prestamo as p on l.id = p.id_libro where p.id_libro is null;
/*
*
Todos los libros han sido prestados al menos una vez.
*/

-- Autores con número de libros prestados (JOIN + GROUP BY)
select l.autor, count(p.id_libro) as veces_prestado from libro as l join prestamo as p on l.id = p.id_libro group by l.autor order by veces_prestado desc;
/*
*
+------------------------+----------------+
|         autor          | veces_prestado |
+------------------------+----------------+
| Gabriel García Márquez | 3              |
| Ken Follett            | 2              |
| Julio Cortázar         | 2              |
| Jane Austen            | 2              |
| Isabel Allende         | 2              |
| Miguel de Cervantes    | 1              |
| Jorge Luis Borges      | 1              |
| George Orwell          | 1              |
| Carlos Ruiz Zafón      | 1              |
+------------------------+----------------+
*/

-- 4. Consultas Resumen (8 consultas - 2.4 puntos)
-- Número de socios por ciudad
select ciudad, count(*) as num_socios from socio group by ciudad;
/*
*
+-----------+------------+
|  ciudad   | num_socios |
+-----------+------------+
| Barcelona | 2          |
| Bilbao    | 1          |
| Madrid    | 2          |
| Málaga    | 1          |
| Sevilla   | 1          |
| Valencia  | 2          |
| Zaragoza  | 1          |
+-----------+------------+

*/

-- Promedio de antigüedad de bibliotecarios
select avg(antiguedad) as promedio_antiguedad from bibliotecario;
/*
*
+---------------------+
| promedio_antiguedad |
+---------------------+
| 3.75                |
+---------------------+
*/

-- Cantidad de préstamos por mes en 2023
select count(*) as num_prestamos from prestamo where fecha_prestamo regexp '^2023' 
/*
*
+---------------+
| num_prestamos |
+---------------+
| 15            |
+---------------+
*/

-- Libros más populares (por veces prestados)
select l.titulo, count(p.id_libro) as veces_prestado from libro as l join prestamo as p on l.id = p.id_libro group by l.titulo order by veces_prestado desc;
/*
*
+-----------------------------------+----------------+
|              titulo               | veces_prestado |
+-----------------------------------+----------------+
| Rayuela                           | 2              |
| Orgullo y prejuicio               | 2              |
| Los pilares de la Tierra          | 2              |
| La casa de los espíritus          | 2              |
| Cien años de soledad              | 2              |
| La sombra del viento              | 1              |
| Ficciones                         | 1              |
| El amor en los tiempos del cólera | 1              |
| El Quijote                        | 1              |
| 1984                              | 1              |
+-----------------------------------+----------------+

*/

-- Socios más activos (por préstamos realizados)
select s.nombre, count(p.id_socio) as num_prestamos from socio as s join prestamo as p on s.id = p.id_socio group by s.nombre order by num_prestamos desc;
/*
*
+----------+---------------+
|  nombre  | num_prestamos |
+----------+---------------+
| Laura    | 2             |
| Elena    | 2             |
| David    | 2             |
| Carlos   | 2             |
| Ana      | 2             |
| Sofía    | 1             |
| Patricia | 1             |
| Miguel   | 1             |
| Javier   | 1             |
| Antonio  | 1             |
+----------+---------------+
*/

-- Porcentaje de libros disponibles
select round(100 * sum(disponible)/count(*), 2) as porcentaje_disponibles from libro;
/*
*
+------------------------+
| porcentaje_disponibles |
+------------------------+
| 50.0                   |
+------------------------+
*/


-- Días promedio de préstamo
select avg(julianday(fecha_devolucion) - julianday(fecha_prestamo)) as dias_promedio from prestamo where fecha_devolucion is not null;
/*
*
+---------------+
| dias_promedio |
+---------------+
| 14.0          |
+---------------+
*/

-- Número de préstamos por categoría de socio
select categoria, count(*) as num_prestamos from socio s join prestamo p on s.id = p.id_socio group by categoria;
/*
*
+-----------+---------------+
| categoria | num_prestamos |
+-----------+---------------+
| A         | 6             |
| B         | 5             |
| C         | 4             |
+-----------+---------------+
*/

-- 5. Subconsultas (8 consultas - 1.2 puntos)

-- Socios que han prestado libros de Gabriel García Márquez
select distinct s.* from socio as s where exists (select * from prestamo as p join libro as l on p.id_libro = l.id where p.id_socio = s.id and l.autor = 'Gabriel García Márquez');
/*
*

*/

-- Libros con préstamos superiores al promedio
select l.* from libro as l where (select count(*) from prestamo as p where p.id_libro = l.id) > (select avg(num_prestamos) from (select count(*) as num_prestamos from prestamo group by id_libro) as subquery);
/*
*
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid | 2023-02-18 | B         |
| 6  | Javier | Ruiz      | Moreno    | Bilbao | 2020-07-22 | A         |
+----+--------+-----------+-----------+--------+------------+-----------+
*/

-- Socios con todos los préstamos devueltos a tiempo
select s.* from socio as s where not exists (select * from prestamo as p where p.id_socio = s.id and julianday(p.fecha_devolucion) > julianday(p.fecha_prestamo) + 14);
/*
*
+----+----------+-----------+-----------+-----------+------------+-----------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+----------+-----------+-----------+-----------+------------+-----------+
| 1  | Laura    | García    | Martínez  | Madrid    | 2020-03-15 | A         |
| 2  | Carlos   | López     | Fernández | Barcelona | 2021-05-20 | B         |
| 3  | Ana      | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 4  | David    | Pérez     | Gómez     | Sevilla   | 2021-11-30 | A         |
| 5  | Elena    | Martín    | Díaz      | Madrid    | 2023-02-18 | B         |
| 6  | Javier   | Ruiz      | Moreno    | Bilbao    | 2020-07-22 | A         |
| 7  | Sofía    | Hernández | Jiménez   | Zaragoza  | 2022-09-05 | C         |
| 8  | Miguel   | Navarro   | Torres    | Málaga    | 2021-04-12 | B         |
| 9  | Patricia | Romero    |           | Barcelona | 2023-01-15 | A         |
| 10 | Antonio  | Domingo   | Santos    | Valencia  | 2020-12-08 | C         |
+----+----------+-----------+-----------+-----------+------------+-----------+
*/

-- Bibliotecarios que no han gestionado préstamos
No se puede realizar esta consulta, ya que no hay una relación directa entre bibliotecarios y préstamos en la tabla de préstamos.
/*
*

*/

-- Socios que han prestado más libros que el promedio
select s.* from socio as s where (select count(*) from prestamo as p where p.id_socio = s.id) > (select avg(num_prestamos) from (select count(*) as num_prestamos from prestamo group by id_socio));
/*
*
+----+--------+-----------+-----------+-----------+------------+-----------+
| id | nombre | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+--------+-----------+-----------+-----------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid    | 2020-03-15 | A         |
| 2  | Carlos | López     | Fernández | Barcelona | 2021-05-20 | B         |
| 3  | Ana    | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 4  | David  | Pérez     | Gómez     | Sevilla   | 2021-11-30 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid    | 2023-02-18 | B         |
+----+--------+-----------+-----------+-----------+------------+-----------+
*/

-- Libros disponibles que nunca han sido prestados
select l.* from libro as l where l.disponible = 1 and not exists (select * from prestamo as p where p.id_libro = l.id);
/*
*
Todos los libros han sido prestados al menos una vez.
*/

-- Socios con préstamos en todas las categorías de libros
select s.* from socio as s join prestamo as p on s.id = p.id_socio join libro as l on p.id_libro = l.id group by s.id having count(distinct l.genero) = (select count(distinct genero) from libro);
/*
*
No hay socios que hayan tomado prestados libros de todas las categorías.
*/

-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid
No se puede realizar esta consulta, ya que no hay una relación directa entre bibliotecarios y préstamos en la tabla de préstamos.