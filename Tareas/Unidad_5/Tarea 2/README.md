P<div align="justify">

#  Code, Learn & Practice(Base de datos (Primeros pasos en SQL")


## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos

### Paso 1: Crear una tabla con un campo de cada tipo

1. Utilizando la terminal o línea de comandos, abre SQLite3 y crea una base de datos llamada `tarea2.db`.

    ```bash
    sqlite3 tarea2.db
    ```

2. Dentro de SQLite3, crea las siguientes tablas

- __Propietarios__: Almacena información de los propietarios.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __nombre__ TEXT no nulo.
  - __apellido__ TEXT no nulo.
  - __dni__ TEXT Valor único. 
  - __Vehiculos__: Almacena información sobre los propietarios de los vehículos.
  - __id__ INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - __marca__ TEXT no nulo.
  - __modelo__ TEXT no nulo.
  - __anio__ INTEGER no nulo.
  - __id_propietario__ INTEGER, FK propietarios(id_propietario). 

```sql
    CREATE TABLE Propietarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    dni TEXT UNIQUE NOT NULL
);

CREATE TABLE Vehiculos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    marca TEXT NOT NULL,
    modelo TEXT NOT NULL,
    anio INTEGER NOT NULL,
    id_propietario INTEGER,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id)
);
```

Asegúrate de cerrar SQLite3 al finalizar.



### Paso 2: Insertar 20 entradas

Dado el siguiente conjunto de información:

| id_propietario | nombre      | apellido    | dni       | marca      | modelo     | ano  |
|----------------|-------------|-------------|-----------|------------|------------|------|
| 1              | Juan        | Perez       | 12345678A | Ford       | Fiesta     | 2019 |
| 2              | Maria       | Lopez       | 87654321B | Toyota     | Corolla    | 2018 |
| 3              | Carlos      | Ruiz        | 11111111C | Nissan     | Sentra     | 2020 |
| 4              | Laura       | Gomez       | 22222222D | Chevrolet  | Spark      | 2017 |
| 5              | Pedro       | Martinez    | 33333333E | Honda      | Civic      | 2016 |
| 6              | Ana         | Fernandez   | 44444444F | Ford       | Mustang    | 2021 |
| 7              | Diego       | Sanchez     | 55555555G | Toyota     | RAV4       | 2019 |
| 8              | Sofia       | Torres      | 66666666H | Volkswagen | Golf       | 2020 |
| 9              | Javier      | Leon        | 77777777I | Honda      | CR-V       | 2018 |
| 10             | Lucia       | Castillo    | 88888888J | Nissan     | Altima     | 2017 |
| 11             | Luis        | Gonzalez    | 99999999K | Chevrolet  | Malibu     | 2019 |
| 12             | Marta       | Diaz        | 10101010L | Toyota     | Camry      | 2020 |
| 13             | Victor      | Vargas      | 11111112M | Honda      | Accord     | 2018 |
| 14             | Elena       | Castro      | 12121212N | Ford       | Explorer   | 2021 |
| 15             | Roberto     | Blanco      | 13131313O | Nissan     | Rogue      | 2017 |
| 16             | Natalia     | Paredes     | 14141414P | Volkswagen | Jetta      | 2019 |
| 17             | Fernando    | Herrera     | 15151515Q | Chevrolet  | Equinox    | 2018 |
| 18             | Clara       | Soto        | 16161616R | Toyota     | Highlander | 2020 |
| 19             | Sergio      | Mendoza     | 17171717S | Honda      | Odyssey    | 2016 |
| 20             | Patricia    | Navarro     | 18181818T | Nissan     | Murano     | 2019 |

Realiza la inserción en la tablas de modo que la información quede almacenada.

```sql
    INSERT INTO Propietarios (id, nombre, apellido, dni) VALUES
(1, 'Juan', 'Perez', '12345678A'),
(2, 'Maria', 'Lopez', '87654321B'),
(3, 'Carlos', 'Ruiz', '11111111C'),
(4, 'Laura', 'Gomez', '22222222D'),
(5, 'Pedro', 'Martinez', '33333333E'),
(6, 'Ana', 'Fernandez', '44444444F'),
(7, 'Diego', 'Sanchez', '55555555G'),
(8, 'Sofia', 'Torres', '66666666H'),
(9, 'Javier', 'Leon', '77777777I'),
(10, 'Lucia', 'Castillo', '88888888J'),
(11, 'Luis', 'Gonzalez', '99999999K'),
(12, 'Marta', 'Diaz', '10101010L'),
(13, 'Victor', 'Vargas', '11111112M'),
(14, 'Elena', 'Castro', '12121212N'),
(15, 'Roberto', 'Blanco', '13131313O'),
(16, 'Natalia', 'Paredes', '14141414P'),
(17, 'Fernando', 'Herrera', '15151515Q'),
(18, 'Clara', 'Soto', '16161616R'),
(19, 'Sergio', 'Mendoza', '17171717S'),
(20, 'Patricia', 'Navarro', '18181818T');

-- Insertar datos en la tabla Vehiculos
INSERT INTO Vehiculos (marca, modelo, anio, id_propietario) VALUES
('Ford', 'Fiesta', 2019, 1),
('Toyota', 'Corolla', 2018, 2),
('Nissan', 'Sentra', 2020, 3),
('Chevrolet', 'Spark', 2017, 4),
('Honda', 'Civic', 2016, 5),
('Ford', 'Mustang', 2021, 6),
('Toyota', 'RAV4', 2019, 7),
('Volkswagen', 'Golf', 2020, 8),
('Honda', 'CR-V', 2018, 9),
('Nissan', 'Altima', 2017, 10),
('Chevrolet', 'Malibu', 2019, 11),
('Toyota', 'Camry', 2020, 12),
('Honda', 'Accord', 2018, 13),
('Ford', 'Explorer', 2021, 14),
('Nissan', 'Rogue', 2017, 15),
('Volkswagen', 'Jetta', 2019, 16),
('Chevrolet', 'Equinox', 2018, 17),
('Toyota', 'Highlander', 2020, 18),
('Honda', 'Odyssey', 2016, 19),
('Nissan', 'Murano', 2019, 20);
```

### Paso 3: Realizar las siguientes 10 consultas de datos

- Seleccionar todos los propietarios
```sql
SELECT * FROM Propietarios;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+----------+-----------+-----------+
        | id |  nombre  | apellido  |    dni    |
        +----+----------+-----------+-----------+
        | 1  | Juan     | Perez     | 12345678A |
        | 2  | Maria    | Lopez     | 87654321B |
        | 3  | Carlos   | Ruiz      | 11111111C |
        | 4  | Laura    | Gomez     | 22222222D |
        | 5  | Pedro    | Martinez  | 33333333E |
        | 6  | Ana      | Fernandez | 44444444F |
        | 7  | Diego    | Sanchez   | 55555555G |
        | 8  | Sofia    | Torres    | 66666666H |
        | 9  | Javier   | Leon      | 77777777I |
        | 10 | Lucia    | Castillo  | 88888888J |
        | 11 | Luis     | Gonzalez  | 99999999K |
        | 12 | Marta    | Diaz      | 10101010L |
        | 13 | Victor   | Vargas    | 11111112M |
        | 14 | Elena    | Castro    | 12121212N |
        | 15 | Roberto  | Blanco    | 13131313O |
        | 16 | Natalia  | Paredes   | 14141414P |
        | 17 | Fernando | Herrera   | 15151515Q |
        | 18 | Clara    | Soto      | 16161616R |
        | 19 | Sergio   | Mendoza   | 17171717S |
        | 20 | Patricia | Navarro   | 18181818T |
        +----+----------+-----------+-----------+
    
  </br>
</details>
</br>

- Listar todos los vehículos.
```sql
SELECT * FROM Vehiculos;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+------------+------------+------+----------------+
        | id |   marca    |   modelo   | anio | id_propietario |
        +----+------------+------------+------+----------------+
        | 1  | Ford       | Fiesta     | 2019 | 1              |
        | 2  | Toyota     | Corolla    | 2018 | 2              |
        | 3  | Nissan     | Sentra     | 2020 | 3              |
        | 4  | Chevrolet  | Spark      | 2017 | 4              |
        | 5  | Honda      | Civic      | 2016 | 5              |
        | 6  | Ford       | Mustang    | 2021 | 6              |
        | 7  | Toyota     | RAV4       | 2019 | 7              |
        | 8  | Volkswagen | Golf       | 2020 | 8              |
        | 9  | Honda      | CR-V       | 2018 | 9              |
        | 10 | Nissan     | Altima     | 2017 | 10             |
        | 11 | Chevrolet  | Malibu     | 2019 | 11             |
        | 12 | Toyota     | Camry      | 2020 | 12             |
        | 13 | Honda      | Accord     | 2018 | 13             |
        | 14 | Ford       | Explorer   | 2021 | 14             |
        | 15 | Nissan     | Rogue      | 2017 | 15             |
        | 16 | Volkswagen | Jetta      | 2019 | 16             |
        | 17 | Chevrolet  | Equinox    | 2018 | 17             |
        | 18 | Toyota     | Highlander | 2020 | 18             |
        | 19 | Honda      | Odyssey    | 2016 | 19             |
        | 20 | Nissan     | Murano     | 2019 | 20             |
        +----+------------+------------+------+----------------+

    
  </br>
</details>
</br>

- Seleccionar solo los nombres y apellidos de los propietarios.
```sql
SELECT nombre, apellido FROM Propietarios;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        | nombre    | apellido  |
        |-----------|-----------|
        | Juan      | Perez     |
        | Maria     | Lopez     |
        | Carlos    | Ruiz      |
        | Laura     | Gomez     |
        | Pedro     | Martinez  |
        | Ana       | Fernandez |
        | Diego     | Sanchez   |
        | Sofia     | Torres    |
        | Javier    | Leon      |
        | Lucia     | Castillo  |
        | Luis      | Gonzalez  |
        | Marta     | Diaz      |
        | Victor    | Vargas    |
        | Elena     | Castro    |
        | Roberto   | Blanco    |
        | Natalia   | Paredes   |
        | Fernando  | Herrera   |
        | Clara     | Soto      |
        | Sergio    | Mendoza   |
        | Patricia  | Navarro   |


  </br>
</details>
</br>

- Listar todas las marcas y modelos de los vehículos.
```sql
SELECT marca, modelo FROM Vehiculos;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

    +------------+------------+
    |   marca    |   modelo   |
    +------------+------------+
    | Ford       | Fiesta     |
    | Toyota     | Corolla    |
    | Nissan     | Sentra     |
    | Chevrolet  | Spark      |
    | Honda      | Civic      |
    | Ford       | Mustang    |
    | Toyota     | RAV4       |
    | Volkswagen | Golf       |
    | Honda      | CR-V       |
    | Nissan     | Altima     |
    | Chevrolet  | Malibu     |
    | Toyota     | Camry      |
    | Honda      | Accord     |
    | Ford       | Explorer   |
    | Nissan     | Rogue      |
    | Volkswagen | Jetta      |
    | Chevrolet  | Equinox    |
    | Toyota     | Highlander |
    | Honda      | Odyssey    |
    | Nissan     | Murano     |
    +------------+------------+

    
  </br>
</details>
</br>

- Seleccionar solo los propietarios con apellido "Perez".
```sql
SELECT * FROM Propietarios WHERE apellido = 'Perez';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+--------+----------+-----------+
        | id | nombre | apellido |    dni    |
        +----+--------+----------+-----------+
        | 1  | Juan   | Perez    | 12345678A |
        +----+--------+----------+-----------+
    
  </br>
</details>

- Listar todos los vehículos con año 2019.
```sql
SELECT * FROM Vehiculos WHERE anio = 2019;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+------------+--------+------+----------------+
        | id |   marca    | modelo | anio | id_propietario |
        +----+------------+--------+------+----------------+
        | 1  | Ford       | Fiesta | 2019 | 1              |
        | 7  | Toyota     | RAV4   | 2019 | 7              |
        | 11 | Chevrolet  | Malibu | 2019 | 11             |
        | 16 | Volkswagen | Jetta  | 2019 | 16             |
        | 20 | Nissan     | Murano | 2019 | 20             |
        +----+------------+--------+------+----------------+
    
  </br>
</details>
</br>

- Seleccionar propietarios que tienen vehículos de la marca "Toyota".
```sql
SELECT * FROM Propietarios AS p JOIN Vehiculos AS v ON p.id = v.id_propietario WHERE v.marca = "Toyota";
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+--------+----------+-----------+----+--------+------------+------+----------------+
        | id | nombre | apellido |    dni    | id | marca  |   modelo   | anio | id_propietario |
        +----+--------+----------+-----------+----+--------+------------+------+----------------+
        | 2  | Maria  | Lopez    | 87654321B | 2  | Toyota | Corolla    | 2018 | 2              |
        | 7  | Diego  | Sanchez  | 55555555G | 7  | Toyota | RAV4       | 2019 | 7              |
        | 12 | Marta  | Diaz     | 10101010L | 12 | Toyota | Camry      | 2020 | 12             |
        | 18 | Clara  | Soto     | 16161616R | 18 | Toyota | Highlander | 2020 | 18             |
        +----+--------+----------+-----------+----+--------+------------+------+----------------+
    
  </br>
</details>
</br>

- Listar vehículos con marca "Ford" y modelo "Fiesta".
```sql
SELECT * FROM Vehiculos WHERE marca = 'Ford' AND modelo = 'Fiesta';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

        +----+-------+--------+------+----------------+
        | id | marca | modelo | anio | id_propietario |
        +----+-------+--------+------+----------------+
        | 1  | Ford  | Fiesta | 2019 | 1              |
        +----+-------+--------+------+----------------+
    
  </br>
</details>
</br>

- Seleccionar propietarios con DNI "12345678A".
```sql
SELECT * FROM Propietarios WHERE dni = '12345678A';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

      +----+--------+----------+-----------+
      | id | nombre | apellido |    dni    |
      +----+--------+----------+-----------+
      | 1  | Juan   | Perez    | 12345678A |
      +----+--------+----------+-----------+

    
  </br>
</details>
</br>

- Listar vehículos que pertenecen al propietario con ID 5.
```sql
SELECT * FROM Vehiculos WHERE id_propietario = 5;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

      +----+-------+--------+------+----------------+
      | id | marca | modelo | anio | id_propietario |
      +----+-------+--------+------+----------------+
      | 5  | Honda | Civic  | 2016 | 5              |
      +----+-------+--------+------+----------------+
  
  </br>
</details>
</br>


### Paso 4: Realiza los siguientes updates

- Actualizar el nombre de un propietario con DNI "12345678A".
```sql
UPDATE Propietarios SET nombre = 'Juan Carlos' WHERE dni = '12345678A';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>
  
      +----+-------------+----------+-----------+
      | id |   nombre    | apellido |    dni    |
      +----+-------------+----------+-----------+
      | 1  | Juan Carlos | Perez    | 12345678A |
      +----+-------------+----------+-----------+
    
  </br>
</details>
</br>

- Modificar el año de un vehículo con ID 3 a 2022.
```sql
UPDATE Vehiculos SET anio = 2022 WHERE id = 3;
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>
        
      +----+--------+--------+------+----------------+
      | id | marca  | modelo | anio | id_propietario |
      +----+--------+--------+------+----------------+
      | 3  | Nissan | Sentra | 2022 | 3              |
      +----+--------+--------+------+----------------+
    
  </br>
</details>
</br>

- Cambiar el modelo de todos los vehículos Nissan a "Micra".
```sql
UPDATE Vehiculos SET modelo = 'Micra' WHERE marca = 'Nissan';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

      +----+--------+--------+------+----------------+
      | id | marca  | modelo | anio | id_propietario |
      +----+--------+--------+------+----------------+
      | 3  | Nissan | Micra  | 2022 | 3              |
      | 10 | Nissan | Micra  | 2017 | 10             |
      | 15 | Nissan | Micra  | 2017 | 15             |
      | 20 | Nissan | Micra  | 2019 | 20             |
      +----+--------+--------+------+----------------+
    
  </br>
</details>
</br>

- Actualizar el apellido de un propietario con ID 7 a "Gomez".
```sql
UPDATE Propietarios SET apellido = 'Gomez' WHERE id = 7
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

      +----+--------+----------+-----------+
      | id | nombre | apellido |    dni    |
      +----+--------+----------+-----------+
      | 7  | Diego  | Gomez    | 55555555G |
      +----+--------+----------+-----------+
    
  </br>
</details>
</br>

- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
```sql
UPDATE Vehiculos SET marca = 'Renault' WHERE modelo = 'Fiesta';
```
<details>
  <summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
  </br>

    +----+---------+--------+------+----------------+
    | id |  marca  | modelo | anio | id_propietario |
    +----+---------+--------+------+----------------+
    | 1  | Renault | Fiesta | 2019 | 1              |
    +----+---------+--------+------+----------------+
    
  </br>
</details>



</div>