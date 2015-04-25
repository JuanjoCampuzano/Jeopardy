-- INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');
--Crear estos primero 
INSERT INTO Alumno (nombre) VALUES ('Alejandro');
INSERT INTO Alumno (nombre) VALUES ('Alfredo');
INSERT INTO Alumno (nombre) VALUES ('Juanjo');

-- Tabla de usuario 
INSERT INTO Usuario (username, password) VALUES ('A', 'A');
INSERT INTO Usuario (username, password) VALUES ('B', 'B');
INSERT INTO Usuario (username, password) VALUES ('C', 'C');

---Crear estos segundo 
INSERT INTO Clase (nombre) VALUES ('Matematicas');
INSERT INTO Clase (nombre) VALUES ('Arte');
INSERT INTO Clase (nombre) VALUES ('Programacion');

--Crear estos tercero 
-- Los valores de la clase de matematicas
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Matematicas'),'Calculo');
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Matematicas'),'Trigonometria');
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Matematicas'),'Ecuaciones');
-- Los valores de la clase de ciencia 
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Arte'),'Colores');
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Arte'),'Figuras');
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Arte'),'Pinturas');
-- Los valores de la clase de programacion
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Programacion'),'C' );
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Programacion'),'Java' );
INSERT INTO Tema (id_clase, nombre) VALUES ((SELECT Id FROM Clase WHERE Clase.nombre='Programacion'),'Progra' );


INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 1 + 1', '2', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Calculo')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 2 + 2', '4', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Calculo')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 2 + 3', '5', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Calculo'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 3 + 3', '6', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Calculo'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 3 + 4', '7', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Calculo'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 4 * 1', '4', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Trigonometria'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 5 * 1', '5', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Trigonometria'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 6 * 1', '6', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Trigonometria'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 7 * 1', '7', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Trigonometria'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 8 * 1', '8', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Trigonometria'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 4 / 4', '1', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Ecuaciones'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 5 / 5', '1', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Ecuaciones'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 6 / 6', '1', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Ecuaciones'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 7 / 7', '1', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Ecuaciones'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuanto es 8 / 8', '1', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Ecuaciones'));

--Preguntas de Colores, Figuras, Pinturas
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Color de sangre', 'rojo', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Colores')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Color de plantas', 'verde', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Colores')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Color de cielo', 'azul', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Colores'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Color de pollos', 'amarillo', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Colores'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Color de barney el dinosaurio', 'morado', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Colores'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lados de traingulo', '3', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Figuras'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lados de circulo', '0', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Figuras'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lados de cuadrado', '4', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Figuras'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lados de hexagono', '6', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Figuras'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lados de octagono', '8', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Figuras'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Marca de pintura con D', 'doal', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Pinturas'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Marca de pintura con B', 'berel', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Pinturas'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Tecnica de pintura con A', 'acrilico', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Pinturas'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Tecnica de pintura con O', 'oleo', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Pinturas'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Realizo leonardo davinici \'el grito\'', 'no', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Pinturas'));

--Preguntas de C, Java, Progra
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Como declaras una variable int', 'int', 0, (SELECT Id FROM Tema WHERE Tema.nombre='C')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Que es una arreglo de caracteres', 'string', 1, (SELECT Id FROM Tema WHERE Tema.nombre='C')); 
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Existen arreglos en C', 'no', 2, (SELECT Id FROM Tema WHERE Tema.nombre='C'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Existen Strings en C', 'no', 3, (SELECT Id FROM Tema WHERE Tema.nombre='C'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Como guardas strings', 'char', 4, (SELECT Id FROM Tema WHERE Tema.nombre='C'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('IDE que usamos', 'netbeans', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Java'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Con que letra empieza un lenguje que le sigue \'ava\'', 'J', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Java'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Lenguaje favorito de pablo diaz', 'java', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Java'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Equivalente a vector', 'arraylist', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Java'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Para meter valores en java que se usa', 'scanner', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Java'));

INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Nombre de un valor definido', 'variable', 0, (SELECT Id FROM Tema WHERE Tema.nombre='Progra'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Cuando haces iteraciones con una variable i', 'for', 1, (SELECT Id FROM Tema WHERE Tema.nombre='Progra'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Arraglo de caracteres', 'string', 2, (SELECT Id FROM Tema WHERE Tema.nombre='Progra'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Varialbe que empieza con I', 'int', 3, (SELECT Id FROM Tema WHERE Tema.nombre='Progra'));
INSERT INTO Pista (pregunta,respuesta, difficulty, id_tema) VALUES ('Iteracion que sigue hasta que se cumple', 'while', 4, (SELECT Id FROM Tema WHERE Tema.nombre='Progra'));




