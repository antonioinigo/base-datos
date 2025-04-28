## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Creo una base de datos con las siguientes tablas

```sql
-- Crear la tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE
);

-- Crear la tabla de Productos
CREATE TABLE IF NOT EXISTS Productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL
);

-- Crear la tabla de Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

INSERT INTO Clientes (nombre, email) VALUES
    ('Juan Pérez', 'juan@example.com'),
    ('María Gómez', 'maria@example.com'),
    ('Carlos López', 'carlos@example.com'),
    ('Ana Rodríguez', 'ana@example.com'),
    ('Luisa Martínez', 'luisa@example.com'),
    ('Pedro Sánchez', 'pedro@example.com'),
    ('Laura García', 'laura@example.com'),
    ('Miguel Martín', 'miguel@example.com'),
    ('Elena González', 'elena@example.com'),
    ('David Torres', 'david@example.com'),
    ('Sofía Ruiz', 'sofia@example.com'),
    ('Javier López', 'javier@example.com'),
    ('Carmen Vargas', 'carmen@example.com'),
    ('Daniel Muñoz', 'daniel@example.com'),
    ('Isabel Serrano', 'isabel@example.com'),
    ('Alejandro Muñoz', 'alejandro@example.com'),
    ('Raquel Herrera', 'raquel@example.com'),
    ('Francisco Mora', 'francisco@example.com'),
    ('Marina Díaz', 'marina@example.com'),
    ('Antonio Jiménez', 'antonio@example.com'),
    ('Beatriz Romero', 'beatriz@example.com'),
    ('Carlos Gómez', 'carlos.gomez@example.com'),
    ('Clara Sánchez', 'clara.sanchez@example.com'),
    ('Andrés Martínez', 'andres@example.com'),
    ('Lucía Díaz', 'lucia@example.com'),
    ('Mario Serrano', 'mario@example.com'),
    ('Eva Torres', 'eva.torres@example.com'),
    ('Roberto Ruiz', 'roberto@example.com'),
    ('Celia García', 'celia@example.com');

INSERT INTO Productos (nombre, precio) VALUES
    ('Laptop', 1200.00),
    ('Smartphone', 699.99),
    ('TV LED', 799.50),
    ('Tablet', 299.99),
    ('Auriculares Bluetooth', 79.99),
    ('Impresora', 199.99),
    ('Cámara Digital', 499.99),
    ('Reproductor de Audio', 149.99),
    ('Altavoces Inalámbricos', 129.99),
    ('Reloj Inteligente', 249.99),
    ('Teclado Inalámbrico', 59.99),
    ('Ratón Óptico', 29.99),
    ('Monitor LED', 349.99),
    ('Mochila para Portátil', 49.99),
    ('Disco Duro Externo', 89.99),
    ('Router Wi-Fi', 69.99),
    ('Lámpara LED', 39.99),
    ('Batería Externa', 19.99),
    ('Estuche para Auriculares', 14.99),
    ('Tarjeta de Memoria', 24.99),
    ('Cargador Inalámbrico', 34.99),
    ('Kit de Limpieza para Computadoras', 9.99),
    ('Funda para Tablet', 19.99),
    ('Soporte para Teléfono', 14.99),
    ('Hub USB', 29.99),
    ('Webcam HD', 59.99),
    ('Funda para Laptop', 29.99),
    ('Adaptador HDMI', 12.99);
INSERT INTO Pedidos (id_cliente, id_producto, cantidad, fecha_pedido) VALUES
    (1, 1, 2, '2024-02-01'),
    (2, 2, 1, '2024-02-02'),
    (3, 3, 3, '2024-02-03'),
    (4, 4, 1, '2024-02-04'),
    (5, 5, 2, '2024-02-05'),
    (6, 6, 1, '2024-02-06'),
    (7, 7, 3, '2024-02-07'),
    (8, 8, 2, '2024-02-08'),
    (9, 9, 1, '2024-02-09'),
    (10, 10, 2, '2024-02-10'),
    (11, 11, 1, '2024-02-11'),
    (12, 12, 3, '2024-02-12'),
    (13, 13, 1, '2024-02-13'),
    (14, 14, 2, '2024-02-14'),
    (15, 15, 1, '2024-02-15'),
    (16, 16, 3, '2024-02-16'),
    (17, 17, 2, '2024-02-17'),
    (18, 18, 1, '2024-02-18'),
    (19, 19, 2, '2024-02-19'),
    (20, 20, 1, '2024-02-20'),
    (21, 21, 3, '2024-02-21'),
    (22, 22, 1, '2024-02-22'),
    (23, 23, 2, '2024-02-23'),
    (24, 24, 1, '2024-02-24'),
    (25, 25, 3, '2024-02-25'),
    (26, 26, 2, '2024-02-26'),
    (27, 27, 1, '2024-02-27'),
    (28, 28, 2, '2024-02-28'),
    (29, 29, 1, '2024-02-29'),
    (30, 30, 3, '2024-03-01');

```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 tarea6.db 
``` 

### Paso 3: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Obtener todos los clientes.
```sql
select * from Clientes;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    
</br>
</details>
</br>

- Obtener la cantidad total de productos en todos los pedidos
```sql
select SUM(cantidad) from Pedidos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +---------------+
    | SUM(cantidad) |
    +---------------+
    | 54            |
    +---------------+
    
</br>
</details>
</br>

-  Obtener el precio promedio de los productos:
```sql
select avg(precio) from Productos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------------+
    |   avg(precio)    |
    +------------------+
    | 188.294285714286 |
    +------------------+
    
</br>
</details>
</br>

- Obtener los clientes que tienen un email válido (contiene '@'):
```sql
select * from Clientes where email REGEXP '@';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    
</br>
</details>
</br>


- Obtener el producto más caro.
```sql
select * from Productos order by precio desc limit 1;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------+--------+
    | id | nombre | precio |
    +----+--------+--------+
    | 1  | Laptop | 1200.0 |
    +----+--------+--------+

    
</br>
</details>
</br>


- Obtener los pedidos realizados en febrero de 2024.
```sql
select * from Pedidos where fecha_pedido regexp '^2024-02';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 1         | 1          | 1           | 2        | 2024-02-01   |
    | 2         | 2          | 2           | 1        | 2024-02-02   |
    | 3         | 3          | 3           | 3        | 2024-02-03   |
    | 4         | 4          | 4           | 1        | 2024-02-04   |
    | 5         | 5          | 5           | 2        | 2024-02-05   |
    | 6         | 6          | 6           | 1        | 2024-02-06   |
    | 7         | 7          | 7           | 3        | 2024-02-07   |
    | 8         | 8          | 8           | 2        | 2024-02-08   |
    | 9         | 9          | 9           | 1        | 2024-02-09   |
    | 10        | 10         | 10          | 2        | 2024-02-10   |
    | 11        | 11         | 11          | 1        | 2024-02-11   |
    | 12        | 12         | 12          | 3        | 2024-02-12   |
    | 13        | 13         | 13          | 1        | 2024-02-13   |
    | 14        | 14         | 14          | 2        | 2024-02-14   |
    | 15        | 15         | 15          | 1        | 2024-02-15   |
    | 16        | 16         | 16          | 3        | 2024-02-16   |
    | 17        | 17         | 17          | 2        | 2024-02-17   |
    | 18        | 18         | 18          | 1        | 2024-02-18   |
    | 19        | 19         | 19          | 2        | 2024-02-19   |
    | 20        | 20         | 20          | 1        | 2024-02-20   |
    | 21        | 21         | 21          | 3        | 2024-02-21   |
    | 22        | 22         | 22          | 1        | 2024-02-22   |
    | 23        | 23         | 23          | 2        | 2024-02-23   |
    | 24        | 24         | 24          | 1        | 2024-02-24   |
    | 25        | 25         | 25          | 3        | 2024-02-25   |
    | 26        | 26         | 26          | 2        | 2024-02-26   |
    | 27        | 27         | 27          | 1        | 2024-02-27   |
    | 28        | 28         | 28          | 2        | 2024-02-28   |
    | 29        | 29         | 29          | 1        | 2024-02-29   |
    +-----------+------------+-------------+----------+--------------+
    
</br>
</details>
</br>


- Obtener la cantidad total de productos en todos los pedidos por producto.
```sql
select Id_producto, SUM(cantidad) as total_vendido from Pedidos group by id_producto;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+---------------+
    | id_producto | total_vendido |
    +-------------+---------------+
    | 1           | 2             |
    | 2           | 1             |
    | 3           | 3             |
    | 4           | 1             |
    | 5           | 2             |
    | 6           | 1             |
    | 7           | 3             |
    | 8           | 2             |
    | 9           | 1             |
    | 10          | 2             |
    | 11          | 1             |
    | 12          | 3             |
    | 13          | 1             |
    | 14          | 2             |
    | 15          | 1             |
    | 16          | 3             |
    | 17          | 2             |
    | 18          | 1             |
    | 19          | 2             |
    | 20          | 1             |
    | 21          | 3             |
    | 22          | 1             |
    | 23          | 2             |
    | 24          | 1             |
    | 25          | 3             |
    | 26          | 2             |
    | 27          | 1             |
    | 28          | 2             |
    | 29          | 1             |
    | 30          | 3             |
    +-------------+---------------+

    
</br>
</details>
</br>


- Obtener los clientes que han realizado más de un pedido.
```sql
select c.id, c.nombre, count(p.id_pedido) as total_pedidos from Clientes as c join Pedidos as p on c.id = p.id_cliente group by c.id, c.nombre having count(p.id_pedido) > 1;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

   No ha clientes que hayan realizado más de un pedido.
    
</br>
</details>
</br>


- Obtener los productos que tienen un precio registrado.
```sql
select * from productos where precio > 0;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 2  | Smartphone                        | 699.99 |
    | 3  | TV LED                            | 799.5  |
    | 4  | Tablet                            | 299.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 6  | Impresora                         | 199.99 |
    | 7  | Cámara Digital                    | 499.99 |
    | 8  | Reproductor de Audio              | 149.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 10 | Reloj Inteligente                 | 249.99 |
    | 11 | Teclado Inalámbrico               | 59.99  |
    | 12 | Ratón Óptico                      | 29.99  |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 15 | Disco Duro Externo                | 89.99  |
    | 16 | Router Wi-Fi                      | 69.99  |
    | 17 | Lámpara LED                       | 39.99  |
    | 18 | Batería Externa                   | 19.99  |
    | 19 | Estuche para Auriculares          | 14.99  |
    | 20 | Tarjeta de Memoria                | 24.99  |
    | 21 | Cargador Inalámbrico              | 34.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 23 | Funda para Tablet                 | 19.99  |
    | 24 | Soporte para Teléfono             | 14.99  |
    | 25 | Hub USB                           | 29.99  |
    | 26 | Webcam HD                         | 59.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    | 28 | Adaptador HDMI                    | 12.99  |
    +----+-----------------------------------+--------+
    
</br>
</details>
</br>


-  Obtener la fecha del primer pedido realizado:
```sql
 select min(fecha_pedido) from pedidos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------------+
    | min(fecha_pedido) |
    +-------------------+
    | 2024-02-01        |
    +-------------------+

</br>
</details>
</br>


- Obtener los productos cuyos nombres comienzan con 'A' o 'B':
```sql
select * from productos where nombre regexp '^[AB]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+--------+
    | id |         nombre         | precio |
    +----+------------------------+--------+
    | 5  | Auriculares Bluetooth  | 79.99  |
    | 9  | Altavoces Inalámbricos | 129.99 |
    | 18 | Batería Externa        | 19.99  |
    | 28 | Adaptador HDMI         | 12.99  |
    +----+------------------------+--------+

    
</br>
</details>
</br>


- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql
select id_cliente, sum(cantidad) from pedidos group by id_cliente order by id_cliente;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+---------------+
    | id_cliente | sum(cantidad) |
    +------------+---------------+
    | 1          | 2             |
    | 2          | 1             |
    | 3          | 3             |
    | 4          | 1             |
    | 5          | 2             |
    | 6          | 1             |
    | 7          | 3             |
    | 8          | 2             |
    | 9          | 1             |
    | 10         | 2             |
    | 11         | 1             |
    | 12         | 3             |
    | 13         | 1             |
    | 14         | 2             |
    | 15         | 1             |
    | 16         | 3             |
    | 17         | 2             |
    | 18         | 1             |
    | 19         | 2             |
    | 20         | 1             |
    | 21         | 3             |
    | 22         | 1             |
    | 23         | 2             |
    | 24         | 1             |
    | 25         | 3             |
    | 26         | 2             |
    | 27         | 1             |
    | 28         | 2             |
    | 29         | 1             |
    | 30         | 3             |
    +------------+---------------+
        
</br>
</details>
</br>


- Obtener los clientes que han realizado más de un pedido en febrero de 2024.
```sql
select id_cliente, count(*) as pedidos_realizados from pedidos where fecha_pedido regexp '^2024-02' group by id_cliente having count(*) > 1;

```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>
    Todos los clientes hicieron un solo pedido en febrero.
    
</br>
</details>
</br>


- Obtener los productos con precio entre 100 y 500.
```sql
select * from productos where precio between 100 and 500;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+--------+
    | id |         nombre         | precio |
    +----+------------------------+--------+
    | 4  | Tablet                 | 299.99 |
    | 6  | Impresora              | 199.99 |
    | 7  | Cámara Digital         | 499.99 |
    | 8  | Reproductor de Audio   | 149.99 |
    | 9  | Altavoces Inalámbricos | 129.99 |
    | 10 | Reloj Inteligente      | 249.99 |
    | 13 | Monitor LED            | 349.99 |
    +----+------------------------+--------+

    
</br>
</details>
</br>


- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente
```sql
select id_cliente, sum(cantidad) from Pedidos group by id_cliente order by sum(cantidad) desc;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+---------------+
    | id_cliente | sum(cantidad) |
    +------------+---------------+
    | 30         | 3             |
    | 25         | 3             |
    | 21         | 3             |
    | 16         | 3             |
    | 12         | 3             |
    | 7          | 3             |
    | 3          | 3             |
    | 28         | 2             |
    | 26         | 2             |
    | 23         | 2             |
    | 19         | 2             |
    | 17         | 2             |
    | 14         | 2             |
    | 10         | 2             |
    | 8          | 2             |
    | 5          | 2             |
    | 1          | 2             |
    | 29         | 1             |
    | 27         | 1             |
    | 24         | 1             |
    | 22         | 1             |
    | 20         | 1             |
    | 18         | 1             |
    | 15         | 1             |
    | 13         | 1             |
    | 11         | 1             |
    | 9          | 1             |
    | 6          | 1             |
    | 4          | 1             |
    | 2          | 1             |
    +------------+---------------+
        
</br>
</details>
</br>


- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
```sql
select * from clientes where nombre regexp 'a';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+

    
</br>
</details>
</br>


- Obtener el precio máximo de los productos.
```sql
select max(precio) from productos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+
    | max(precio) |
    +-------------+
    | 1200.0      |
    +-------------+
    
</br>
</details>
</br>


- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
```sql
select * from pedidos where id_cliente = 1 and fecha_pedido regexp '^2024-02';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 1         | 1          | 1           | 2        | 2024-02-01   |
    +-----------+------------+-------------+----------+--------------+
    
</br>
</details>
</br>


-  Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
```sql
 select id_producto, sum(cantidad) from Pedidos group by id_producto order by sum(cantidad) desc;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+---------------+
    | id_producto | sum(cantidad) |
    +-------------+---------------+
    | 30          | 3             |
    | 25          | 3             |
    | 21          | 3             |
    | 16          | 3             |
    | 12          | 3             |
    | 7           | 3             |
    | 3           | 3             |
    | 28          | 2             |
    | 26          | 2             |
    | 23          | 2             |
    | 19          | 2             |
    | 17          | 2             |
    | 14          | 2             |
    | 10          | 2             |
    | 8           | 2             |
    | 5           | 2             |
    | 1           | 2             |
    | 29          | 1             |
    | 27          | 1             |
    | 24          | 1             |
    | 22          | 1             |
    | 20          | 1             |
    | 18          | 1             |
    | 15          | 1             |
    | 13          | 1             |
    | 11          | 1             |
    | 9           | 1             |
    | 6           | 1             |
    | 4           | 1             |
    | 2           | 1             |
    +-------------+---------------+

    
</br>
</details>
</br>


- Obtener los productos que no tienen un precio registrado.
```sql
 select * from productos where precio is null;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

   
    Todos los productos tienen precio registrado.
    
</br>
</details>
</br>


- Obtener la fecha del último pedido realizado.
```sql
select * from pedidos where fecha_pedido = (select max(fecha_pedido) from pedidos);
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 30        | 30         | 30          | 3        | 2024-03-01   |
    +-----------+------------+-------------+----------+--------------+
    
</br>
</details>
</br>


- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
```sql
select * from clientes where length(nombre) >= 5;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 8  | Miguel Martín   | miguel@example.com        |
    | 9  | Elena González  | elena@example.com         |
    | 10 | David Torres    | david@example.com         |
    | 11 | Sofía Ruiz      | sofia@example.com         |
    | 12 | Javier López    | javier@example.com        |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 14 | Daniel Muñoz    | daniel@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 18 | Francisco Mora  | francisco@example.com     |
    | 19 | Marina Díaz     | marina@example.com        |
    | 20 | Antonio Jiménez | antonio@example.com       |
    | 21 | Beatriz Romero  | beatriz@example.com       |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 26 | Mario Serrano   | mario@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    | 28 | Roberto Ruiz    | roberto@example.com       |
    | 29 | Celia García    | celia@example.com         |
    +----+-----------------+---------------------------+
    
</br>
</details>
</br>


- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
```sql
select * from productos where nombre regexp 'o';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 2  | Smartphone                        | 699.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 6  | Impresora                         | 199.99 |
    | 8  | Reproductor de Audio              | 149.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 10 | Reloj Inteligente                 | 249.99 |
    | 11 | Teclado Inalámbrico               | 59.99  |
    | 12 | Ratón Óptico                      | 29.99  |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 15 | Disco Duro Externo                | 89.99  |
    | 16 | Router Wi-Fi                      | 69.99  |
    | 20 | Tarjeta de Memoria                | 24.99  |
    | 21 | Cargador Inalámbrico              | 34.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 24 | Soporte para Teléfono             | 14.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    | 28 | Adaptador HDMI                    | 12.99  |
    +----+-----------------------------------+--------+
</br>
</details>
</br>


- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql
select id_cliente, sum(cantidad) from Pedidos group by id_cliente order by id_cliente;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+---------------+
    | id_cliente | sum(cantidad) |
    +------------+---------------+
    | 1          | 2             |
    | 2          | 1             |
    | 3          | 3             |
    | 4          | 1             |
    | 5          | 2             |
    | 6          | 1             |
    | 7          | 3             |
    | 8          | 2             |
    | 9          | 1             |
    | 10         | 2             |
    | 11         | 1             |
    | 12         | 3             |
    | 13         | 1             |
    | 14         | 2             |
    | 15         | 1             |
    | 16         | 3             |
    | 17         | 2             |
    | 18         | 1             |
    | 19         | 2             |
    | 20         | 1             |
    | 21         | 3             |
    | 22         | 1             |
    | 23         | 2             |
    | 24         | 1             |
    | 25         | 3             |
    | 26         | 2             |
    | 27         | 1             |
    | 28         | 2             |
    | 29         | 1             |
    | 30         | 3             |
    +------------+---------------+
    
</br>
</details>
</br>


- Obtener los clientes cuyos nombres no contienen la letra 'i':
```sql
select * from clientes where nombre not regexp 'i';

```


**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 3  | Carlos López    | carlos@example.com        |
    | 4  | Ana Rodríguez   | ana@example.com           |
    | 6  | Pedro Sánchez   | pedro@example.com         |
    | 7  | Laura García    | laura@example.com         |
    | 9  | Elena González  | elena@example.com         |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 16 | Alejandro Muñoz | alejandro@example.com     |
    | 17 | Raquel Herrera  | raquel@example.com        |
    | 22 | Carlos Gómez    | carlos.gomez@example.com  |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    | 25 | Lucía Díaz      | lucia@example.com         |
    | 27 | Eva Torres      | eva.torres@example.com    |
    +----+-----------------+---------------------------+

        
        
</br>
</details>
</br>


- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
```sql
select * from pedidos where id_cliente = 2 and fecha_pedido regexp '^2024-02';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-----------+------------+-------------+----------+--------------+
    | id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
    +-----------+------------+-------------+----------+--------------+
    | 2         | 2          | 2           | 1        | 2024-02-02   |
    +-----------+------------+-------------+----------+--------------+
    
</br>
</details>
</br>


- Obtener el precio mínimo de los productos.
```sql
select min(precio) from productos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +-------------+
    | min(precio) |
    +-------------+
    | 9.99        |
    +-------------+

        
</br>
</details>
</br>


- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
```sql
select id_cliente,fecha_pedido from pedidos where fecha_pedido regexp '^2024-02' group by id_cliente;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+--------------+
    | id_cliente | fecha_pedido |
    +------------+--------------+
    | 1          | 2024-02-01   |
    | 2          | 2024-02-02   |
    | 3          | 2024-02-03   |
    | 4          | 2024-02-04   |
    | 5          | 2024-02-05   |
    | 6          | 2024-02-06   |
    | 7          | 2024-02-07   |
    | 8          | 2024-02-08   |
    | 9          | 2024-02-09   |
    | 10         | 2024-02-10   |
    | 11         | 2024-02-11   |
    | 12         | 2024-02-12   |
    | 13         | 2024-02-13   |
    | 14         | 2024-02-14   |
    | 15         | 2024-02-15   |
    | 16         | 2024-02-16   |
    | 17         | 2024-02-17   |
    | 18         | 2024-02-18   |
    | 19         | 2024-02-19   |
    | 20         | 2024-02-20   |
    | 21         | 2024-02-21   |
    | 22         | 2024-02-22   |
    | 23         | 2024-02-23   |
    | 24         | 2024-02-24   |
    | 25         | 2024-02-25   |
    | 26         | 2024-02-26   |
    | 27         | 2024-02-27   |
    | 28         | 2024-02-28   |
    | 29         | 2024-02-29   |
    +------------+--------------+

    
</br>
</details>
</br>

- Obtener la fecha del último pedido realizado por el cliente con ID 3.
```sql
select id_cliente, max(fecha_pedido) from pedidos where id_cliente = 3;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------+-------------------+
    | id_cliente | max(fecha_pedido) |
    +------------+-------------------+
    | 3          | 2024-02-03        |
    +------------+-------------------+
    
</br>
</details>
</br>


- Obtener los productos que tienen una 'a' al final del nombre.
```sql
select * from productos where nombre regexp 'a$';
```
***DUDA***
**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------------------+--------+
    | id |       nombre       | precio |
    +----+--------------------+--------+
    | 6  | Impresora          | 199.99 |
    | 18 | Batería Externa    | 19.99  |
    | 20 | Tarjeta de Memoria | 24.99  |
    +----+--------------------+--------+
    
</br>
</details>
</br>

- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
```sql
 select * from clientes where nombre regexp '([aeiouAEIUO].*){4}';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+------------------------+
    | id |     nombre      |         email          |
    +----+-----------------+------------------------+
    | 4  | Ana Rodríguez   | ana@example.com        |
    | 5  | Luisa Martínez  | luisa@example.com      |
    | 7  | Laura García    | laura@example.com      |
    | 8  | Miguel Martín   | miguel@example.com     |
    | 9  | Elena González  | elena@example.com      |
    | 10 | David Torres    | david@example.com      |
    | 11 | Sofía Ruiz      | sofia@example.com      |
    | 12 | Javier López    | javier@example.com     |
    | 13 | Carmen Vargas   | carmen@example.com     |
    | 14 | Daniel Muñoz    | daniel@example.com     |
    | 15 | Isabel Serrano  | isabel@example.com     |
    | 16 | Alejandro Muñoz | alejandro@example.com  |
    | 17 | Raquel Herrera  | raquel@example.com     |
    | 18 | Francisco Mora  | francisco@example.com  |
    | 19 | Marina Díaz     | marina@example.com     |
    | 20 | Antonio Jiménez | antonio@example.com    |
    | 21 | Beatriz Romero  | beatriz@example.com    |
    | 26 | Mario Serrano   | mario@example.com      |
    | 27 | Eva Torres      | eva.torres@example.com |
    | 28 | Roberto Ruiz    | roberto@example.com    |
    | 29 | Celia García    | celia@example.com      |
    +----+-----------------+------------------------+
    
</br>
</details>
</br>

- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
```sql
select * from productos where precio >= 1000;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------+--------+
    | id | nombre | precio |
    +----+--------+--------+
    | 1  | Laptop | 1200.0 |
    +----+--------+--------+

    
</br>
</details>
</br>


- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
```sql
select * from Clientes where nombre REGEXP 'a[^aeiou]*e';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------+---------------------------+
    | id |     nombre      |           email           |
    +----+-----------------+---------------------------+
    | 1  | Juan Pérez      | juan@example.com          |
    | 2  | María Gómez     | maria@example.com         |
    | 5  | Luisa Martínez  | luisa@example.com         |
    | 13 | Carmen Vargas   | carmen@example.com        |
    | 15 | Isabel Serrano  | isabel@example.com        |
    | 23 | Clara Sánchez   | clara.sanchez@example.com |
    | 24 | Andrés Martínez | andres@example.com        |
    +----+-----------------+---------------------------+

    
</br>
</details>
</br>



- Obtener los productos cuyos nombres terminan con una consonante.
```sql
select * from Productos where nombre REGEXP '[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]$';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+-----------------------------------+--------+
    | id |              nombre               | precio |
    +----+-----------------------------------+--------+
    | 1  | Laptop                            | 1200.0 |
    | 3  | TV LED                            | 799.5  |
    | 4  | Tablet                            | 299.99 |
    | 5  | Auriculares Bluetooth             | 79.99  |
    | 7  | Cámara Digital                    | 499.99 |
    | 9  | Altavoces Inalámbricos            | 129.99 |
    | 13 | Monitor LED                       | 349.99 |
    | 14 | Mochila para Portátil             | 49.99  |
    | 17 | Lámpara LED                       | 39.99  |
    | 19 | Estuche para Auriculares          | 14.99  |
    | 22 | Kit de Limpieza para Computadoras | 9.99   |
    | 23 | Funda para Tablet                 | 19.99  |
    | 25 | Hub USB                           | 29.99  |
    | 26 | Webcam HD                         | 59.99  |
    | 27 | Funda para Laptop                 | 29.99  |
    +----+-----------------------------------+--------+


    
</br>
</details>
</br>



- Obtener los productos cuyos nombres empiezan con una vocal.
```sql
select * from Productos where nombre REGEXP '^[aeiouAEIOU]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------------------------+--------+
    | id |          nombre          | precio |
    +----+--------------------------+--------+
    | 5  | Auriculares Bluetooth    | 79.99  |
    | 6  | Impresora                | 199.99 |
    | 9  | Altavoces Inalámbricos   | 129.99 |
    | 19 | Estuche para Auriculares | 14.99  |
    | 28 | Adaptador HDMI           | 12.99  |
    +----+--------------------------+--------+

    
</br>
</details>
</br>






</div>
