<div align="justify">

# Code, Learn & Practice("Simulacro de bbdd 🧪:  Índices, Vistas, Funciones y Procedimientos")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## 🎯 Objetivo

Consolidar el uso de los principales componentes de MySQL:

- Índices
- Vistas
- Funciones
- Procedimientos

---

## 🧱 Enunciado del ejercicio

La empresa "TecnoMarket" quiere analizar las ventas realizadas por sus clientes. Para ello, necesita organizar la información en su base de datos y optimizar el rendimiento de las consultas.

### Tu tarea consiste en

1. Crear las tablas necesarias.
2. Insertar índices que mejoren las búsquedas más frecuentes.
3. Crear una vista que resuma las ventas.
4. Definir una función para calcular totales.
5. Crear un procedimiento que devuelva el resumen de ventas de un cliente específico.
6. Ejecutar el procedimiento para validar el resultado.

---

## 📘 Parte 1: Creación de tablas

```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO clientes (id, nombre, ciudad) VALUES
(1, 'Ana Pérez', 'Madrid'),
(2, 'Luis Gómez	', 'Barcelona'),
(3, 'Carla Ruiz	', 'Huelva');

INSERT INTO productos (id, nombre, precio) VALUES
(1, 'Laptop', 1200.00),
(2, 'Teclado', 50.00),
(3, 'Monitor', 300.00);

INSERT INTO ventas (id, cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, 1, '2024-05-01', 1),
(2, 1, 2, '2024-05-12', 2),
(3, 2, 3, '2024-05-13', 1),
(4, 3, 2, '2024-05-14', 1);
```

---

## 🔍 Parte 2: Creación de índices

Crea los siguientes clientes:

- **idx_ciudad** sobre la tabla clientes y el campo ciudad.
```sql
    CREATE INDEX idx_ciudad on clientes(ciudad);
```
- **idx_fecha** sobre la tabla ventas, y el campo fecha.
```sql
    CREATE INDEX idx_fecha on ventas(fecha);
```
### ¿Preguntas?

- Crea los indices, muestra su rendimiento, y explica si son óptimos y por qué?.
```sql
SHOW INDEX FROM clientes;
+----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| clientes |          0 | PRIMARY    |            1 | id          | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| clientes |          1 | idx_ciudad |            1 | ciudad      | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

SHOW INDEX FROM ventas;
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| ventas |          0 | PRIMARY     |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| ventas |          1 | cliente_id  |            1 | cliente_id  | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| ventas |          1 | producto_id |            1 | producto_id | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| ventas |          1 | idx_fecha   |            1 | fecha       | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+


EXPLAIN SELECT * FROM clientes WHERE ciudad = 'Madrid';
+----+-------------+----------+------------+------+---------------+------------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type | possible_keys | key        | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+------+---------------+------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | clientes | NULL       | ref  | idx_ciudad    | idx_ciudad | 203     | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+------+---------------+------------+---------+-------+------+----------+-------+

```

---

## 👁️ Parte 3: Crear una vista

- **Obtén, a través de una vista**, la siguiente información detallada de cada venta:

- ID de la venta
- Nombre del cliente
- Producto vendido
- Fecha de la venta
- Cantidad comprada
- Total gastado (precio × cantidad)

La vista **vista** que consolida los datos de las tablas `ventas`, `clientes` y `productos`, permitiendo consultar fácilmente el historial de ventas detallado.

> **RECUERDA**: Una vista es una **consulta sql** encapsulada en una tabla ficticia.


```sql
CREATE VIEW resumen as SELECT v.id, c.nombre as cliente, p.nombre as producto, v.fecha, v.cantidad, v.cantidad * p.precio as total FROM ventas v JOIN clientes c on v.cliente_id = c.id JOIN productos p on v.producto_id = p.id;
```

### 📊 Resultado esperado

| venta_id | cliente     | producto | fecha       | cantidad | total   |
|----------|-------------|----------|-------------|----------|---------|
| 1        | Ana Pérez   | Laptop   | 2024-05-01  | 1        | 1200.00 |
| 2        | Ana Pérez   | Teclado  | 2024-05-12  | 2        | 100.00  |
| 3        | Luis Gómez  | Monitor  | 2024-05-13  | 1        | 300.00  |
| 4        | Carla Ruiz  | Teclado  | 2024-05-14  | 1        | 50.00   |



### 📊 Resultado obtenido

```sql
select * from resumen;

    +----+-------------+----------+------------+----------+---------+
    | id | cliente     | producto | fecha      | cantidad | total   |
    +----+-------------+----------+------------+----------+---------+
    |  1 | Ana Pérez   | Laptop   | 2024-05-01 |        1 | 1200.00 |
    |  2 | Ana Pérez   | Teclado  | 2024-05-12 |        2 |  100.00 |
    |  3 | Luis Gómez  | Monitor  | 2024-05-13 |        1 |  300.00 |
    |  4 | Carla Ruiz  | Teclado  | 2024-05-14 |        1 |   50.00 |
    +----+-------------+----------+------------+----------+---------+
```
---

## 🧮 Parte 4: Crear una función

Crea una **función almacenada** en MySQL llamada `calcular_total` que reciba los siguientes parámetros:

- `precio`: un valor decimal con dos decimales (precio del producto)
- `cantidad`: un número entero que representa las unidades compradas

La función debe devolver el resultado de multiplicar ambos valores, es decir, el **total a pagar** por esa línea de venta.

```sql
SELECT calcular_total(1200.00, 2);
```

| calcular_total(1200.00, 2) |
|----------------------------|
| 2400.00                    |


```sql
CREATE FUNCTION calcular_total(precio DECIMAL(10,2), cantidad INT) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN RETURN precio * cantidad; END;

SELECT calcular_total(44.7, 3);

    +-------------------------+
    | calcular_total(44.7, 3) |
    +-------------------------+
    |                  134.10 |
    +-------------------------+


```


---

## ⚙️ Parte 5: Crear un procedimiento

Crea un procedimiento llamado `resumen_cliente` que reciba como parámetro el **ID de un cliente** (`cliente_id`), y que devuelva el **historial de ventas** de dicho cliente.  
El procedimiento debe mostrar los siguientes datos por cada venta realizada por ese cliente:

- El **nombre del cliente**
- La **fecha de la venta**
- El **nombre del producto**
- La **cantidad comprada**
- El **total de la línea de venta**, calculado como `precio * cantidad`

💡 **Sugerencia:** Puedes reutilizar una función existente (como `calcular_total`) o calcular el total directamente en la consulta.

```sql
CALL resumen_cliente(1);
```

Con el siguiente resultado: 

| nombre     | fecha       | producto   | cantidad | total   |
|------------|-------------|------------|----------|---------|
| Ana Pérez | 2024-05-01  | Laptop     | 1        | 1200.00 |
| Ana Pérez | 2024-05-12  | Teclado    | 2        | 100.00  |

> *Este resultado depende de los datos que se hayan insertado en la base de datos.*

```sql
DELIMITER //
CREATE PROCEDURE resumen_cliente(IN cliente_id INT) 
BEGIN 
    SELECT 
        c.nombre, 
        v.fecha, 
        p.nombre as producto, 
        v.cantidad,
        calcular_total(v.cantidad, p.precio) as total 
    FROM ventas v 
    JOIN clientes c ON v.cliente_id = c.id 
    JOIN productos p ON v.producto_id = p.id; 
END //

DELIMITER ;

CALL resumen_cliente(3);

+------------+------------+----------+----------+-------+
| nombre     | fecha      | producto | cantidad | total |
+------------+------------+----------+----------+-------+
| Carla Ruiz | 2024-05-14 | Teclado  |        1 | 50.00 |
+------------+------------+----------+----------+-------+
```

---

## ❓ Preguntas teóricas

1. ¿Qué ventajas ofrece el uso de una vista en lugar de una consulta con múltiples `JOIN`?
Las vistas simplifican y reutilizan consultas complejas, mejorando legibilidad y seguridad.

2. ¿Por qué es importante declarar una función como `DETERMINISTIC`?
Indica que una función siempre devuelve el mismo resultado, permitiendo optimizaciones.

3. ¿Cuál es la diferencia entre una función y un procedimiento?
Las funciones devuelven un valor único y se usan en consultas; los procedimientos ejecutan acciones completas y se llaman con CALL.

4. ¿Qué impacto tienen los índices sobre el rendimiento de una base de datos?
Aceleran búsquedas y filtros, pero pueden ralentizar inserciones y actualizaciones.

5. ¿Cuándo se recomienda usar un trigger en lugar de un procedimiento?
Se usan para ejecutar acciones automáticas tras cambios en los datos (como auditorías).

---

## 📝 Preguntas prácticas

1. Modifica el procedimiento para filtrar también por un rango de fechas.
```sql
DELIMITER //

CREATE PROCEDURE resumen_cliente_fechas(IN cliente_id INT, IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT 
        c.nombre,
        v.fecha,
        p.nombre AS producto,
        v.cantidad,
        calcular_total(p.precio, v.cantidad) AS total
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN productos p ON v.producto_id = p.id
    WHERE c.id = cliente_id
      AND v.fecha BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;

```

2. Crea un índice sobre la columna `producto_id` en la tabla `ventas`.
```sql
CREATE INDEX idx_producto_id ON ventas(producto_id);
```
3. ¿Qué ocurre si insertas una venta con un `cliente_id` inexistente?
```sql
INSERT INTO ventas (id, cliente_id, producto_id, fecha, cantidad) VALUES
    -> (7, 6, 1, '2024-05-01', 1);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`tecnomarket`.`ventas`, CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`))
```
4. Modifica la vista para incluir también el nombre de la ciudad del cliente.
```sql
CREATE OR REPLACE VIEW resumen as SELECT v.id, c.nombre as cliente, c.ciudad, p.nombre as producto, v.fecha, v.cantidad, v.cantidad * p.precio as total FROM ventas v JOIN clientes c on v.cliente_id = c.id JOIN productos p on v.producto_id = p.id;

 select * from resumen;
    +----------+-------------+-----------+----------+------------+----------+---------+
    | venta_id | cliente     | ciudad    | producto | fecha      | cantidad | total   |
    +----------+-------------+-----------+----------+------------+----------+---------+
    |        1 | Ana Pérez   | Madrid    | Laptop   | 2024-05-01 |        1 | 1200.00 |
    |        2 | Ana Pérez   | Madrid    | Teclado  | 2024-05-12 |        2 |  100.00 |
    |        3 | Luis Gómez  | Barcelona | Monitor  | 2024-05-13 |        1 |  300.00 |
    |        4 | Carla Ruiz  | Huelva    | Teclado  | 2024-05-14 |        1 |   50.00 |
    +----------+-------------+-----------+----------+------------+----------+---------+
```

5. Agrega una validación en el procedimiento para evitar resultados si el cliente no existe.
```sql
DELIMITER //

CREATE PROCEDURE resumen_cliente_valido(IN cliente_id INT)
BEGIN
    DECLARE cliente_existe INT;

    SELECT COUNT(*) INTO cliente_existe FROM clientes WHERE id = cliente_id;

    IF cliente_existe = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El cliente no existe';
    ELSE
        SELECT 
            c.nombre,
            v.fecha,
            p.nombre AS producto,
            v.cantidad,
            calcular_total(p.precio, v.cantidad) AS total
        FROM ventas v
        JOIN clientes c ON v.cliente_id = c.id
        JOIN productos p ON v.producto_id = p.id
        WHERE c.id = cliente_id;
    END IF;
END //

DELIMITER ;
```
---

</div>