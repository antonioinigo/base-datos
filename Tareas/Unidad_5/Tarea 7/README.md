## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Creo una base de datos con las siguientes tablas

```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS concesionario;

-- Usar la base de datos
USE concesionario;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);


CREATE TABLE IF NOT EXISTS coches (
    id_coche INTEGER PRIMARY KEY,
    modelo TEXT,
    marca TEXT,
    año INTEGER,
    precio REAL
);



CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_coche INTEGER,
    fecha_venta DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_coche) REFERENCES coches(id_coche)
);



INSERT INTO clientes (nombre, edad, direccion) VALUES
    ('Juan Pérez', 30, 'Calle A #123'),
    ('María Gómez', 25, 'Avenida B #456'),
    ('Carlos López', 35, 'Calle C #789'),
    ('Ana Martínez', 28, 'Avenida D #101'),
    ('Pedro Rodríguez', 40, 'Calle E #234'),
    ('Laura Sánchez', 32, 'Avenida F #567'),
    ('Miguel González', 27, 'Calle G #890'),
    ('Isabel Díaz', 38, 'Avenida H #111'),
    ('Francisco Ruiz', 33, 'Calle I #222'),
    ('Elena Torres', 29, 'Avenida J #333');


INSERT INTO coches (modelo, marca, año, precio) VALUES
    ('Sedán 2022', 'Toyota', 2022, 25000.00),
    ('Hatchback 2021', 'Honda', 2021, 22000.00),
    ('SUV 2023', 'Ford', 2023, 30000.00),
    ('Coupé 2022', 'Chevrolet', 2022, 28000.00),
    ('Camioneta 2023', 'Nissan', 2023, 32000.00),
    ('Compacto 2021', 'Volkswagen', 2021, 20000.00),
    ('Híbrido 2022', 'Hyundai', 2022, 27000.00),
    ('Deportivo 2023', 'Mazda', 2023, 35000.00),
    ('Pickup 2022', 'Ram', 2022, 31000.00),
    ('Eléctrico 2021', 'Tesla', 2021, 40000.00);

INSERT INTO ventas (id_cliente, id_coche, fecha_venta) VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-25'),
    (4, 4, '2023-04-10'),
    (5, 5, '2023-05-05'),
    (6, 6, '2023-06-15'),
    (7, 7, '2023-07-20'),
    (8, 8, '2023-08-25'),
    (10, 10, '2023-10-05');
```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 concesionario.db
``` 

### Paso 3: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.

-- Cosas que debo de tener en cuenta:
Se debe tener en cuenta las 3 tablas y como enlazar dos join.

-- ¿Qué me están pidiendo?. 
 El modelo y precio de los coches vendidos.
 El nombre del cliente que compró cada coche.

 -- ¿Qué es lo que no me han pedido?
No piden la fecha de venta.
No piden la marca del coche.
No piden los coches no vendidos.



```sql
select c.*, cl.* from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------+----------------+------------+------+---------+------------+-----------------+------+----------------+
    | id_coche |     modelo     |   marca    | año  | precio  | id_cliente |     nombre      | edad |   direccion    |
    +----------+----------------+------------+------+---------+------------+-----------------+------+----------------+
    | 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 | 1          | Juan Pérez      | 30   | Calle A #123   |
    | 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 | 2          | María Gómez     | 25   | Avenida B #456 |
    | 3        | SUV 2023       | Ford       | 2023 | 30000.0 | 3          | Carlos López    | 35   | Calle C #789   |
    | 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 | 4          | Ana Martínez    | 28   | Avenida D #101 |
    | 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 | 5          | Pedro Rodríguez | 40   | Calle E #234   |
    | 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 | 6          | Laura Sánchez   | 32   | Avenida F #567 |
    | 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 | 7          | Miguel González | 27   | Calle G #890   |
    | 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 | 8          | Isabel Díaz     | 38   | Avenida H #111 |
    | 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 | 10         | Elena Torres    | 29   | Avenida J #333 |
    +----------+----------------+------------+------+---------+------------+-----------------+------+----------------+

    
</br>
</details>
</br>

- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.

-- Cosas que debo de tener en cuenta:

- Precios superiores.

- Obtener la media. AVG(precio)

```sql
select cl.nombre, c.modelo, c.precio from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where c.precio > (select avg(precio) from coches);
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+----------------+---------+
    |     nombre      |     modelo     | precio  |
    +-----------------+----------------+---------+
    | Carlos López    | SUV 2023       | 30000.0 |
    | Pedro Rodríguez | Camioneta 2023 | 32000.0 |
    | Isabel Díaz     | Deportivo 2023 | 35000.0 |
    | Elena Torres    | Eléctrico 2021 | 40000.0 |
    +-----------------+----------------+---------+
    
</br>
</details>
</br>

-   Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

-- Cosas que debo de tener en cuenta:
- Coches que han sido vendidos.
- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
```sql
select modelo, precio from coches where id_coche not in (select id_coche from ventas);
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+---------+
    |   modelo    | precio  |
    +-------------+---------+
    | Pickup 2022 | 31000.0 |
    +-------------+---------+
    
</br>
</details>
</br>

- Calcular el total gastado por todos los clientes en coches:

-- Cosas que debo de tener en cuenta:
- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
```sql
select sum(precio) from ventas join coches on coches.id_coche = ventas.id_coche;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+
    | sum(precio) |
    +-------------+
    | 259000.0    |
    +-------------+
    
</br>
</details>
</br>


- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

```sql
select c.modelo, c.precio, cl.nombre, v.fecha_venta from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente order by v.fecha_venta desc;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------------+---------+-----------------+-------------+
    |     modelo     | precio  |     nombre      | fecha_venta |
    +----------------+---------+-----------------+-------------+
    | Eléctrico 2021 | 40000.0 | Elena Torres    | 2023-10-05  |
    | Deportivo 2023 | 35000.0 | Isabel Díaz     | 2023-08-25  |
    | Híbrido 2022   | 27000.0 | Miguel González | 2023-07-20  |
    | Compacto 2021  | 20000.0 | Laura Sánchez   | 2023-06-15  |
    | Camioneta 2023 | 32000.0 | Pedro Rodríguez | 2023-05-05  |
    | Coupé 2022     | 28000.0 | Ana Martínez    | 2023-04-10  |
    | SUV 2023       | 30000.0 | Carlos López    | 2023-03-25  |
    | Hatchback 2021 | 22000.0 | María Gómez     | 2023-02-20  |
    | Sedán 2022     | 25000.0 | Juan Pérez      | 2023-01-15  |
    +----------------+---------+-----------------+-------------+

    
</br>
</details>
</br>


- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
```sql
select modelo, max(precio) from coches;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------+----------------+------------+------+---------+
    | id_coche |     modelo     |   marca    | año  | precio  |
    +----------+----------------+------------+------+---------+
    | 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 |
    | 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 |
    | 3        | SUV 2023       | Ford       | 2023 | 30000.0 |
    | 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
    | 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
    | 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
    | 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
    | 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
    | 9        | Pickup 2022    | Ram        | 2022 | 31000.0 |
    | 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
    +----------+----------------+------------+------+---------+
    
</br>
</details>
</br>


- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. COUNT

```sql
select cl.nombre, count(v.id_coche) from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente group by cl.nombre;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>


    +-----------------+-------------------+
    |     nombre      | count(v.id_coche) |
    +-----------------+-------------------+
    | Ana Martínez    | 1                 |
    | Carlos López    | 1                 |
    | Elena Torres    | 1                 |
    | Isabel Díaz     | 1                 |
    | Juan Pérez      | 1                 |
    | Laura Sánchez   | 1                 |
    | María Gómez     | 1                 |
    | Miguel González | 1                 |
    | Pedro Rodríguez | 1                 |
    +-----------------+-------------------+


    
</br>
</details>
</br>


- Encontrar los clientes que han comprado coches de la marca 'Toyota':

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

```sql
 select cl.nombre, c.marca from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where c.marca = 'Toyota';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+--------+
    |   nombre   | marca  |
    +------------+--------+
    | Juan Pérez | Toyota |
    +------------+--------+
    
</br>
</details>
</br>


- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. 
```sql
select avg(cl.edad) from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where c.precio > 25000;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------------+
    |   avg(cl.edad)   |
    +------------------+
    | 32.8333333333333 |
    +------------------+

    
</br>
</details>
</br>


-  Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?.
```sql
select c.modelo, c.precio, cl.nombre, cl.edad from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where cl.edad > 30;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------------+---------+-----------------+------+
    |     modelo     | precio  |     nombre      | edad |
    +----------------+---------+-----------------+------+
    | SUV 2023       | 30000.0 | Carlos López    | 35   |
    | Camioneta 2023 | 32000.0 | Pedro Rodríguez | 40   |
    | Compacto 2021  | 20000.0 | Laura Sánchez   | 32   |
    | Deportivo 2023 | 35000.0 | Isabel Díaz     | 38   |
    +----------------+---------+-----------------+------+

</br>
</details>
</br>


- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?.
```sql
select c.modelo, v.fecha_venta, count(v.id_venta) from ventas as v join coches as c on v.id_coche = c.id_coche where v.fecha_venta regexp '^2022' group by c.modelo;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    
    No hay ventas en 2022;.
    
</br>
</details>
</br>


- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. AVG
```sql
select modelo, precio from coches where precio > (select avg(c.precio) from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where cl.edad <30);
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------------+---------+
    |     modelo     | precio  |
    +----------------+---------+
    | SUV 2023       | 30000.0 |
    | Camioneta 2023 | 32000.0 |
    | Deportivo 2023 | 35000.0 |
    | Pickup 2022    | 31000.0 |
    | Eléctrico 2021 | 40000.0 |
    +----------------+---------+
        
</br>
</details>
</br>


- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:

-- Cosas que debo de tener en cuenta:
- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
```sql
select c.marca, COUNT(v.id_venta) as total_ventas from ventas as v join coches as c on v.id_coche = c.id_coche group by c.marca order by total_ventas desc;


```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    |+------------+--------------+
    |   marca    | total_ventas |
    +------------+--------------+
    | Volkswagen | 1            |
    | Toyota     | 1            |
    | Tesla      | 1            |
    | Nissan     | 1            |
    | Mazda      | 1            |
    | Hyundai    | 1            |
    | Honda      | 1            |
    | Ford       | 1            |
    | Chevrolet  | 1            |
    +------------+--------------+

    
</br>
</details>
</br>



</div>