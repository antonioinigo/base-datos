## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Creo una base de datos con las siguientes tablas

```sql
-- Crear la base de datos
-- CREATE DATABASE IF NOT EXISTS concesionario;

-- Usar la base de datos
-- USE concesionario;

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

CREATE TABLE IF NOT EXISTS reparacion (
    id_reparación INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_coche INTEGER,
    fecha_reparación DATE,
    descripción TEXT,
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
-- Inserts para la tabla "reparación"
INSERT INTO reparacion (id_cliente, id_coche, fecha_reparación, descripción) VALUES
    (1, 1, '2023-05-15', 'Reparación de motor'),
    (2, 3, '2023-06-20', 'Cambio de neumáticos'),
    (3, 5, '2023-07-25', 'Reparación de frenos'),
    (4, 2, '2023-08-10', 'Revisión general'),
    (5, 4, '2023-09-05', 'Cambio de aceite'),
    (6, 7, '2023-10-15', 'Alineación y balanceo'),
    (7, 6, '2023-11-20', 'Reparación de sistema eléctrico'),
    (8, 8, '2023-12-25', 'Reparación de transmisión'),
    (9, 9, '2024-01-05', 'Reemplazo de bujías'),
    (10, 10, '2024-02-10', 'Reparación de sistema de refrigeración'),
    (1, 3, '2024-03-15', 'Cambio de filtro de aire'),
    (2, 2, '2024-04-20', 'Reparación de sistema de suspensión'),
    (3, 4, '2024-05-25', 'Reparación de sistema de escape'),
    (4, 5, '2024-06-10', 'Reemplazo de batería'),
    (5, 6, '2024-07-05', 'Reparación de sistema de dirección'),
    (6, 8, '2024-08-15', 'Cambio de pastillas de freno'),
    (7, 10, '2024-09-20', 'Reparación de sistema de inyección'),
    (8, 1, '2024-10-25', 'Reparación de sistema de dirección'),
    (9, 3, '2024-11-05', 'Cambio de bujías'),
    (10, 4, '2024-12-10', 'Reparación de sistema de refrigeración');

```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 concesionario.db
``` 

### Paso 3: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.


```sql
select cl.nombre, cl.edad from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where c.marca = "Toyota";
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+------+
    |   nombre   | edad |
    +------------+------+
    | Juan Pérez | 30   |
    +------------+------+

    
</br>
</details>
</br>

- Consulta para calcular el precio promedio de los coches vendidos.


```sql
select avg(c.precio) from ventas as v join coches as c on v.id_coche = c.id_coche;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------------+
    |  avg(c.precio)   |
    +------------------+
    | 28777.7777777778 |
    +------------------+
    
</br>
</details>
</br>

- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.

```sql
select cl.nombre, cl.edad from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where cl.edad < 30;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+------+
    |     nombre      | edad |
    +-----------------+------+
    | María Gómez     | 25   |
    | Ana Martínez    | 28   |
    | Miguel González | 27   |
    | Elena Torres    | 29   |
    +-----------------+------+

    
</br>
</details>
</br>

- Consulta para contar el número de coches vendidos de cada marca.

```sql
select coches.marca, COUNT(*) AS cantidad_vendidos from coches join ventas on coches.id_coche = ventas.id_coche group by coches.marca;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+-------------------+
    |   marca    | cantidad_vendidos |
    +------------+-------------------+
    | Chevrolet  | 1                 |
    | Ford       | 1                 |
    | Honda      | 1                 |
    | Hyundai    | 1                 |
    | Mazda      | 1                 |
    | Nissan     | 1                 |
    | Tesla      | 1                 |
    | Toyota     | 1                 |
    | Volkswagen | 1                 |
    +------------+-------------------+

    
</br>
</details>
</br>

- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.


```sql
select cl.nombre, cl.direccion from reparacion as r join clientes as cl on r.id_cliente = cl.id_cliente where r.fecha_reparación regexp '^2024-';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+----------------+
    |     nombre      |   direccion    |
    +-----------------+----------------+
    | Francisco Ruiz  | Calle I #222   |
    | Elena Torres    | Avenida J #333 |
    | Juan Pérez      | Calle A #123   |
    | María Gómez     | Avenida B #456 |
    | Carlos López    | Calle C #789   |
    | Ana Martínez    | Avenida D #101 |
    | Pedro Rodríguez | Calle E #234   |
    | Laura Sánchez   | Avenida F #567 |
    | Miguel González | Calle G #890   |
    | Isabel Díaz     | Avenida H #111 |
    | Francisco Ruiz  | Calle I #222   |
    | Elena Torres    | Avenida J #333 |
    +-----------------+----------------+

</br>
</details>
</br>


- Consulta para calcular el total gastado en reparaciones por cada cliente.

```sql
No se puede calcular el total gastado ya que no hay ningún dato asi en las tablas
```

**Resultado:**


</br>


- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.


```sql
select cl.nombre, cl.edad from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where c.precio > 30000;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+------+
    |     nombre      | edad |
    +-----------------+------+
    | Pedro Rodríguez | 40   |
    | Isabel Díaz     | 38   |
    | Elena Torres    | 29   |
    +-----------------+------+


</br>
</details>
</br>

- Consulta para calcular el precio medio de los coches vendidos en 2023.


```sql
 select avg(c.precio) from ventas as v join coches as c on v.id_coche = c.id_coche where v.fecha_venta regexp '^2023';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------------+
    |  avg(c.precio)   |
    +------------------+
    | 28777.7777777778 |
    +------------------+
    
</br>
</details>
</br>

- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.

```sql
select cl.nombre, cl.direccion from ventas as v join clientes as cl on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where c.marca = "Ford";
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------------+--------------+
    |    nombre    |  direccion   |
    +--------------+--------------+
    | Carlos López | Calle C #789 |
    +--------------+--------------+

    
</br>
</details>
</br>

- Consulta para contar el número de coches vendidos por año.

```sql
select SUBSTR(fecha_venta, 1, 4) as año, count(*) from ventas group by año;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------+----------+
    | año  | count(*) |
    +------+----------+
    | 2023 | 9        |
    +------+----------+

</br>
</details>
</br>

- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.

```sql
select distinct cl.nombre, cl.edad from clientes as cl join ventas as v on cl.id_cliente = v.id_cliente join coches as c on v.id_coche = c.id_coche join reparacion as r on cl.id_cliente = r.id_cliente where c.precio > 30000;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    
    +-----------------+------+
    |     nombre      | edad |
    +-----------------+------+
    | Pedro Rodríguez | 40   |
    | Isabel Díaz     | 38   |
    | Elena Torres    | 29   |
    +-----------------+------+

    
</br>
</details>
</br>

- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.

```sql
select sum(c.precio) from ventas as v join clientes as cl  on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche where cl.edad < 30;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------------+
    | total_precio |
    +--------------+
    | 117000.0     |
    +--------------+
        
</br>
</details>
</br>

- Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.

```sql
select distinct c.modelo, c.año from coches as c join ventas as v on c.id_coche = v.id_coche join reparacion as r on c.id_coche = r.id_coche where c.año regexp '^2023';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>


    +----------------+------+
    |     modelo     | año  |
    +----------------+------+
    | SUV 2023       | 2023 |
    | Camioneta 2023 | 2023 |
    | Deportivo 2023 | 2023 |
    +----------------+------+

    
</br>
</details>
</br>

- Consulta para contar el número de coches vendidos por cliente.

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

- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.

```sql
select c.modelo, c.precio from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where cl.edad > 35;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------------+---------+
    |     modelo     | precio  |
    +----------------+---------+
    | Camioneta 2023 | 32000.0 |
    | Deportivo 2023 | 35000.0 |
    +----------------+---------+

    
</br>
</details>
</br>

- Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).

```sql
select sum(c.precio) from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where cl.direccion regexp '^Calle';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +---------------+
    | sum(c.precio) |
    +---------------+
    | 114000.0      |
    +---------------+

    
</br>
</details>
</br>

- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.

```sql
select distinct cl.nombre, cl.edad from clientes as cl join ventas as v on cl.id_cliente = v.id_cliente join coches as c on v.id_coche = c.id_coche join reparacion as r on cl.id_cliente = r.id_cliente where c.precio > 30000 and r.fecha_reparación regexp '^2024'
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+------+
    |     nombre      | edad |
    +-----------------+------+
    | Pedro Rodríguez | 40   |
    | Isabel Díaz     | 38   |
    | Elena Torres    | 29   |
    +-----------------+------+

    
</br>
</details>
</br>

- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.

```sql
 select avg(c.precio) from ventas as v join clientes as cl  on v.id_cliente = cl.id_cliente join coches as c on v.id_coche = c.id_coche join reparacion as r on v.id_cliente = r.id_cliente where cl.edad < 30 and v.fecha_venta regexp '^2023';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +---------------+
    | avg(c.precio) |
    +---------------+
    | 29250.0       |
    +---------------+

    
</br>
</details>
</br>

- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".

```sql
select c.modelo, c.año from ventas as v join coches as c on v.id_coche = c.id_coche join clientes as cl on v.id_cliente = cl.id_cliente where cl.direccion regexp '^Avenida';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----------------+------+
    |     modelo     | año  |
    +----------------+------+
    | Hatchback 2021 | 2021 |
    | Coupé 2022     | 2022 |
    | Compacto 2021  | 2021 |
    | Deportivo 2023 | 2023 |
    | Eléctrico 2021 | 2021 |
    +----------------+------+

    
</br>
</details>
</br>

- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.

```sql
select cl.nombre, count(*) from reparacion as r join clientes as cl on r.id_cliente = cl.id_cliente where r.fecha_reparación regexp '^2024' group by cl.nombre;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------------+----------+
    |     nombre      | count(*) |
    +-----------------+----------+
    | Ana Martínez    | 1        |
    | Carlos López    | 1        |
    | Elena Torres    | 2        |
    | Francisco Ruiz  | 2        |
    | Isabel Díaz     | 1        |
    | Juan Pérez      | 1        |
    | Laura Sánchez   | 1        |
    | María Gómez     | 1        |
    | Miguel González | 1        |
    | Pedro Rodríguez | 1        |
    +-----------------+----------+

    
</br>
</details>
</br>



</div>