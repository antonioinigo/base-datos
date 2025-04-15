-- ----------------------------------------
-- Consultas sobre una tabla
-- 0,2 puntos la correcta. Total = 1,4 puntos
-- ----------------------------------------

-- 1.- Devuelve un listado con todos las compras que se han realizado. Las compras deben estar ordenados
-- por la fecha de realización, mostrando en primer lugar las compras más recientes.
select * from compra order by fecha desc;
/*
*
+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 10 | 250.45  | 2018-06-27 | 8             | 2                |
+----+---------+------------+---------------+------------------+
*
*/
-- 2. Devuelve todos los datos de los dos compras de mayor valor.
select * from compra order by total desc limit 2;
/*
*
+----+--------+------------+---------------+------------------+
| id | total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+------------+---------------+------------------+
| 7  | 5760.0 | 2018-09-10 | 2             | 1                |
| 12 | 3045.6 | 2020-04-25 | 2             | 1                |
+----+--------+------------+---------------+------------------+
*/
-- 3. Devuelve un listado con los identificadores de los consumidores que han realizado algún compra.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select * from compra where fecha regexp '^2020' and total > 500;
/*
*
+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
+----+---------+------------+---------------+------------------+
*/
-- 4. Devuelve un listado de todos las compras que se realizaron durante el año 2020,
-- cuya cantidad total sea superior a 500€.
select * from compra where fecha regexp '^2020' and total > 500;
/*
*
+----+---------+------------+---------------+------------------+
| id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+---------+------------+---------------+------------------+
| 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                |
+----+---------+------------+---------------+------------------+
*/
-- 5. Devuelve un listado con el nombre y los apellidos de los suministradores que tienen una comisión entre 0.11 y 0.15.
select nombre, apellido1 from suministrador where categoria between 0.11 and 0.15;
/*
*
+---------+-----------+
| nombre  | apellido1 |
+---------+-----------+
| Daniel  | Sáez      |
| Juan    | Gómez     |
| Diego   | Flores    |
| Marta   | Herrera   |
| Antonio | Carretero |
| Manuel  | Domínguez |
| Antonio | Vega      |
+---------+-----------+
*/
-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla suministrador.
select MAX(categoria) from suministrador;
/*
*
+----------------+
| MAX(categoria) |
+----------------+
| 0.15           |
+----------------+
*/
-- 7. Devuelve el identificador, nombre y primer apellido de aquellos consumidores cuyo segundo apellido no es NULL.
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select nombre, apellido1 from consumidor where apellido2 not null order by apellido1, nombre;
/*
*
+-----------+-----------+
|  nombre   | apellido1 |
+-----------+-----------+
| Marcos    | Loyola    |
| Guillermo | López     |
| Aarón     | Rivero    |
| Adolfo    | Rubio     |
| Pepe      | Ruiz      |
| Adela     | Salas     |
| Daniel    | Santana   |
| María     | Santana   |
+-----------+-----------+
*/


-- (Consultas Multitabla Where)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total =  2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1, c.apellido2 from consumidor as c, compra as co where c.id=co.id_consumidor order by nombre, apellido1;
/*
*
+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 1  | Aarón  | Rivero    | Gómez     |
| 2  | Adela  | Salas     | Díaz      |
| 3  | Adolfo | Rubio     | Flores    |
| 4  | Adrián | Suárez    |           |
| 5  | Marcos | Loyola    | Méndez    |
| 6  | María  | Santana   | Moreno    |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
+----+--------+-----------+-----------+
*/
-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, co.* from compra as co, consumidor as c where c.id=co.id_consumidor order by c.nombre, c.apellido1;
/*
*
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
*/
-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select co.*, s.* from compra as co, suministrador as s where co.id_suministrador= s.id order by s.nombre, s.apellido1;
/*
*
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
*/
-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select c.*, co.*, s.* from compra as co, consumidor as c, suministrador as s where c.id=co.id_consumidor and co.id_suministrador=s.id order by c.nombre, c.apellido1;
/*
*
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
*/
-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from compra as co, consumidor as c where c.id=co.id_consumidor and co.fecha regexp '^2020' and co.total between 300 and 1000;
/*
*
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
*/
-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select s.nombre, s.apellido1, s.apellido2 from suministrador as s, compra as co, consumidor as c where c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno' and c.id = co.id_consumidor and s.id = co.id_suministrador;
/*
*
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+
*/
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.
 select c.nombre from suministrador as s, compra as co, consumidor as c where s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega' and c.id = co.id_consumidor and s.id = co.id_suministrador;
 /*
*
+--------+
| nombre |
+--------+
| Adela  |
| Pilar  |
| Adela  |
| Adela  |
| María  |
| María  |
+--------+
*/

-- (Consultas Multitabla Join)
-- -----------------------------------------------
-- 0,3 puntos la correcta. Total = 2,1 puntos
-- -----------------------------------------------

-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los consumidores que han realizado algún compra.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select distinct c.id, c.nombre, c.apellido1, c.apellido2 from consumidor as c join compra as co on c.id=co.id_consumidor order by c.nombre, c.apellido1;
/*
*
+----+--------+-----------+-----------+
| id | nombre | apellido1 | apellido2 |
+----+--------+-----------+-----------+
| 1  | Aarón  | Rivero    | Gómez     |
| 2  | Adela  | Salas     | Díaz      |
| 3  | Adolfo | Rubio     | Flores    |
| 4  | Adrián | Suárez    |           |
| 5  | Marcos | Loyola    | Méndez    |
| 6  | María  | Santana   | Moreno    |
| 8  | Pepe   | Ruiz      | Santana   |
| 7  | Pilar  | Ruiz      |           |
+----+--------+-----------+-----------+
*/
-- 2. Devuelve un listado que muestre todos las compras que ha realizado cada consumidor. 
-- El resultado debe mostrar todos los datos de las compras y del consumidor. El listado debe mostrar los datos de los consumidores ordenados alfabéticamente.
select c.*, co.* from compra as co join consumidor as c on c.id=co.id_consumidor order by c.nombre, c.apellido1;
/*
*
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+
*/
-- 3. Devuelve un listado que muestre todos las compras en los que ha participado un suministrador.
-- El resultado debe mostrar todos los datos de las compras y de los suministradores.
-- El listado debe mostrar los datos de los suministradores ordenados alfabéticamente.
select co.*, s.* from compra as co join suministrador as s on co.id_suministrador= s.id order by s.nombre, s.apellido1;
/*
*
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
*/
-- 4. Devuelve un listado que muestre todos los consumidores, con todos las compras que han realizado 
-- y con los datos de los suministradores asociados a cada compra.
select c.*, co.*, s.* from compra as co join consumidor as c on c.id=co.id_consumidor join suministrador as s on co.id_suministrador=s.id order by c.nombre, c.apellido1;
/*
*
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria | id |  total  |   fecha    | id_consumidor | id_suministrador | id | nombre  | apellido1 | apellido2 | categoria |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 2  | 270.65  | 2019-09-10 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 15 | 370.85  | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 1  | Aarón  | Rivero    | Gómez     | Almería | 100       | 16 | 2389.23 | 2022-03-11 | 1             | 5                | 5  | Antonio | Carretero | Ortega    | 0.12      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 3  | 65.26   | 2020-10-05 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 7  | 5760.0  | 2018-09-10 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 2  | Adela  | Salas     | Díaz      | Granada | 200       | 12 | 3045.6  | 2020-04-25 | 2             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 3  | Adolfo | Rubio     | Flores    | Sevilla |           | 11 | 75.29   | 2019-08-17 | 3             | 7                | 7  | Antonio | Vega      | Hernández | 0.11      |
| 4  | Adrián | Suárez    |           | Jaén    | 300       | 8  | 1983.43 | 2020-10-10 | 4             | 6                | 6  | Manuel  | Domínguez | Hernández | 0.13      |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 1  | 150.5   | 2020-10-05 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       | 5  | 948.5   | 2020-09-10 | 5             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 13 | 545.75  | 2022-01-25 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 6  | María  | Santana   | Moreno    | Cádiz   | 100       | 14 | 145.82  | 2020-02-02 | 6             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 4  | 110.5   | 2019-08-17 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 9  | 2480.4  | 2019-10-10 | 8             | 3                | 3  | Diego   | Flores    | Salas     | 0.11      |
| 8  | Pepe   | Ruiz      | Santana   | Huelva  | 200       | 10 | 250.45  | 2018-06-27 | 8             | 2                | 2  | Juan    | Gómez     | López     | 0.13      |
| 7  | Pilar  | Ruiz      |           | Sevilla | 300       | 6  | 2400.6  | 2019-07-27 | 7             | 1                | 1  | Daniel  | Sáez      | Vega      | 0.15      |
+----+--------+-----------+-----------+---------+-----------+----+---------+------------+---------------+------------------+----+---------+-----------+-----------+-----------+

*/
-- 5. Devuelve un listado de todos los consumidores que realizaron un compra durante el año 2020,
-- cuya cantidad esté entre 300 € y 1000 €.
select c.* from compra as co join consumidor as c on c.id=co.id_consumidor where co.fecha regexp '^2020' and co.total between 300 and 1000;
/*
*
+----+--------+-----------+-----------+---------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad  | categoria |
+----+--------+-----------+-----------+---------+-----------+
| 5  | Marcos | Loyola    | Méndez    | Almería | 200       |
+----+--------+-----------+-----------+---------+-----------+
*/
-- 6. Devuelve el nombre y los apellidos de todos los suministradores que ha participado en algún compra realizado por María Santana Moreno.
select s.nombre, s.apellido1, s.apellido2 from suministrador as s join compra as co on c.id = co.id_consumidor join consumidor as c on s.id = co.id_suministrador where c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';
/*
*
+--------+-----------+-----------+
| nombre | apellido1 | apellido2 |
+--------+-----------+-----------+
| Daniel | Sáez      | Vega      |
| Daniel | Sáez      | Vega      |
+--------+-----------+-----------+

*/
-- 7. Devuelve el nombre de todos los consumidores que han realizado algún compra con el suministrador Daniel Sáez Vega.ç´ñl gjfz s90
select c.nombre from suministrador as s join compra as co on s.id = co.id_suministrador join consumidor as c on c.id = co.id_consumidor where s.nombre = 'Daniel' AND s.apellido1 = 'Sáez' AND s.apellido2 = 'Vega';
/*
*
+--------+
| nombre |
+--------+
| Adela  |
| Pilar  |
| Adela  |
| Adela  |
| María  |
| María  |
+--------+

*/

-- ---------------------------
-- Consultas resumen (funciones)
-- -----------------------------------------------
-- 0,2 puntos la correcta. (1-6) 1,2 puntos
-- 0,25 puntos la correcta. (7-10) 1 punto.
-- Total = 2,2 puntos
-- -----------------------------------------------

-- 1. Calcula la cantidad media de todos las compras que aparecen en la tabla compra.
select avg(total) as cantidad_media from compra;
/*
*
+----------------+
| cantidad_media |
+----------------+
| 1312.051875    |
+----------------+

*/
-- 2. Calcula el número total de suministradores distintos que aparecen en la tabla compra.
 select count(id) from suministrador;
 /*
*
+-----------+
| count(id) |
+-----------+
| 8         |
+-----------+

*/
-- 3. Calcula el número total de consumidores que aparecen en la tabla consumidor.
select count(id) from consumidor;
/*
*
+-----------+
| count(id) |
+-----------+
| 10        |
+-----------+
*/
-- 4. Calcula cuál es la mayor cantidad que aparece en la tabla compra.
select max(total) from compra;
/*
*
+------------+
| max(total) |
+------------+
| 5760.0     |
+------------+
*/
-- 5. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla consumidor.
select max(categoria) from consumidor;
/*
*
+----------------+
| max(categoria) |
+----------------+
| 300            |
+----------------+

*/
-- 6. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores.
-- Es decir, el mismo consumidor puede haber realizado varios compras de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el compra de máximo valor para cada uno de los días en los que un consumidor ha realizado un compra.
-- Muestra el identificador del consumidor, nombre, apellidos, la fecha y el valor de la cantidad.
select c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, max(co.total) from consumidor as c join compra as co on c.id = co.id_consumidor group by co.fecha;
/*
*
+----+--------+-----------+-----------+------------+---------------+
| id | nombre | apellido1 | apellido2 |   fecha    | max(co.total) |
+----+--------+-----------+-----------+------------+---------------+
| 8  | Pepe   | Ruiz      | Santana   | 2018-06-27 | 250.45        |
| 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
| 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
| 8  | Pepe   | Ruiz      | Santana   | 2019-08-17 | 110.5         |
| 1  | Aarón  | Rivero    | Gómez     | 2019-09-10 | 270.65        |
| 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
| 6  | María  | Santana   | Moreno    | 2020-02-02 | 145.82        |
| 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
| 5  | Marcos | Loyola    | Méndez    | 2020-09-10 | 948.5         |
| 5  | Marcos | Loyola    | Méndez    | 2020-10-05 | 150.5         |
| 4  | Adrián | Suárez    |           | 2020-10-10 | 1983.43       |
| 6  | María  | Santana   | Moreno    | 2022-01-25 | 545.75        |
| 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
+----+--------+-----------+-----------+------------+---------------+
*/
-- 7. Calcula cuál es el máximo valor de las compras realizadas durante el mismo día para cada uno de los consumidores,
-- teniendo en cuenta que sólo queremos mostrar aquellas compras que superen la cantidad de 2000 €.
 select c.id, c.nombre, c.apellido1, c.apellido2, co.fecha, max(co.total) from consumidor as c join compra as co on c.id = co.id_consumidor where co.total > 2000 group by c.id, co.fecha;
 /*
*
+----+--------+-----------+-----------+------------+---------------+
| id | nombre | apellido1 | apellido2 |   fecha    | max(co.total) |
+----+--------+-----------+-----------+------------+---------------+
| 1  | Aarón  | Rivero    | Gómez     | 2022-03-11 | 2389.23       |
| 2  | Adela  | Salas     | Díaz      | 2018-09-10 | 5760.0        |
| 2  | Adela  | Salas     | Díaz      | 2020-04-25 | 3045.6        |
| 7  | Pilar  | Ruiz      |           | 2019-07-27 | 2400.6        |
| 8  | Pepe   | Ruiz      | Santana   | 2019-10-10 | 2480.4        |
+----+--------+-----------+-----------+------------+---------------+
*/
-- 8. Calcula el máximo valor de las compras realizadas para cada uno de los suministradores durante la fecha 2020-08-17.
-- Muestra el identificador del suministrador, nombre, apellidos y total.
select s.id, s.nombre, s.apellido1, s.apellido2, co.fecha, max(co.total) from suministrador as s join compra as co on s.id = co.id_suministrador where co.fecha regexp '2020-08-17' group by s.id;
/*
* No hay ninguna compra con esa fecha
*/
-- 9. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores.
-- Tenga en cuenta que pueden existir consumidores que no han realizado ninguna compra.
-- Estos consumidores también deben aparecer en el listado indicando que el número de compras realizadas es 0.
select c.id, c.nombre, c.apellido1, c.apellido2, count(co.id) from consumidor as c join compra as co on c.id = co.id_consumidor  group by c.id;
/*
*
+----+--------+-----------+-----------+--------------+
| id | nombre | apellido1 | apellido2 | count(co.id) |
+----+--------+-----------+-----------+--------------+
| 1  | Aarón  | Rivero    | Gómez     | 3            |
| 2  | Adela  | Salas     | Díaz      | 3            |
| 3  | Adolfo | Rubio     | Flores    | 1            |
| 4  | Adrián | Suárez    |           | 1            |
| 5  | Marcos | Loyola    | Méndez    | 2            |
| 6  | María  | Santana   | Moreno    | 2            |
| 7  | Pilar  | Ruiz      |           | 1            |
| 8  | Pepe   | Ruiz      | Santana   | 3            |
+----+--------+-----------+-----------+--------------+
*/
-- 10. Devuelve un listado con el identificador de consumidor, nombre y apellidos y el número total de compras que ha realizado cada uno de consumidores durante el año 2020.
 select c.id, c.nombre, c.apellido1, c.apellido2, count(co.id) from consumidor as c join compra as co on c.id = co.id_consumidor where co.fecha regexp '^2020'  group by c.id;
 /*
*
+----+--------+-----------+-----------+--------------+
| id | nombre | apellido1 | apellido2 | count(co.id) |
+----+--------+-----------+-----------+--------------+
| 2  | Adela  | Salas     | Díaz      | 2            |
| 4  | Adrián | Suárez    |           | 1            |
| 5  | Marcos | Loyola    | Méndez    | 2            |
| 6  | María  | Santana   | Moreno    | 1            |
+----+--------+-----------+-----------+--------------+

*/
-- ---------------------
-- Subconsultas
-- -----------------------------------------------
-- 0,2 puntos la correcta (1-5).
-- 0,3 puntos la correcta (6-9).
-- Total = 2,2 puntos
-- -----------------------------------------------

--- Con operadores básicos de comparación

-- 1. Devuelve un listado con todos las compras que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select * from compra where id_consumidor = (select id from consumidor where nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');
/*
*
+----+--------+------------+---------------+------------------+
| id | total  |   fecha    | id_consumidor | id_suministrador |
+----+--------+------------+---------------+------------------+
| 3  | 65.26  | 2020-10-05 | 2             | 1                |
| 7  | 5760.0 | 2018-09-10 | 2             | 1                |
| 12 | 3045.6 | 2020-04-25 | 2             | 1                |
+----+--------+------------+---------------+------------------+
*/
-- 2. Devuelve la fecha y la cantidad del compra de menor valor realizado por el cliente Pepe Ruiz Santana.
select co.fecha, min(co.total) from compra as co join consumidor as c on co.id_consumidor= c.id where c.nombre = 'Pepe' and c.apellido1 = 'Ruiz' and c.apellido2 = 'Santana';
/*
*
+------------+---------------+
|   fecha    | min(co.total) |
+------------+---------------+
| 2019-08-17 | 110.5         |
+------------+---------------+
*/
-- 3. Devuelve el número de compras en los que ha participado el suministrador Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select count(id) from compra where id = (select id from suministrador where nombre = 'Daniel' and  apellido1 = 'Sáez' and apellido2 = 'Vega');
/*
*
+-----------+
| count(id) |
+-----------+
| 1         |
+-----------+
*/
-- 4. Devuelve los datos del consumidor que realizó el compra más caro en el año 2021. (Sin utilizar INNER JOIN)
 select * from consumidor where id = (select id_consumidor from compra where fecha regexp '^2020' order by fecha desc limit 1);
 /*
*
*/
-- 5. Devuelve un listado con los datos de los consumidores y las compras, de todos los consumidores que han realizado un compra durante el año 2020 con un valor mayor o igual al valor medio de las compras realizadas durante ese mismo año.
select c.*, co.* from consumidor as c join compra as co on c.id = co.id_consumidor where fecha regexp '^2020' and co.total >= (select avg(total) from compra where fecha regexp '^2020');
/*
*
+----+--------+-----------+-----------+--------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | categoria |
+----+--------+-----------+-----------+--------+-----------+
| 4  | Adrián | Suárez    |           | Jaén   | 300       |
+----+--------+-----------+-----------+--------+-----------+
*/
-- 6. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from consumidor where id not in (select id_consumidor from compra);
/*
*
+----+-----------+-----------+-----------+---------+-----------+
| id |  nombre   | apellido1 | apellido2 | ciudad  | categoria |
+----+-----------+-----------+-----------+---------+-----------+
| 9  | Guillermo | López     | Gómez     | Granada | 225       |
| 10 | Daniel    | Santana   | Loyola    | Sevilla | 125       |
+----+-----------+-----------+-----------+---------+-----------+
*/
-- 7. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando IN o NOT IN).
select * from suministrador where id not in (select id_suministrador from compra);
/*
*
+----+---------+-----------+-----------+-----------+
| id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+-----------+-----------+-----------+
| 4  | Marta   | Herrera   | Gil       | 0.14      |
| 8  | Alfredo | Ruiz      | Flores    | 0.05      |
+----+---------+-----------+-----------+-----------+
*/
-- 8. Devuelve un listado de los consumidores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select * from consumidor as c where not exists (select 1 from compra as co where co.id_suministrador = c.id);
/*
*
+----+-----------+-----------+-----------+---------+-----------+
| id |  nombre   | apellido1 | apellido2 | ciudad  | categoria |
+----+-----------+-----------+-----------+---------+-----------+
| 4  | Adrián    | Suárez    |           | Jaén    | 300       |
| 8  | Pepe      | Ruiz      | Santana   | Huelva  | 200       |
| 9  | Guillermo | López     | Gómez     | Granada | 225       |
| 10 | Daniel    | Santana   | Loyola    | Sevilla | 125       |
+----+-----------+-----------+-----------+---------+-----------+
*/
-- 9. Devuelve un listado de los suministradores que no han realizado ningún compra. (Utilizando EXISTS o NOT EXISTS).
select * from suministrador as s where not exists (select 1 from compra as co where co.id_suministrador = s.id);
/*
*
+----+---------+-----------+-----------+-----------+
| id | nombre  | apellido1 | apellido2 | categoria |
+----+---------+-----------+-----------+-----------+
| 4  | Marta   | Herrera   | Gil       | 0.14      |
| 8  | Alfredo | Ruiz      | Flores    | 0.05      |
+----+---------+-----------+-----------+-----------+
*/