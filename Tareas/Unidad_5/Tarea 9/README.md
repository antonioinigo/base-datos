## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Creo una base de datos con las siguientes tablas

```sql
CREATE TABLE IF NOT EXISTS Alumnos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);

INSERT INTO Alumnos (nombre, edad, direccion) VALUES
    ('Juan', 20, 'Calle A'),
    ('María', 21, 'Calle B'),
    ('Pedro', 19, 'Calle C'),
    ('Laura', 22, 'Calle D'),
    ('Carlos', 20, 'Calle E'),
    ('Ana', 19, 'Calle F'),
    ('Sofía', 21, 'Calle G'),
    ('Diego', 20, 'Calle H'),
    ('Lucía', 22, 'Calle I'),
    ('Miguel', 19, 'Calle J');

-- Crear tabla para las clases
CREATE TABLE IF NOT EXISTS Clases (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    materia TEXT,
    profesor TEXT
);

INSERT INTO Clases (nombre, materia, profesor) VALUES
    ('Matemáticas 101', 'Matemáticas', 'Profesor X'),
    ('Historia Antigua', 'Historia', 'Profesor Y'),
    ('Literatura Moderna', 'Literatura', 'Profesor Z'),
    ('Biología Avanzada', 'Biología', 'Profesor W'),
    ('Química Orgánica', 'Química', 'Profesor V'),
    ('Física Cuántica', 'Física', 'Profesor U'),
    ('Arte Contemporáneo', 'Arte', 'Profesor T'),
    ('Inglés Avanzado', 'Idiomas', 'Profesor S'),
    ('Economía Internacional', 'Economía', 'Profesor R'),
    ('Derecho Penal', 'Derecho', 'Profesor Q');


CREATE TABLE IF NOT EXISTS Inscripciones (
    id INTEGER PRIMARY KEY,
    id_alumno INTEGER,
    id_clase INTEGER,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id),
    FOREIGN KEY (id_clase) REFERENCES Clases(id)
);

INSERT INTO Inscripciones (id_alumno, id_clase) VALUES
    (1, 1), 
    (1, 2), 
    (2, 3), 
    (2, 4), 
    (3, 5), 
    (3, 6), 
    (4, 7), 
    (4, 8), 
    (5, 9), 
    (6, 10); 
```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 clases.db
``` 

### Paso 3: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.


```sql
select a.nombre, c.nombre from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+------------------------+
    | nombre |         nombre         |
    +--------+------------------------+
    | Juan   | Matemáticas 101        |
    | Juan   | Historia Antigua       |
    | María  | Literatura Moderna     |
    | María  | Biología Avanzada      |
    | Pedro  | Química Orgánica       |
    | Pedro  | Física Cuántica        |
    | Laura  | Arte Contemporáneo     |
    | Laura  | Inglés Avanzado        |
    | Carlos | Economía Internacional |
    | Ana    | Derecho Penal          |
    +--------+------------------------+

    
</br>
</details>
</br>

- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.

```sql
select a.nombre, c.materia from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-------------+
    | nombre |   materia   |
    +--------+-------------+
    | Juan   | Matemáticas |
    | Juan   | Historia    |
    | María  | Literatura  |
    | María  | Biología    |
    | Pedro  | Química     |
    | Pedro  | Física      |
    | Laura  | Arte        |
    | Laura  | Idiomas     |
    | Carlos | Economía    |
    | Ana    | Derecho     |
    +--------+-------------+
    
</br>
</details>
</br>

- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.


```sql
select a.nombre, a.edad, c.profesor from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+------+------------+
    | nombre | edad |  profesor  |
    +--------+------+------------+
    | Juan   | 20   | Profesor X |
    | Juan   | 20   | Profesor Y |
    | María  | 21   | Profesor Z |
    | María  | 21   | Profesor W |
    | Pedro  | 19   | Profesor V |
    | Pedro  | 19   | Profesor U |
    | Laura  | 22   | Profesor T |
    | Laura  | 22   | Profesor S |
    | Carlos | 20   | Profesor R |
    | Ana    | 19   | Profesor Q |
    +--------+------+------------+
    
</br>
</details>
</br>

- Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.


```sql
select nombre, direccion from Alumnos;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>


    +--------+-----------+
    | nombre | direccion |
    +--------+-----------+
    | Juan   | Calle A   |
    | María  | Calle B   |
    | Pedro  | Calle C   |
    | Laura  | Calle D   |
    | Carlos | Calle E   |
    | Ana    | Calle F   |
    | Sofía  | Calle G   |
    | Diego  | Calle H   |
    | Lucía  | Calle I   |
    | Miguel | Calle J   |
    +--------+-----------+
        
</br>
</details>
</br>


- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

```sql
select a.nombre, c.nombre, c.profesor from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+------------------------+------------+
    | nombre |         nombre         |  profesor  |
    +--------+------------------------+------------+
    | Juan   | Matemáticas 101        | Profesor X |
    | Juan   | Historia Antigua       | Profesor Y |
    | María  | Literatura Moderna     | Profesor Z |
    | María  | Biología Avanzada      | Profesor W |
    | Pedro  | Química Orgánica       | Profesor V |
    | Pedro  | Física Cuántica        | Profesor U |
    | Laura  | Arte Contemporáneo     | Profesor T |
    | Laura  | Inglés Avanzado        | Profesor S |
    | Carlos | Economía Internacional | Profesor R |
    | Ana    | Derecho Penal          | Profesor Q |
    +--------+------------------------+------------+

    
</br>
</details>
</br>


- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

```sql
select a.nombre, c.materia, c.profesor from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-------------+------------+
    | nombre |   materia   |  profesor  |
    +--------+-------------+------------+
    | Juan   | Matemáticas | Profesor X |
    | Juan   | Historia    | Profesor Y |
    | María  | Literatura  | Profesor Z |
    | María  | Biología    | Profesor W |
    | Pedro  | Química     | Profesor V |
    | Pedro  | Física      | Profesor U |
    | Laura  | Arte        | Profesor T |
    | Laura  | Idiomas     | Profesor S |
    | Carlos | Economía    | Profesor R |
    | Ana    | Derecho     | Profesor Q |
    +--------+-------------+------------+
    
</br>
</details>
</br>


- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.

```sql
select a.nombre, a.edad, c.materia from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>


    +--------+------+-------------+
    | nombre | edad |   materia   |
    +--------+------+-------------+
    | Juan   | 20   | Matemáticas |
    | Juan   | 20   | Historia    |
    | María  | 21   | Literatura  |
    | María  | 21   | Biología    |
    | Pedro  | 19   | Química     |
    | Pedro  | 19   | Física      |
    | Laura  | 22   | Arte        |
    | Laura  | 22   | Idiomas     |
    | Carlos | 20   | Economía    |
    | Ana    | 19   | Derecho     |
    +--------+------+-------------+


    
</br>
</details>
</br>


- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.

```sql
 select a.nombre, a.direccion, c.profesor from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------+------------+
    | nombre | direccion |  profesor  |
    +--------+-----------+------------+
    | Juan   | Calle A   | Profesor X |
    | Juan   | Calle A   | Profesor Y |
    | María  | Calle B   | Profesor Z |
    | María  | Calle B   | Profesor W |
    | Pedro  | Calle C   | Profesor V |
    | Pedro  | Calle C   | Profesor U |
    | Laura  | Calle D   | Profesor T |
    | Laura  | Calle D   | Profesor S |
    | Carlos | Calle E   | Profesor R |
    | Ana    | Calle F   | Profesor Q |
    +--------+-----------+------------+
    
</br>
</details>
</br>


- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

```sql
select a.nombre, c.materia from Inscripciones as i join Alumnos as a on i.id_alumno = a.id join clases as c on i.id_clase = c.id order by a.nombre;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-------------+
    | nombre |   materia   |
    +--------+-------------+
    | Ana    | Derecho     |
    | Carlos | Economía    |
    | Juan   | Matemáticas |
    | Juan   | Historia    |
    | Laura  | Arte        |
    | Laura  | Idiomas     |
    | María  | Literatura  |
    | María  | Biología    |
    | Pedro  | Química     |
    | Pedro  | Física      |
    +--------+-------------+

    
</br>
</details>
</br>


- Contar cuántos alumnos están inscritos en cada clase.


```sql
select c.nombre, count(i.id_alumno) from inscripciones as i join clases as c on i.id_clase = c.id group by c.id order by i.id_alumno;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +------------------------+--------------------+
    |         nombre         | count(i.id_alumno) |
    +------------------------+--------------------+
    | Matemáticas 101        | 1                  |
    | Historia Antigua       | 1                  |
    | Literatura Moderna     | 1                  |
    | Biología Avanzada      | 1                  |
    | Química Orgánica       | 1                  |
    | Física Cuántica        | 1                  |
    | Arte Contemporáneo     | 1                  |
    | Inglés Avanzado        | 1                  |
    | Economía Internacional | 1                  |
    | Derecho Penal          | 1                  |
    +------------------------+--------------------+

</br>
</details>
</br>





</div>