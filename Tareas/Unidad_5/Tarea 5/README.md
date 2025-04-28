## Objetivo

_Practicar la creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

## Descripción

## Pasos:

### Paso 1: Creación de la BBDD

Crea con el siguente contenido el fichero __base-datos-libros.sql__.

```sql
-- Elimino la tabla autor si exite
DROP TABLE if EXISTS autor;
CREATE TABLE IF NOT EXISTS autor (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);
-- Elimino la tabla libro si existe
DROP table if EXISTS libro;
CREATE TABLE IF NOT EXISTS libro (
    codigo INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);

INSERT INTO autor (nombre) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('George Orwell'),
    ('Jane Austen'),
    ('Agatha Christie');

INSERT INTO libro (titulo, autor_id, editorial, precio) VALUES
    ('The Great Gatsby', 6, 'Charles Scribner''s Sons', 20.99),
    ('To Kill a Mockingbird', 7, 'J.B. Lippincott & Co.', 15.95),
    ('The Catcher in the Rye', 8, 'Little, Brown and Company', 18.75),
    ('One Hundred Years of Solitude', 9, 'Harper & Row', 22.50),
    ('Brave New World', 3, 'Chatto & Windus', 17.99),
    ('The Hobbit', 10, 'George Allen & Unwin', 24.99),
    ('The Lord of the Rings', 10, 'George Allen & Unwin', 35.50),
    ('The Chronicles of Narnia', 11, 'Geoffrey Bles', 28.99),
    ('The Odyssey', 12, 'Homer', 14.95),
    ('The Iliad', 12, 'Homer', 14.95),
    ('Moby-Dick', 13, 'Harper & Brothers', 19.99),
    ('The Road', 14, 'Alfred A. Knopf', 16.75),
    ('The Grapes of Wrath', 15, 'The Viking Press', 21.50),
    ('Wuthering Heights', 16, 'Emily Brontë', 12.99),
    ('The Old Man and the Sea', 17, 'Charles Scribner''s Sons', 18.95),
    ('The Count of Monte Cristo', 18, 'Pétion', 27.99),
    ('The Picture of Dorian Gray', 19, 'Ward, Lock, and Company', 14.50),
    ('The Adventures of Sherlock Holmes', 20, 'George Newnes', 16.99),
    ('Frankenstein', 21, 'Lackington, Hughes, Harding, Mavor, & Jones', 13.25),
    ('Alice''s Adventures in Wonderland', 22, 'Macmillan', 11.50),
    ('The Prince', 23, 'Niccolò Machiavelli', 10.99),
    ('Don Quixote', 24, 'Francisco de Robles', 26.75),
    ('The Divine Comedy', 25, 'Dante Alighieri', 20.50),
    ('Anna Karenina', 26, 'The Russian Messenger', 23.99),
    ('Les Misérables', 27, 'A. Lacroix, Verboeckhoven & Cie.', 29.75),
    ('The Jungle Book', 28, 'Macmillan Publishers', 14.99),
    ('The Wind in the Willows', 29, 'Methuen & Co.', 17.50),
    ('War and Peace', 26, 'The Russian Messenger', 33.25),
    ('Crime and Punishment', 30, 'The Russian Messenger', 19.99);
```

Igualmente considero que faltan los autores de varios libros, por lo que los buco y los añado a la tabla autor:
```sql
    INSERT INTO autor (id, nombre) VALUES
        (6, 'F. Scott Fitzgerald'),    
        (7, 'Harper Lee'),
        (8, 'J.D. Salinger'),
        (9, 'Gabriel García Márquez'),
        (10, 'J.R.R. Tolkien'),  
        (11, 'C.S. Lewis'),
        (12, 'Homero'),
        (13, 'Herman Melville'),
        (14, 'Cormac McCarthy'),
        (15, 'John Steinbeck'),
        (16, 'Emily Brontë'),
        (17, 'Ernest Hemingway'),
        (18, 'Alexandre Dumas'),
        (19, 'Oscar Wilde'),
        (20, 'Arthur Conan Doyle'),
        (21, 'Mary Shelley'),
        (22, 'Lewis Carroll'),
        (23, 'Niccolò Machiavelli'),
        (24, 'Miguel de Cervantes'),
        (25, 'Dante Alighieri'),
        (26, 'Leo Tolstoy'),
        (27, 'Victor Hugo'),
        (28, 'Rudyard Kipling'),
        (29, 'Kenneth Grahame'),
        (30, 'Fyodor Dostoevsky');

```
  
### Paso 2 Lectura del fichero sql.

Entra en sqlite a través del siguiente comando:

```sql
sqlite3 tarea5.db 
``` 

### Paso 3: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

-  Selección de libros cuyo título comienza con "H".
```sql
SELELEECT * FROM libro WHERE titulo REGEXP '^H';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

  No hay ningún libro que empize por H
    
</br>
</details>
</br>

- Libros escritos por autores cuyos nombres terminan con "ing".
```sql
Select libro.*, autor.nombre from libro join autor on libro.autor_id = autor.id where autor.nombre regexp 'ing$';;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------+----------+----------------------+--------+-----------------+
    | codigo |     titulo      | autor_id |      editorial       | precio |     nombre      |
    +--------+-----------------+----------+----------------------+--------+-----------------+
    | 26     | The Jungle Book | 28       | Macmillan Publishers | 14.99  | Rudyard Kipling |
    +--------+-----------------+----------+----------------------+--------+-----------------+   
    
</br>
</details>
</br>

-  Libros con títulos que contienen la palabra "and" en cualquier posición.
```sql
select * from libro where titulo regexp 'and';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+----------------------------------+----------+-------------------------+--------+
    | codigo |              titulo              | autor_id |        editorial        | precio |
    +--------+----------------------------------+----------+-------------------------+--------+
    | 15     | The Old Man and the Sea          | 17       | Charles Scribner's Sons | 18.95  |
    | 20     | Alice's Adventures in Wonderland | 22       | Macmillan               | 11.5   |
    | 28     | War and Peace                    | 26       | The Russian Messenger   | 33.25  |
    | 29     | Crime and Punishment             | 30       | The Russian Messenger   | 19.99  |
    +--------+----------------------------------+----------+-------------------------+--------+
    
</br>
</details>
</br>

- Libros cuyo título comienza con una vocal.
```sql
select * from libro where titulo regexp '^[AEIOUaeiou]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+----------------------------------+----------+-----------------------+--------+
    | codigo |              titulo              | autor_id |       editorial       | precio |
    +--------+----------------------------------+----------+-----------------------+--------+
    | 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
    | 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
    | 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |
    +--------+----------------------------------+----------+-----------------------+--------+
    
</br>
</details>
</br>


- Libros cuyo autor tiene al menos una vocal repetida.
```sql
Select libro.*, autor.nombre from libro join autor on libro.autor_id = autor.id where autor.nombre regexp '[AEIOUaeiou]*[AEIOUaeiou]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------------------------+--------+------------------------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |         nombre         |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+------------------------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  | F. Scott Fitzgerald    |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  | Harper Lee             |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  | J.D. Salinger          |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   | Gabriel García Márquez |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  | George Orwell          |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  | J.R.R. Tolkien         |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   | J.R.R. Tolkien         |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  | C.S. Lewis             |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  | Homero                 |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  | Homero                 |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  | Herman Melville        |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  | Cormac McCarthy        |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   | John Steinbeck         |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  | Emily Brontë           |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  | Ernest Hemingway       |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  | Alexandre Dumas        |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   | Oscar Wilde            |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  | Arthur Conan Doyle     |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  | Mary Shelley           |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   | Lewis Carroll          |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  | Niccolò Machiavelli    |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  | Miguel de Cervantes    |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   | Dante Alighieri        |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  | Leo Tolstoy            |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  | Victor Hugo            |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  | Rudyard Kipling        |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   | Kenneth Grahame        |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  | Leo Tolstoy            |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  | Fyodor Dostoevsky      |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+------------------------+

    
</br>
</details>
</br>


- Libros con precios que tienen dos dígitos decimales exactos.
```sql
select * from libro where precio REGEXP '\\.[0-9]{2}$';
```
***DUDA***
**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

   
    
</br>
</details>
</br>


- Libros cuyos títulos tienen al menos tres palabras.
```sql
SELECT * FROM libro WHERE titulo REGEXP '\\b\\w+\\b\\s\\b\\w+\\b\\s\\b\\w+\\b';
```
***DUDA***
**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

  
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre empieza con la letra "A":
```sql
select * from autor where nombre regexp '^A';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------------------+
    | id |       nombre       |
    +----+--------------------+
    | 5  | Agatha Christie    |
    | 18 | Alexandre Dumas    |
    | 20 | Arthur Conan Doyle |
    +----+--------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título contiene la palabra "SQL":
```sql
select * from libro where titulo regexp 'SQL';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    No hay libros que contengan la palabra SQL
    
</br>
</details>
</br>


-  Obtener todos los autores cuyo nombre termina con "ez":
```sql
select * from autor where nombre regexp 'ez$';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 9  | Gabriel García Márquez |
    +----+------------------------+
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:
```sql
select * from autor where LENGTH(nombre) >=5;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 1  | J.K. Rowling           |
    | 2  | Stephen King           |
    | 3  | George Orwell          |
    | 4  | Jane Austen            |
    | 5  | Agatha Christie        |
    | 6  | F. Scott Fitzgerald    |
    | 7  | Harper Lee             |
    | 8  | J.D. Salinger          |
    | 9  | Gabriel García Márquez |
    | 10 | J.R.R. Tolkien         |
    | 11 | C.S. Lewis             |
    | 12 | Homero                 |
    | 13 | Herman Melville        |
    | 14 | Cormac McCarthy        |
    | 15 | John Steinbeck         |
    | 16 | Emily Brontë           |
    | 17 | Ernest Hemingway       |
    | 18 | Alexandre Dumas        |
    | 19 | Oscar Wilde            |
    | 20 | Arthur Conan Doyle     |
    | 21 | Mary Shelley           |
    | 22 | Lewis Carroll          |
    | 23 | Niccolò Machiavelli    |
    | 24 | Miguel de Cervantes    |
    | 25 | Dante Alighieri        |
    | 26 | Leo Tolstoy            |
    | 27 | Victor Hugo            |
    | 28 | Rudyard Kipling        |
    | 29 | Kenneth Grahame        |
    | 30 | Fyodor Dostoevsky      |
    +----+------------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuya editorial es diferente de "Homer":
```sql
select * from libro where editorial regexp '[^Homer]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
        
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre contiene al menos una vocal:
```sql
select * from autor where nombre regexp '[aeiouAEIOU]';

```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>
    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 1  | J.K. Rowling           |
    | 2  | Stephen King           |
    | 3  | George Orwell          |
    | 4  | Jane Austen            |
    | 5  | Agatha Christie        |
    | 6  | F. Scott Fitzgerald    |
    | 7  | Harper Lee             |
    | 8  | J.D. Salinger          |
    | 9  | Gabriel García Márquez |
    | 10 | J.R.R. Tolkien         |
    | 11 | C.S. Lewis             |
    | 12 | Homero                 |
    | 13 | Herman Melville        |
    | 14 | Cormac McCarthy        |
    | 15 | John Steinbeck         |
    | 16 | Emily Brontë           |
    | 17 | Ernest Hemingway       |
    | 18 | Alexandre Dumas        |
    | 19 | Oscar Wilde            |
    | 20 | Arthur Conan Doyle     |
    | 21 | Mary Shelley           |
    | 22 | Lewis Carroll          |
    | 23 | Niccolò Machiavelli    |
    | 24 | Miguel de Cervantes    |
    | 25 | Dante Alighieri        |
    | 26 | Leo Tolstoy            |
    | 27 | Victor Hugo            |
    | 28 | Rudyard Kipling        |
    | 29 | Kenneth Grahame        |
    | 30 | Fyodor Dostoevsky      |
    +----+------------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título comienza con una letra mayúscula:
```sql
select * from libro where titulo regexp '^[A-Z]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+

    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre no contiene la letra "r":
```sql
select * from autor where nombre not regexp '[rR]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+---------------------+
    | id |       nombre        |
    +----+---------------------+
    | 2  | Stephen King        |
    | 4  | Jane Austen         |
    | 11 | C.S. Lewis          |
    | 15 | John Steinbeck      |
    | 23 | Niccolò Machiavelli |
    | 26 | Leo Tolstoy         |
    +----+---------------------+
        
</br>
</details>
</br>


- Seleccionar los libros cuya editorial empieza con la letra "P":
```sql
select * from libro where editorial regexp '^P';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+---------------------------+----------+-----------+--------+
    | codigo |          titulo           | autor_id | editorial | precio |
    +--------+---------------------------+----------+-----------+--------+
    | 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |
    +--------+---------------------------+----------+-----------+--------+

    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:
```sql
select * from autor where nombre regexp '^.{6}$';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------+
    | id | nombre |
    +----+--------+
    | 12 | Homero |
    +----+--------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título contiene al menos un número:
```sql
select * from libro where titulo regexp '[0-9]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    Ninguún libro tiene números en su titulo
    
</br>
</details>
</br>


-  Obtener todos los autores cuyo nombre inicia con una vocal:
```sql
 select * from autor where nombre regexp '^[AEIUOaeiou]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+--------------------+
    | id |       nombre       |
    +----+--------------------+
    | 5  | Agatha Christie    |
    | 16 | Emily Brontë       |
    | 17 | Ernest Hemingway   |
    | 18 | Alexandre Dumas    |
    | 19 | Oscar Wilde        |
    | 20 | Arthur Conan Doyle |
    +----+--------------------+
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre no contiene espacios en blanco:
```sql
select * from autor where nombre not regexp ' ' ;
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

   
    +----+--------+
    | id | nombre |
    +----+--------+
    | 12 | Homero |
    +----+--------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título termina con una vocal:
```sql
select * from libro where titulo regexp '[AEIOUaeiou]$';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-------------------------------+----------+---------------------------+--------+
    | codigo |            titulo             | autor_id |         editorial         | precio |
    +--------+-------------------------------+----------+---------------------------+--------+
    | 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
    | 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
    | 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
    | 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
    | 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
    | 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
    | 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
    | 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
    | 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |
    +--------+-------------------------------+----------+---------------------------+--------+
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre contiene la secuencia "er":
```sql
select * from autor where nombre regexp 'er';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+---------------------+
    | id |       nombre        |
    +----+---------------------+
    | 6  | F. Scott Fitzgerald |
    | 7  | Harper Lee          |
    | 8  | J.D. Salinger       |
    | 12 | Homero              |
    | 13 | Herman Melville     |
    | 24 | Miguel de Cervantes |
    | 25 | Dante Alighieri     |
    +----+---------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título empieza con la palabra "The":
```sql
select * from libro where titulo regexp '^The';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------+--------+
    | codigo |              titulo               | autor_id |         editorial         | precio |
    +--------+-----------------------------------+----------+---------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                     | 14.95  |
    | 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
    +--------+-----------------------------------+----------+---------------------------+--------+
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:
```sql
select * from autor where nombre regexp '[A-Z]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
| id |         nombre         |
+----+------------------------+
| 1  | J.K. Rowling           |
| 2  | Stephen King           |
| 3  | George Orwell          |
| 4  | Jane Austen            |
| 5  | Agatha Christie        |
| 6  | F. Scott Fitzgerald    |
| 7  | Harper Lee             |
| 8  | J.D. Salinger          |
| 9  | Gabriel García Márquez |
| 10 | J.R.R. Tolkien         |
| 11 | C.S. Lewis             |
| 12 | Homero                 |
| 13 | Herman Melville        |
| 14 | Cormac McCarthy        |
| 15 | John Steinbeck         |
| 16 | Emily Brontë           |
| 17 | Ernest Hemingway       |
| 18 | Alexandre Dumas        |
| 19 | Oscar Wilde            |
| 20 | Arthur Conan Doyle     |
| 21 | Mary Shelley           |
| 22 | Lewis Carroll          |
| 23 | Niccolò Machiavelli    |
| 24 | Miguel de Cervantes    |
| 25 | Dante Alighieri        |
| 26 | Leo Tolstoy            |
| 27 | Victor Hugo            |
| 28 | Rudyard Kipling        |
| 29 | Kenneth Grahame        |
| 30 | Fyodor Dostoevsky      |
+----+------------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:
```sql
select * from libro where precio regexp '^\\.[0-9]{2}$';

```

***DUDA***
**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre no contiene números:
```sql
select * from autor where nombre regexp '[^0-9]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 1  | J.K. Rowling           |
    | 2  | Stephen King           |
    | 3  | George Orwell          |
    | 4  | Jane Austen            |
    | 5  | Agatha Christie        |
    | 6  | F. Scott Fitzgerald    |
    | 7  | Harper Lee             |
    | 8  | J.D. Salinger          |
    | 9  | Gabriel García Márquez |
    | 10 | J.R.R. Tolkien         |
    | 11 | C.S. Lewis             |
    | 12 | Homero                 |
    | 13 | Herman Melville        |
    | 14 | Cormac McCarthy        |
    | 15 | John Steinbeck         |
    | 16 | Emily Brontë           |
    | 17 | Ernest Hemingway       |
    | 18 | Alexandre Dumas        |
    | 19 | Oscar Wilde            |
    | 20 | Arthur Conan Doyle     |
    | 21 | Mary Shelley           |
    | 22 | Lewis Carroll          |
    | 23 | Niccolò Machiavelli    |
    | 24 | Miguel de Cervantes    |
    | 25 | Dante Alighieri        |
    | 26 | Leo Tolstoy            |
    | 27 | Victor Hugo            |
    | 28 | Rudyard Kipling        |
    | 29 | Kenneth Grahame        |
    | 30 | Fyodor Dostoevsky      |
    +----+------------------------+
    
</br>
</details>
</br>


- Seleccionar los libros cuyo título contiene al menos tres vocales:
```sql
select * from libro where titulo regexp '[AEIOUaeiou].*[AEIOUaeiou].*[AEIOUaeiou]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
        
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre inicia con una consonante:
```sql
select * from autor where nombre regexp '^[^AEIOUaeiou]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 1  | J.K. Rowling           |
    | 2  | Stephen King           |
    | 3  | George Orwell          |
    | 4  | Jane Austen            |
    | 6  | F. Scott Fitzgerald    |
    | 7  | Harper Lee             |
    | 8  | J.D. Salinger          |
    | 9  | Gabriel García Márquez |
    | 10 | J.R.R. Tolkien         |
    | 11 | C.S. Lewis             |
    | 12 | Homero                 |
    | 13 | Herman Melville        |
    | 14 | Cormac McCarthy        |
    | 15 | John Steinbeck         |
    | 21 | Mary Shelley           |
    | 22 | Lewis Carroll          |
    | 23 | Niccolò Machiavelli    |
    | 24 | Miguel de Cervantes    |
    | 25 | Dante Alighieri        |
    | 26 | Leo Tolstoy            |
    | 27 | Victor Hugo            |
    | 28 | Rudyard Kipling        |
    | 29 | Kenneth Grahame        |
    | 30 | Fyodor Dostoevsky      |
    +----+------------------------+

    
</br>
</details>
</br>

- Seleccionar los libros cuyo título no contiene la palabra "Science":
```sql
select * from libro where titulo not regexp '\\bScience\\b';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | codigo |              titulo               | autor_id |                  editorial                  | precio |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    | 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
    | 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
    | 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
    | 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
    | 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
    | 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
    | 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
    | 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
    | 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
    | 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
    | 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
    | 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
    | 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
    | 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
    | 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
    | 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
    | 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
    | 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
    | 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
    | 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
    | 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
    | 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
    | 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
    | 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
    | 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
    | 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
    | 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
    | 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
    | 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
    +--------+-----------------------------------+----------+---------------------------------------------+--------+
    
</br>
</details>
</br>


- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:
```sql
select * from autor where nombre regexp '(.)\\1';
```
***DUDA***
**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

   
    
</br>
</details>
</br>

- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":
```sql
select * from autor where nombre regexp '^M|.*n$';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+---------------------+
    | id |       nombre        |
    +----+---------------------+
    | 4  | Jane Austen         |
    | 10 | J.R.R. Tolkien      |
    | 21 | Mary Shelley        |
    | 24 | Miguel de Cervantes |
    +----+---------------------+
    
</br>
</details>
</br>

- Obtener todos los autores cuyo nombre no contiene caracteres especiales:
```sql
select * from autor where nombre regexp '[a-zA-Z0-9]';
```

**Resultado:**

<details>
<summary>PULSA PARA VER EL RESULTADO DE LA TABLA</summary>
</br>

    +----+------------------------+
    | id |         nombre         |
    +----+------------------------+
    | 1  | J.K. Rowling           |
    | 2  | Stephen King           |
    | 3  | George Orwell          |
    | 4  | Jane Austen            |
    | 5  | Agatha Christie        |
    | 6  | F. Scott Fitzgerald    |
    | 7  | Harper Lee             |
    | 8  | J.D. Salinger          |
    | 9  | Gabriel García Márquez |
    | 10 | J.R.R. Tolkien         |
    | 11 | C.S. Lewis             |
    | 12 | Homero                 |
    | 13 | Herman Melville        |
    | 14 | Cormac McCarthy        |
    | 15 | John Steinbeck         |
    | 16 | Emily Brontë           |
    | 17 | Ernest Hemingway       |
    | 18 | Alexandre Dumas        |
    | 19 | Oscar Wilde            |
    | 20 | Arthur Conan Doyle     |
    | 21 | Mary Shelley           |
    | 22 | Lewis Carroll          |
    | 23 | Niccolò Machiavelli    |
    | 24 | Miguel de Cervantes    |
    | 25 | Dante Alighieri        |
    | 26 | Leo Tolstoy            |
    | 27 | Victor Hugo            |
    | 28 | Rudyard Kipling        |
    | 29 | Kenneth Grahame        |
    | 30 | Fyodor Dostoevsky      |
    +----+------------------------+

    
</br>
</details>
</br>





</div>
