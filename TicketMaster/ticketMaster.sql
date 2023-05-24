SELECT 'HOLA MUNDO';
SELECT 'PRUEBA DE ACTUALIZACION';

# --------------------- CREACION DE SCHEMA ----------------------- #
CREATE SCHEMA ticket_master;
USE ticket_master;
# ---------------------------- TABLAS ---------------------------- #
CREATE TABLE Artistas(
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(30) NOT NULL,
        genero VARCHAR(30) NOT NULL
);

CREATE TABLE Lugares(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50)
);

CREATE TABLE Eventos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idArtista INT NOT NULL,
    idLugar INT NOT NULL,
    fechaHora DATETIME NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (idArtista) REFERENCES Artistas(id),
    FOREIGN KEY (idLugar) REFERENCES Lugares(id)    
);

CREATE TABLE Zonas(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idLugar INT NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL,
    FOREIGN KEY(idLugar) REFERENCES Lugares(id)
);

CREATE TABLE Boletos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idEvento INT NOT NULL,
    idZona INT NOT NULL,
    precio INT NOT NULL,
    FOREIGN KEY(idEvento) REFERENCES Eventos(id),
    FOREIGN KEY(idZona) REFERENCES Zonas(id)
);

CREATE TABLE Asientos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idZona INT NOT NULL,
    fila INT NOT NULL,
    numero INT NOT NULL,
	disponible BOOLEAN NOT NULL,
    FOREIGN KEY(idZona) REFERENCES Zonas(id)
);


CREATE TABLE Clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pwd VARCHAR(50) NOT NULL
);

CREATE TABLE FormasDePago(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Tickets(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idBoleto INT NOT NULL,
    idAsiento INT NOT NULL,
    idCliente INT NOT NULL,
    idFormaDePago INT NOT NULL,
    fechaCompra DATETIME NOT NULL,
    FOREIGN KEY(idBoleto) REFERENCES Boletos(id),
    FOREIGN KEY(idAsiento) REFERENCES Asientos(id),
    FOREIGN KEY(idCliente) REFERENCES Clientes(id),
    FOREIGN KEY(idFormaDePago) REFERENCES FormasDePago(id)
);

# ------------------------------ INSERCIÓN DE DATOS -------------------------------- #

# ---------------------------- ARTISTAS ---------------------------- #
insert into Artistas (nombre, genero) values ('Luis Miguel', 'Musica');
insert into Artistas (nombre, genero) values ('Daniela Spalla', 'Musica');
insert into Artistas (nombre, genero) values ('Javier Santaolalla', 'Conferencia');
insert into Artistas (nombre, genero) values ('Ha Ash', 'Musica');
insert into Artistas (nombre, genero) values ('Vaselina', 'Teatro');
insert into Artistas (nombre, genero) values ('Canelo', 'Box');
SELECT * FROM Artistas

# ---------------------------- LUGARES ---------------------------- #

insert into Lugares (nombre, direccion) values ('Auditorio Monterrey', '927 Carpenter Parkway');
insert into Lugares (nombre, direccion) values ('Auditorio Luis Elizondo', '42022 Hoepker Point');
insert into Lugares (nombre, direccion) values ('Auditorio Eladio Saenz Quiroga ', '08007 Cordelia Place');
insert into Lugares (nombre, direccion) values ('Auditorio CitiBanamex ', '20 Lakeland Pass');
insert into Lugares (nombre, direccion) values ('Auditorio Guemercindo Cantu ', '47145 Lawn Way');
SELECT * FROM Lugares;

# ---------------------------- Eventos ---------------------------- #
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (1,6, NOW() ,'El sol de mexico en su gira nacional', 'Gira Luis Miguel');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (2,9, '2023-12-28 13:00:00' ,'Daniella Spalla viene a mexico! ', 'Concierto Daniella Spalla');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (3,10, '2023-12-28 13:00:00' ,'Conferencia impartida por Javier Santaolalla ', 'Date un Voltio');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (4,8, '2023-06-28 13:00:00' ,'Gira 23-24 Ha Ash', 'Concierto Ha Ash');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (5,7, '2023-06-28 13:00:00' ,'Obra de Teatro', 'Vaselina');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (6,6, '2023-12-28 13:00:00' ,'Canelo vs Jhon Ryder', 'Final de box');
SELECT * FROM Eventos;

# ---------------------------- Zonas ---------------------------- #
SELECT * FROM Zonas;
                        #Auditorio Monterrey
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Platino', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Oro', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Plata', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Butaca', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Cancha General', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Luneta', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Luenta especial', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (6 , 'Balcon', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (6 , 'Preferente', 10);

						#Auditorio Luiz Elizondo
insert into Zonas (idLugar , descripcion ,Capacidad) values (7 , 'Orquesta Izquierda', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (7 , 'Luneta A', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (7 , 'Luneta B', 10);

						#Auditorio Eladio Saenz Quiroga
insert into Zonas (idLugar , descripcion ,Capacidad) values (8 , 'General', 10);

						#Auditorio Citibanamex
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Beyond VIP', 10);         
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Beyond Oro', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Beyond Plata', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Beyond', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Platinum', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Platinum B', 10);         
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Platinum C', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles A', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles B', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles C', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles D', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles E', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles F', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (9 , 'Perfiles G', 10); 

						#Auditorio Guemercindo Cantu
insert into Zonas (idLugar , descripcion ,Capacidad) values (10 , 'General', 10);


# ---------------------------- Asientos ---------------------------- #
select  * from Asientos;
select * from Zonas;

-- idZona = 1
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(1, 1, 10 , TRUE);

-- idZona = 2
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(2, 1, 10 , TRUE);

-- idZona = 3
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(3, 1, 10 , TRUE);

-- idZona = 4
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(4, 1, 10 , TRUE);

-- idZona = 5
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(5, 1, 10 , TRUE);

-- idZona = 6
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(6, 1, 10 , TRUE);

-- idZona = 7
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(7, 1, 10 , TRUE);

-- idZona = 8
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(8, 1, 10 , TRUE);

-- idZona = 9
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(9, 1, 10 , TRUE);

-- idZona = 10
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(10, 1, 10 , TRUE);

-- idZona = 11
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(11, 1, 10 , TRUE);

-- idZona = 12
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 1, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 2, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 3, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 4, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 5, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 6, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 7, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 8, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 9, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (12, 1, 10, TRUE);

-- idZona = 13
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 1, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 2, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 3, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 4, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 5, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 6, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 7, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 8, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 9, TRUE);
INSERT INTO Asientos(idZona, fila, numero, disponible) VALUES (13, 1, 10, TRUE);

-- idZona = 14
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(14, 1, 10 , TRUE);

-- idZona = 15
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(15, 1, 10 , TRUE);

-- idZona = 16
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(16, 1, 10 , TRUE);

-- idZona = 17
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(17, 1, 10 , TRUE);

-- idZona = 18
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(18, 1, 10 , TRUE);

-- idZona = 19
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(19, 1, 10 , TRUE);

-- idZona = 20
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(20, 1, 10 , TRUE);

-- idZona = 21
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(21, 1, 10 , TRUE);

-- idZona = 22
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(22, 1, 10 , TRUE);

-- idZona = 23
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(23, 1, 10 , TRUE);

-- idZona = 24
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(24, 1, 10 , TRUE);

-- Zona 25
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(25, 1, 10 , TRUE);

-- Zona 26
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(26, 1, 10 , TRUE);

-- idZona = 27
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(27, 1, 10 , TRUE);


-- idZona = 28
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 1 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 2 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 3 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 4 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 5 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 6 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 7 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 8 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 9 , TRUE);
insert into Asientos(idZona, fila, numero, disponible) values(28, 1, 10 , TRUE);

# ---------------------------- Clientes ---------------------------- #

Select * from Clientes;

INSERT INTO Clientes(nombre, email, pwd) VALUES('Johann', 'johann@email.com', '123456');
INSERT INTO Clientes(nombre, email, pwd) VALUES('Felix', 'felix@email.com', '12345678');
INSERT INTO Clientes(nombre, email, pwd) VALUES('Juan', 'juan@email.com', '1234567891');

select * from artistas, boletos


