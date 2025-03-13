
<div align="justify">

# Code, Learn & Practice (Base de datos - Trabajo con funciones en BBDD)


## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

Este proyecto tiene como objetivo la práctica en la creación, manipulación y consulta de una base de datos SQLite3 utilizando varias funciones SQL. El ejercicio consiste en la creación de una base de datos, la inserción de información y la ejecución de consultas para obtener diversos resultados utilizando funciones específicas.

## Pasos

### Paso 1: Creación de la BBDD

Se ha creado una base de datos SQLite3 llamada `tarea3.db` con una tabla `empleados`, donde se han insertado 20 registros de empleados. La estructura de la tabla es la siguiente:

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

.
```

### Paso 2: Lectura del fichero SQL

El siguiente comando se utilizó para cargar y ejecutar el fichero `empleados-dump.sql` en SQLite3:

```bash
sqlite3 tarea3.db
.read empleados-dump.sql
```

### Paso 3: Realización de consultas

Se realizaron las siguientes consultas en la base de datos `empleados`, junto con los resultados obtenidos:

#### 1. Funciones UPPER y LOWER
- **Consulta:** Muestra el nombre de todos los empleados en mayúsculas.

```sql
SELECT UPPER(nombre) FROM empleados;
```
**Resultado:**

    +---------------+
    | UPPER(nombre) |
    +---------------+
    | JUAN          |
    | MARíA         |
    | CARLOS        |
    | ANA           |
    | PEDRO         |
    | LAURA         |
    | JAVIER        |
    | CARMEN        |
    | MIGUEL        |
    | ELENA         |
    | DIEGO         |
    | SOFíA         |
    | ANDRéS        |
    | ISABEL        |
    | RAúL          |
    | PATRICIA      |
    | ALEJANDRO     |
    | NATALIA       |
    | ROBERTO       |
    | BEATRIZ       |
    +---------------+


#### 2. Funciones Numéricas
- **Consulta:** Calcula el valor absoluto del salario de todos los empleados.

```sql
SELECT ABS(salario) FROM empleados;
```
**Resultado:**

    +--------------+
    | ABS(salario) |
    +--------------+
    | 50000.0      |
    | 60000.0      |
    | 55000.0      |
    | 48000.0      |
    | 70000.0      |
    | 52000.0      |
    | 48000.0      |
    | 65000.0      |
    | 51000.0      |
    | 55000.0      |
    | 72000.0      |
    | 49000.0      |
    | 60000.0      |
    | 53000.0      |
    | 68000.0      |
    | 47000.0      |
    | 71000.0      |
    | 54000.0      |
    | 49000.0      |
    | 63000.0      |
    +--------------+


#### 3. Funciones de Fecha y Hora
- **Consulta:** Muestra la fecha actual.

```sql
SELECT CURRENT_DATE;
```
**Resultado:**

- `2025-03-12` (dependiendo de la fecha actual al momento de la ejecución).

#### 4. Funciones de Agregación
- **Consulta:** Calcula el promedio de salarios de todos los empleados.

```sql
SELECT AVG(salario) FROM empleados;
```
**Resultado:**


        +--------------+
        | AVG(salario) |
        +--------------+
        | 57000.0      |
        +--------------+

- **Consulta:** Convierte la cadena '123' a un valor entero.

```sql
SELECT CAST('123' AS INTEGER);
```
**Resultado:**


        +------------------------+
        | CAST('123' AS INTEGER) |
        +------------------------+
        | 123                    |
        +------------------------+

#### 5. Funciones de Manipulación de Cadenas
- **Consulta:** Concatena el nombre y el departamento de cada empleado.

```sql
SELECT nombre || ' - ' || departamento FROM empleados;
```
**Resultado:**

        +---------------------------------+
        | nombre || ' - ' || departamento |
        +---------------------------------+
        | Juan - Ventas                   |
        | María - TI                      |
        | Carlos - Ventas                 |
        | Ana - Recursos Humanos          |
        | Pedro - TI                      |
        | Laura - Ventas                  |
        | Javier - Recursos Humanos       |
        | Carmen - TI                     |
        | Miguel - Ventas                 |
        | Elena - Recursos Humanos        |
        | Diego - TI                      |
        | Sofía - Ventas                  |
        | Andrés - Recursos Humanos       |
        | Isabel - TI                     |
        | Raúl - Ventas                   |
        | Patricia - Recursos Humanos     |
        | Alejandro - TI                  |
        | Natalia - Ventas                |
        | Roberto - Recursos Humanos      |
        | Beatriz - TI                    |
        +---------------------------------+

#### 6. Funciones de Manipulación de Cadenas (CONCAT_WS)
- **Consulta:** Concatena el nombre y el departamento de cada empleado con un guion como separador.

El uso de la función CONCAT_WS en SQLite3 no es compatible de manera nativa, ya que SQLite no soporta directamente esta función. 


#### 7. Funciones de Control de Flujo (CASE)
- **Consulta:** Categoriza a los empleados según sus salarios.

```sql
SELECT nombre, salario,
       CASE
           WHEN salario < 50000 THEN 'Bajo'
           WHEN salario BETWEEN 50000 AND 70000 THEN 'Medio'
           ELSE 'Alto'
       END AS categoria
FROM empleados;
```
**Resultado:**

        +-----------+---------+-----------+
        |  nombre   | salario | categoria |
        +-----------+---------+-----------+
        | Juan      | 50000.0 | Medio     |
        | María     | 60000.0 | Medio     |
        | Carlos    | 55000.0 | Medio     |
        | Ana       | 48000.0 | Bajo      |
        | Pedro     | 70000.0 | Medio     |
        | Laura     | 52000.0 | Medio     |
        | Javier    | 48000.0 | Bajo      |
        | Carmen    | 65000.0 | Medio     |
        | Miguel    | 51000.0 | Medio     |
        | Elena     | 55000.0 | Medio     |
        | Diego     | 72000.0 | Alto      |
        | Sofía     | 49000.0 | Bajo      |
        | Andrés    | 60000.0 | Medio     |
        | Isabel    | 53000.0 | Medio     |
        | Raúl      | 68000.0 | Medio     |
        | Patricia  | 47000.0 | Bajo      |
        | Alejandro | 71000.0 | Alto      |
        | Natalia   | 54000.0 | Medio     |
        | Roberto   | 49000.0 | Bajo      |
        | Beatriz   | 63000.0 | Medio     |
        +-----------+---------+-----------+


#### 8. Funciones de Agregación (SUM)
- **Consulta:** Calcula la suma total de salarios de todos los empleados.

```sql
SELECT SUM(salario) FROM empleados;
```
**Resultado:**

        +--------------+
        | SUM(salario) |
        +--------------+
        | 1140000.0    |
        +--------------+


#### 9. Funciones Numéricas (ROUND)
- **Consulta:** Redondea el salario de todos los empleados a dos decimales.

```sql
SELECT ROUND(salario, 2) FROM empleados;
```
**Resultado:**

        +-------------------+
        | ROUND(salario, 2) |
        +-------------------+
        | 50000.0           |
        | 60000.0           |
        | 55000.0           |
        | 48000.0           |
        | 70000.0           |
        | 52000.0           |
        | 48000.0           |
        | 65000.0           |
        | 51000.0           |
        | 55000.0           |
        | 72000.0           |
        | 49000.0           |
        | 60000.0           |
        | 53000.0           |
        | 68000.0           |
        | 47000.0           |
        | 71000.0           |
        | 54000.0           |
        | 49000.0           |
        | 63000.0           |
        +-------------------+

#### 10. Funciones de Manipulación de Cadenas (LENGTH)
- **Consulta:** Muestra la longitud de cada nombre de empleado.

```sql
SELECT LENGTH(nombre) FROM empleados;
```
**Resultado:**

        +----------------+
        | LENGTH(nombre) |
        +----------------+
        | 4              |
        | 5              |
        | 6              |
        | 3              |
        | 5              |
        | 5              |
        | 6              |
        | 6              |
        | 6              |
        | 5              |
        | 5              |
        | 5              |
        | 6              |
        | 6              |
        | 4              |
        | 8              |
        | 9              |
        | 7              |
        | 7              |
        | 7              |
        +----------------+


</div>
