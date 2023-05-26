# ----------------------------------------------------------------------------- CREACION DE SCHEMA ------------------------------------------------------------------------------- #
DROP SCHEMA IF EXISTS ticket_master;
CREATE SCHEMA ticket_master;
USE ticket_master;
# ------------------------------------------------------------------------------------ TABLAS ------------------------------------------------------------------------------------ #
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

CREATE TABLE Asientos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idZona INT NOT NULL,
    fila INT NOT NULL,
    numero INT NOT NULL,
    FOREIGN KEY(idZona) REFERENCES Zonas(id)
);

CREATE TABLE Boletos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idEvento INT NOT NULL,
    idAsiento INT NOT NULL,
    precio INT NOT NULL,
    disponible INT NOT NULL,
    FOREIGN KEY(idEvento) REFERENCES Eventos(id),
    FOREIGN KEY(idAsiento) REFERENCES Asientos(id)
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
    idCliente INT NOT NULL,
    idFormaDePago INT NOT NULL,
    fechaCompra DATETIME NOT NULL,
    FOREIGN KEY(idBoleto) REFERENCES Boletos(id),
    FOREIGN KEY(idCliente) REFERENCES Clientes(id),
    FOREIGN KEY(idFormaDePago) REFERENCES FormasDePago(id)
);
# -------------------------------------------------------------------------------------- INSERCIÓN DE DATOS ---------------------------------------------------------------------------------------- #

# ---------------------------- ARTISTAS ---------------------------- #
insert into Artistas (nombre, genero) values ('Luis Miguel', 'Musica');
insert into Artistas (nombre, genero) values ('Daniela Spalla', 'Musica');
insert into Artistas (nombre, genero) values ('Javier Santaolalla', 'Conferencia');
insert into Artistas (nombre, genero) values ('Ha Ash', 'Musica');
insert into Artistas (nombre, genero) values ('Vaselina', 'Teatro');
insert into Artistas (nombre, genero) values ('Canelo', 'Box');


# ---------------------------- LUGARES ---------------------------- #

insert into Lugares (nombre, direccion) values ('Auditorio Monterrey', '927 Carpenter Parkway');
insert into Lugares (nombre, direccion) values ('Auditorio Luis Elizondo', '42022 Hoepker Point'); 
insert into Lugares (nombre, direccion) values ('Auditorio Eladio Saenz Quiroga ', '08007 Cordelia Place'); 
insert into Lugares (nombre, direccion) values ('Auditorio CitiBanamex ', '20 Lakeland Pass'); 
insert into Lugares (nombre, direccion) values ('Auditorio Guemercindo Cantu ', '47145 Lawn Way');


# ---------------------------- Eventos ---------------------------- #
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (1,1, '2023-12-28 13:00:00' ,'El sol de mexico en su gira nacional', 'Gira Luis Miguel');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (2,4, '2023-12-28 13:00:00' ,'Daniella Spalla viene a mexico! ', 'Concierto Daniella Spalla');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (3,5, '2023-12-28 13:00:00' ,'Conferencia impartida por Javier Santaolalla ', 'Date un Voltio');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (4,3, '2023-06-28 13:00:00' ,'Gira 23-24 Ha Ash', 'Concierto Ha Ash');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (5,2, '2023-06-28 13:00:00' ,'Obra de Teatro', 'Vaselina');
insert into Eventos (idArtista, idLugar, fechaHora, descripcion, nombre) values (6,1, '2023-12-28 13:00:00' ,'Canelo vs Jhon Ryder', 'Final de box');


# ---------------------------- Zonas ---------------------------- #

                        #Auditorio Monterrey
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Platino', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Oro', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Plata', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Butaca', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Cancha General', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Luneta', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Luenta especial', 10);
insert into Zonas (idLugar , descripcion, Capacidad) values (1, 'Balcon', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (1, 'Preferente', 10);

						#Auditorio Luiz Elizondo
insert into Zonas (idLugar , descripcion ,Capacidad) values (2 , 'Orquesta Izquierda', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (2, 'Luneta A', 10);
insert into Zonas (idLugar , descripcion ,Capacidad) values (2, 'Luneta B', 10);

						#Auditorio Eladio Saenz Quiroga
insert into Zonas (idLugar , descripcion ,Capacidad) values (3 , 'General', 10);

						#Auditorio Citibanamex
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Beyond VIP', 10);         
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Beyond Oro', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Beyond Plata', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Beyond', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Platinum', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Platinum B', 10);         
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Platinum C', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles A', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles B', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles C', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles D', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles E', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles F', 10); 
insert into Zonas (idLugar , descripcion ,Capacidad) values (4 , 'Perfiles G', 10); 

						#Auditorio Guemercindo Cantu
insert into Zonas (idLugar , descripcion ,Capacidad) values (5 , 'General', 10);


# ---------------------------- Asientos ---------------------------- #


-- idZona = 1
insert into Asientos(idZona, fila, numero) values(1, 1, 1 );
insert into Asientos(idZona, fila, numero) values(1, 1, 2 );
insert into Asientos(idZona, fila, numero) values(1, 1, 3 );
insert into Asientos(idZona, fila, numero) values(1, 1, 4 );
insert into Asientos(idZona, fila, numero) values(1, 1, 5 );
insert into Asientos(idZona, fila, numero) values(1, 1, 6 );
insert into Asientos(idZona, fila, numero) values(1, 1, 7 );
insert into Asientos(idZona, fila, numero) values(1, 1, 8 );
insert into Asientos(idZona, fila, numero) values(1, 1, 9 );
insert into Asientos(idZona, fila, numero) values(1, 1, 10 );

-- idZona = 2
insert into Asientos(idZona, fila, numero) values(2, 1, 1 );
insert into Asientos(idZona, fila, numero) values(2, 1, 2 );
insert into Asientos(idZona, fila, numero) values(2, 1, 3 );
insert into Asientos(idZona, fila, numero) values(2, 1, 4 );
insert into Asientos(idZona, fila, numero) values(2, 1, 5 );
insert into Asientos(idZona, fila, numero) values(2, 1, 6 );
insert into Asientos(idZona, fila, numero) values(2, 1, 7 );
insert into Asientos(idZona, fila, numero) values(2, 1, 8 );
insert into Asientos(idZona, fila, numero) values(2, 1, 9 );
insert into Asientos(idZona, fila, numero) values(2, 1, 10 );

-- idZona = 3
insert into Asientos(idZona, fila, numero) values(3, 1, 1 );
insert into Asientos(idZona, fila, numero) values(3, 1, 2 );
insert into Asientos(idZona, fila, numero) values(3, 1, 3 );
insert into Asientos(idZona, fila, numero) values(3, 1, 4 );
insert into Asientos(idZona, fila, numero) values(3, 1, 5 );
insert into Asientos(idZona, fila, numero) values(3, 1, 6 );
insert into Asientos(idZona, fila, numero) values(3, 1, 7 );
insert into Asientos(idZona, fila, numero) values(3, 1, 8 );
insert into Asientos(idZona, fila, numero) values(3, 1, 9 );
insert into Asientos(idZona, fila, numero) values(3, 1, 10 );

-- idZona = 4
insert into Asientos(idZona, fila, numero) values(4, 1, 1 );
insert into Asientos(idZona, fila, numero) values(4, 1, 2 );
insert into Asientos(idZona, fila, numero) values(4, 1, 3 );
insert into Asientos(idZona, fila, numero) values(4, 1, 4 );
insert into Asientos(idZona, fila, numero) values(4, 1, 5 );
insert into Asientos(idZona, fila, numero) values(4, 1, 6 );
insert into Asientos(idZona, fila, numero) values(4, 1, 7 );
insert into Asientos(idZona, fila, numero) values(4, 1, 8 );
insert into Asientos(idZona, fila, numero) values(4, 1, 9 );
insert into Asientos(idZona, fila, numero) values(4, 1, 10 );

-- idZona = 5
insert into Asientos(idZona, fila, numero) values(5, 1, 1 );
insert into Asientos(idZona, fila, numero) values(5, 1, 2 );
insert into Asientos(idZona, fila, numero) values(5, 1, 3 );
insert into Asientos(idZona, fila, numero) values(5, 1, 4 );
insert into Asientos(idZona, fila, numero) values(5, 1, 5 );
insert into Asientos(idZona, fila, numero) values(5, 1, 6 );
insert into Asientos(idZona, fila, numero) values(5, 1, 7 );
insert into Asientos(idZona, fila, numero) values(5, 1, 8 );
insert into Asientos(idZona, fila, numero) values(5, 1, 9 );
insert into Asientos(idZona, fila, numero) values(5, 1, 10 );

-- idZona = 6
insert into Asientos(idZona, fila, numero) values(6, 1, 1 );
insert into Asientos(idZona, fila, numero) values(6, 1, 2 );
insert into Asientos(idZona, fila, numero) values(6, 1, 3 );
insert into Asientos(idZona, fila, numero) values(6, 1, 4 );
insert into Asientos(idZona, fila, numero) values(6, 1, 5 );
insert into Asientos(idZona, fila, numero) values(6, 1, 6 );
insert into Asientos(idZona, fila, numero) values(6, 1, 7 );
insert into Asientos(idZona, fila, numero) values(6, 1, 8 );
insert into Asientos(idZona, fila, numero) values(6, 1, 9 );
insert into Asientos(idZona, fila, numero) values(6, 1, 10 );

-- idZona = 7
insert into Asientos(idZona, fila, numero) values(7, 1, 1 );
insert into Asientos(idZona, fila, numero) values(7, 1, 2 );
insert into Asientos(idZona, fila, numero) values(7, 1, 3 );
insert into Asientos(idZona, fila, numero) values(7, 1, 4 );
insert into Asientos(idZona, fila, numero) values(7, 1, 5 );
insert into Asientos(idZona, fila, numero) values(7, 1, 6 );
insert into Asientos(idZona, fila, numero) values(7, 1, 7 );
insert into Asientos(idZona, fila, numero) values(7, 1, 8 );
insert into Asientos(idZona, fila, numero) values(7, 1, 9 );
insert into Asientos(idZona, fila, numero) values(7, 1, 10 );

-- idZona = 8
insert into Asientos(idZona, fila, numero) values(8, 1, 1 );
insert into Asientos(idZona, fila, numero) values(8, 1, 2 );
insert into Asientos(idZona, fila, numero) values(8, 1, 3 );
insert into Asientos(idZona, fila, numero) values(8, 1, 4 );
insert into Asientos(idZona, fila, numero) values(8, 1, 5 );
insert into Asientos(idZona, fila, numero) values(8, 1, 6 );
insert into Asientos(idZona, fila, numero) values(8, 1, 7 );
insert into Asientos(idZona, fila, numero) values(8, 1, 8 );
insert into Asientos(idZona, fila, numero) values(8, 1, 9 );
insert into Asientos(idZona, fila, numero) values(8, 1, 10 );

-- idZona = 9
insert into Asientos(idZona, fila, numero) values(9, 1, 1 );
insert into Asientos(idZona, fila, numero) values(9, 1, 2 );
insert into Asientos(idZona, fila, numero) values(9, 1, 3 );
insert into Asientos(idZona, fila, numero) values(9, 1, 4 );
insert into Asientos(idZona, fila, numero) values(9, 1, 5 );
insert into Asientos(idZona, fila, numero) values(9, 1, 6 );
insert into Asientos(idZona, fila, numero) values(9, 1, 7 );
insert into Asientos(idZona, fila, numero) values(9, 1, 8 );
insert into Asientos(idZona, fila, numero) values(9, 1, 9 );
insert into Asientos(idZona, fila, numero) values(9, 1, 10 );

-- idZona = 10
insert into Asientos(idZona, fila, numero) values(10, 1, 1 );
insert into Asientos(idZona, fila, numero) values(10, 1, 2 );
insert into Asientos(idZona, fila, numero) values(10, 1, 3 );
insert into Asientos(idZona, fila, numero) values(10, 1, 4 );
insert into Asientos(idZona, fila, numero) values(10, 1, 5 );
insert into Asientos(idZona, fila, numero) values(10, 1, 6 );
insert into Asientos(idZona, fila, numero) values(10, 1, 7 );
insert into Asientos(idZona, fila, numero) values(10, 1, 8 );
insert into Asientos(idZona, fila, numero) values(10, 1, 9 );
insert into Asientos(idZona, fila, numero) values(10, 1, 10 );

-- idZona = 11
insert into Asientos(idZona, fila, numero) values(11, 1, 1 );
insert into Asientos(idZona, fila, numero) values(11, 1, 2 );
insert into Asientos(idZona, fila, numero) values(11, 1, 3 );
insert into Asientos(idZona, fila, numero) values(11, 1, 4 );
insert into Asientos(idZona, fila, numero) values(11, 1, 5 );
insert into Asientos(idZona, fila, numero) values(11, 1, 6 );
insert into Asientos(idZona, fila, numero) values(11, 1, 7 );
insert into Asientos(idZona, fila, numero) values(11, 1, 8 );
insert into Asientos(idZona, fila, numero) values(11, 1, 9 );
insert into Asientos(idZona, fila, numero) values(11, 1, 10 );

-- idZona = 12
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 1);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 2);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 3);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 4);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 5);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 6);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 7);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 8);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 9);
INSERT INTO Asientos(idZona, fila, numero) VALUES (12, 1, 10);

-- idZona = 13
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 1);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 2);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 3);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 4);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 5);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 6);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 7);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 8);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 9);
INSERT INTO Asientos(idZona, fila, numero) VALUES (13, 1, 10);

-- idZona = 14
insert into Asientos(idZona, fila, numero) values(14, 1, 1 );
insert into Asientos(idZona, fila, numero) values(14, 1, 2 );
insert into Asientos(idZona, fila, numero) values(14, 1, 3 );
insert into Asientos(idZona, fila, numero) values(14, 1, 4 );
insert into Asientos(idZona, fila, numero) values(14, 1, 5 );
insert into Asientos(idZona, fila, numero) values(14, 1, 6 );
insert into Asientos(idZona, fila, numero) values(14, 1, 7 );
insert into Asientos(idZona, fila, numero) values(14, 1, 8 );
insert into Asientos(idZona, fila, numero) values(14, 1, 9 );
insert into Asientos(idZona, fila, numero) values(14, 1, 10 );

-- idZona = 15
insert into Asientos(idZona, fila, numero) values(15, 1, 1 );
insert into Asientos(idZona, fila, numero) values(15, 1, 2 );
insert into Asientos(idZona, fila, numero) values(15, 1, 3 );
insert into Asientos(idZona, fila, numero) values(15, 1, 4 );
insert into Asientos(idZona, fila, numero) values(15, 1, 5 );
insert into Asientos(idZona, fila, numero) values(15, 1, 6 );
insert into Asientos(idZona, fila, numero) values(15, 1, 7 );
insert into Asientos(idZona, fila, numero) values(15, 1, 8 );
insert into Asientos(idZona, fila, numero) values(15, 1, 9 );
insert into Asientos(idZona, fila, numero) values(15, 1, 10 );

-- idZona = 16
insert into Asientos(idZona, fila, numero) values(16, 1, 1 );
insert into Asientos(idZona, fila, numero) values(16, 1, 2 );
insert into Asientos(idZona, fila, numero) values(16, 1, 3 );
insert into Asientos(idZona, fila, numero) values(16, 1, 4 );
insert into Asientos(idZona, fila, numero) values(16, 1, 5 );
insert into Asientos(idZona, fila, numero) values(16, 1, 6 );
insert into Asientos(idZona, fila, numero) values(16, 1, 7 );
insert into Asientos(idZona, fila, numero) values(16, 1, 8 );
insert into Asientos(idZona, fila, numero) values(16, 1, 9 );
insert into Asientos(idZona, fila, numero) values(16, 1, 10 );

-- idZona = 17
insert into Asientos(idZona, fila, numero) values(17, 1, 1 );
insert into Asientos(idZona, fila, numero) values(17, 1, 2 );
insert into Asientos(idZona, fila, numero) values(17, 1, 3 );
insert into Asientos(idZona, fila, numero) values(17, 1, 4 );
insert into Asientos(idZona, fila, numero) values(17, 1, 5 );
insert into Asientos(idZona, fila, numero) values(17, 1, 6 );
insert into Asientos(idZona, fila, numero) values(17, 1, 7 );
insert into Asientos(idZona, fila, numero) values(17, 1, 8 );
insert into Asientos(idZona, fila, numero) values(17, 1, 9 );
insert into Asientos(idZona, fila, numero) values(17, 1, 10 );

-- idZona = 18
insert into Asientos(idZona, fila, numero) values(18, 1, 1 );
insert into Asientos(idZona, fila, numero) values(18, 1, 2 );
insert into Asientos(idZona, fila, numero) values(18, 1, 3 );
insert into Asientos(idZona, fila, numero) values(18, 1, 4 );
insert into Asientos(idZona, fila, numero) values(18, 1, 5 );
insert into Asientos(idZona, fila, numero) values(18, 1, 6 );
insert into Asientos(idZona, fila, numero) values(18, 1, 7 );
insert into Asientos(idZona, fila, numero) values(18, 1, 8 );
insert into Asientos(idZona, fila, numero) values(18, 1, 9 );
insert into Asientos(idZona, fila, numero) values(18, 1, 10 );

-- idZona = 19
insert into Asientos(idZona, fila, numero) values(19, 1, 1 );
insert into Asientos(idZona, fila, numero) values(19, 1, 2 );
insert into Asientos(idZona, fila, numero) values(19, 1, 3 );
insert into Asientos(idZona, fila, numero) values(19, 1, 4 );
insert into Asientos(idZona, fila, numero) values(19, 1, 5 );
insert into Asientos(idZona, fila, numero) values(19, 1, 6 );
insert into Asientos(idZona, fila, numero) values(19, 1, 7 );
insert into Asientos(idZona, fila, numero) values(19, 1, 8 );
insert into Asientos(idZona, fila, numero) values(19, 1, 9 );
insert into Asientos(idZona, fila, numero) values(19, 1, 10 );

-- idZona = 20
insert into Asientos(idZona, fila, numero) values(20, 1, 1 );
insert into Asientos(idZona, fila, numero) values(20, 1, 2 );
insert into Asientos(idZona, fila, numero) values(20, 1, 3 );
insert into Asientos(idZona, fila, numero) values(20, 1, 4 );
insert into Asientos(idZona, fila, numero) values(20, 1, 5 );
insert into Asientos(idZona, fila, numero) values(20, 1, 6 );
insert into Asientos(idZona, fila, numero) values(20, 1, 7 );
insert into Asientos(idZona, fila, numero) values(20, 1, 8 );
insert into Asientos(idZona, fila, numero) values(20, 1, 9 );
insert into Asientos(idZona, fila, numero) values(20, 1, 10 );

-- idZona = 21
insert into Asientos(idZona, fila, numero) values(21, 1, 1 );
insert into Asientos(idZona, fila, numero) values(21, 1, 2 );
insert into Asientos(idZona, fila, numero) values(21, 1, 3 );
insert into Asientos(idZona, fila, numero) values(21, 1, 4 );
insert into Asientos(idZona, fila, numero) values(21, 1, 5 );
insert into Asientos(idZona, fila, numero) values(21, 1, 6 );
insert into Asientos(idZona, fila, numero) values(21, 1, 7 );
insert into Asientos(idZona, fila, numero) values(21, 1, 8 );
insert into Asientos(idZona, fila, numero) values(21, 1, 9 );
insert into Asientos(idZona, fila, numero) values(21, 1, 10 );

-- idZona = 22
insert into Asientos(idZona, fila, numero) values(22, 1, 1 );
insert into Asientos(idZona, fila, numero) values(22, 1, 2 );
insert into Asientos(idZona, fila, numero) values(22, 1, 3 );
insert into Asientos(idZona, fila, numero) values(22, 1, 4 );
insert into Asientos(idZona, fila, numero) values(22, 1, 5 );
insert into Asientos(idZona, fila, numero) values(22, 1, 6 );
insert into Asientos(idZona, fila, numero) values(22, 1, 7 );
insert into Asientos(idZona, fila, numero) values(22, 1, 8 );
insert into Asientos(idZona, fila, numero) values(22, 1, 9 );
insert into Asientos(idZona, fila, numero) values(22, 1, 10 );

-- idZona = 23
insert into Asientos(idZona, fila, numero) values(23, 1, 1 );
insert into Asientos(idZona, fila, numero) values(23, 1, 2 );
insert into Asientos(idZona, fila, numero) values(23, 1, 3 );
insert into Asientos(idZona, fila, numero) values(23, 1, 4 );
insert into Asientos(idZona, fila, numero) values(23, 1, 5 );
insert into Asientos(idZona, fila, numero) values(23, 1, 6 );
insert into Asientos(idZona, fila, numero) values(23, 1, 7 );
insert into Asientos(idZona, fila, numero) values(23, 1, 8 );
insert into Asientos(idZona, fila, numero) values(23, 1, 9 );
insert into Asientos(idZona, fila, numero) values(23, 1, 10 );

-- idZona = 24
insert into Asientos(idZona, fila, numero) values(24, 1, 1 );
insert into Asientos(idZona, fila, numero) values(24, 1, 2 );
insert into Asientos(idZona, fila, numero) values(24, 1, 3 );
insert into Asientos(idZona, fila, numero) values(24, 1, 4 );
insert into Asientos(idZona, fila, numero) values(24, 1, 5 );
insert into Asientos(idZona, fila, numero) values(24, 1, 6 );
insert into Asientos(idZona, fila, numero) values(24, 1, 7 );
insert into Asientos(idZona, fila, numero) values(24, 1, 8 );
insert into Asientos(idZona, fila, numero) values(24, 1, 9 );
insert into Asientos(idZona, fila, numero) values(24, 1, 10 );

-- Zona 25
insert into Asientos(idZona, fila, numero) values(25, 1, 1 );
insert into Asientos(idZona, fila, numero) values(25, 1, 2 );
insert into Asientos(idZona, fila, numero) values(25, 1, 3 );
insert into Asientos(idZona, fila, numero) values(25, 1, 4 );
insert into Asientos(idZona, fila, numero) values(25, 1, 5 );
insert into Asientos(idZona, fila, numero) values(25, 1, 6 );
insert into Asientos(idZona, fila, numero) values(25, 1, 7 );
insert into Asientos(idZona, fila, numero) values(25, 1, 8 );
insert into Asientos(idZona, fila, numero) values(25, 1, 9 );
insert into Asientos(idZona, fila, numero) values(25, 1, 10 );

-- Zona 26
insert into Asientos(idZona, fila, numero) values(26, 1, 1 );
insert into Asientos(idZona, fila, numero) values(26, 1, 2 );
insert into Asientos(idZona, fila, numero) values(26, 1, 3 );
insert into Asientos(idZona, fila, numero) values(26, 1, 4 );
insert into Asientos(idZona, fila, numero) values(26, 1, 5 );
insert into Asientos(idZona, fila, numero) values(26, 1, 6 );
insert into Asientos(idZona, fila, numero) values(26, 1, 7 );
insert into Asientos(idZona, fila, numero) values(26, 1, 8 );
insert into Asientos(idZona, fila, numero) values(26, 1, 9 );
insert into Asientos(idZona, fila, numero) values(26, 1, 10 );

-- idZona = 27
insert into Asientos(idZona, fila, numero) values(27, 1, 1 );
insert into Asientos(idZona, fila, numero) values(27, 1, 2 );
insert into Asientos(idZona, fila, numero) values(27, 1, 3 );
insert into Asientos(idZona, fila, numero) values(27, 1, 4 );
insert into Asientos(idZona, fila, numero) values(27, 1, 5 );
insert into Asientos(idZona, fila, numero) values(27, 1, 6 );
insert into Asientos(idZona, fila, numero) values(27, 1, 7 );
insert into Asientos(idZona, fila, numero) values(27, 1, 8 );
insert into Asientos(idZona, fila, numero) values(27, 1, 9 );
insert into Asientos(idZona, fila, numero) values(27, 1, 10 );


-- idZona = 28
insert into Asientos(idZona, fila, numero) values(28, 1, 1 );
insert into Asientos(idZona, fila, numero) values(28, 1, 2 );
insert into Asientos(idZona, fila, numero) values(28, 1, 3 );
insert into Asientos(idZona, fila, numero) values(28, 1, 4 );
insert into Asientos(idZona, fila, numero) values(28, 1, 5 );
insert into Asientos(idZona, fila, numero) values(28, 1, 6 );
insert into Asientos(idZona, fila, numero) values(28, 1, 7 );
insert into Asientos(idZona, fila, numero) values(28, 1, 8 );
insert into Asientos(idZona, fila, numero) values(28, 1, 9 );
insert into Asientos(idZona, fila, numero) values(28, 1, 10 );

# ---------------------------- Clientes ---------------------------- #



INSERT INTO Clientes(nombre, email, pwd) VALUES('Johann', 'johann@email.com', '123456');
INSERT INTO Clientes(nombre, email, pwd) VALUES('Felix', 'felix@email.com', '12345678');
INSERT INTO Clientes(nombre, email, pwd) VALUES('Juan', 'juan@email.com', '1234567891');

# ---------------------------- Formas de Pago ---------------------------- #

INSERT INTO Formasdepago(tipo) VALUES ('Efectivo');
INSERT INTO Formasdepago(tipo) 	VALUES ('Tarjeta');

# ---------------------------- Boletos ---------------------------- #

-- Evento Luis Miguel
INSERT INTO Boletos (idEvento, idAsiento, precio, disponible)
VALUES (1, 1, 2500, 1),
  (1, 2, 2500, 1),
  (1, 3, 2500, 1),
  (1, 4, 2500, 1),
  (1, 5, 2500, 1),
  (1, 6, 2500, 1),
  (1, 7, 2500, 1),
  (1, 8, 2500, 1),
  (1, 9, 2500, 1),
  (1, 10, 2500, 1),
  (1, 11, 2300, 1),
  (1, 12, 2300, 1),
  (1, 13, 2300, 1),
  (1, 14, 2300, 1),
  (1, 15, 2300, 1),
  (1, 16, 2300, 1),
  (1, 17, 2300, 1),
  (1, 18, 2300, 1),
  (1, 19, 2300, 1),
  (1, 20, 2300, 1),
  (1, 21, 2100, 1),
  (1, 22, 2100, 1),
  (1, 23, 2100, 1),
  (1, 24, 2100, 1),
  (1, 25, 2100, 1),
  (1, 26, 2100, 1),
  (1, 27, 2100, 1),
  (1, 28, 2100, 1),
  (1, 29, 2100, 1),
  (1, 30, 2100, 1),
  (1, 31, 1900, 1),
  (1, 32, 1900, 1),
  (1, 33, 1900, 1),
  (1, 34, 1900, 1),
  (1, 35, 1900, 1),
  (1, 36, 1900, 1),
  (1, 37, 1900, 1),
  (1, 38, 1900, 1),
  (1, 39, 1900, 1),
  (1, 40, 1900, 1),
  (1, 41, 1700, 1),
  (1, 42, 1700, 1),
  (1, 43, 1700, 1),
  (1, 44, 1700, 1),
  (1, 45, 1700, 1),
  (1, 46, 1700, 1),
  (1, 47, 1700, 1),
  (1, 48, 1700, 1),
  (1, 49, 1700, 1),
  (1, 50, 1700, 1),
  (1, 51, 1500, 1),
  (1, 52, 1500, 1),
  (1, 53, 1500, 1),
  (1, 54, 1500, 1),
  (1, 55, 1500, 1),
  (1, 56, 1500, 1),
  (1, 57, 1500, 1),
  (1, 58, 1500, 1),
  (1, 59, 1500, 1),
  (1, 60, 1500, 1),
  (1, 61, 1500, 1),
  (1, 62, 1500, 1),
  (1, 63, 1500, 1),
  (1, 64, 1500, 1),
  (1, 65, 1500, 1),
  (1, 66, 1500, 1),
  (1, 67, 1500, 1),
  (1, 68, 1500, 1),
  (1, 69, 1500, 1),
  (1, 70, 1500, 1),
  (1, 71, 1300, 1),
  (1, 72, 1300, 1),
  (1, 73, 1300, 1),
  (1, 74, 1300, 1),
  (1, 75, 1300, 1),
  (1, 76, 1300, 1),
  (1, 77, 1300, 1),
  (1, 78, 1300, 1),
  (1, 79, 1300, 1),
  (1, 80, 1300, 1),
  (1, 81, 1100, 1),
  (1, 82, 1100, 1),
  (1, 83, 1100, 1),
  (1, 84, 1100, 1),
  (1, 85, 1100, 1),
  (1, 86, 1100, 1),
  (1, 87, 1100, 1),
  (1, 88, 1100, 1),
  (1, 89, 1100, 1),
  (1, 90, 1100, 1);

-- Concierto Daniella Spalla

INSERT INTO Boletos(idEvento, idAsiento, precio, disponible)
VALUES 
  -- Grupo 4 (asientos 91-120, precio 1000, 1)
  (2, 91, 2000, 1),
  (2, 92, 2000, 1),
  (2, 93, 2000, 1),
  (2, 94, 2000, 1),
  (2, 95, 2000, 1),
  (2, 96, 2000, 1),
  (2, 97, 2000, 1),
  (2, 98, 2000, 1),
  (2, 99, 2000, 1),
  (2, 100, 2000, 1),
  (2, 101, 1800, 1),
  (2, 102, 1800, 1),
  (2, 103, 1800, 1),
  (2, 104, 1800, 1),
  (2, 105, 1800, 1),
  (2, 106, 1800, 1),
  (2, 107, 1800, 1),
  (2, 108, 1800, 1),
  (2, 109, 1800, 1),
  (2, 110, 1800, 1),
  -- Grupo 5 (asientos 111-140, precio 1600, 1)
  (2, 111, 1600, 1),
  (2, 112, 1600, 1),
  (2, 113, 1600, 1),
  (2, 114, 1600, 1),
  (2, 115, 1600, 1),
  (2, 116, 1600, 1),
  (2, 117, 1600, 1),
  (2, 118, 1600, 1),
  (2, 119, 1600, 1),
  (2, 120, 1600, 1),
  (2, 121, 1400, 1),
  (2, 122, 1400, 1),
  (2, 123, 1400, 1),
  (2, 124, 1400, 1),
  (2, 125, 1400, 1),
  (2, 126, 1400, 1),
  (2, 127, 1400, 1),
  (2, 128, 1400, 1),
  (2, 129, 1400, 1),
  (2, 130, 1400, 1),
  (2, 131, 1200, 1),
  (2, 132, 1200, 1),
  (2, 133, 1200, 1),
  (2, 134, 1200, 1),
  (2, 135, 1200, 1),
  (2, 136, 1200, 1),
  (2, 137, 1200, 1),
  (2, 138, 1200, 1),
  (2, 139, 1200, 1),
  (2, 140, 1200, 1),
  (2, 141, 1000, 1),
  (2, 142, 1000, 1),
  (2, 143, 1000, 1),
  (2, 144, 1000, 1),
  (2, 145, 1000, 1),
  (2, 146, 1000, 1),
  (2, 147, 1000, 1),
  (2, 148, 1000, 1),
  (2, 149, 1000, 1),
  (2, 150, 1000, 1),
  (2, 151, 800, 1),
  (2, 152, 800, 1),
  (2, 153, 800, 1),
  (2, 154, 800, 1),
  (2, 155, 800, 1),
  (2, 156, 800, 1),
  (2, 157, 800, 1),
  (2, 158, 800, 1),
  (2, 159, 800, 1),
  (2, 160, 800, 1),
  -- Grupo 7 (asientos 161-190, precio 600, 1)
  (2, 161, 600, 1),
  (2, 162, 600, 1),
  (2, 163, 600, 1),
  (2, 164, 600, 1),
  (2, 165, 600, 1),
  (2, 166, 600, 1),
  (2, 167, 600, 1),
  (2, 168, 600, 1),
  (2, 169, 600, 1),
  (2, 170, 600, 1),
  (2, 171, 400, 1),
  (2, 172, 400, 1),
  (2, 173, 400, 1),
  (2, 174, 400, 1),
  (2, 175, 400, 1),
  (2, 176, 400, 1),
  (2, 177, 400, 1),
  (2, 178, 400, 1),
  (2, 179, 400, 1),
  (2, 180, 400, 1),
  -- Grupo 8 (asientos 181-210, precio 200, 1)
  (2, 181, 200, 1),
  (2, 182, 200, 1),
  (2, 183, 200, 1),
  (2, 184, 200, 1),
  (2, 185, 200, 1),
  (2, 186, 200, 1),
  (2, 187, 200, 1),
  (2, 188, 200, 1),
  (2, 189, 200, 1),
  (2, 190, 200, 1),
  (2, 191, 200, 1),
  (2, 192, 200, 1),
  (2, 193, 200, 1),
  (2, 194, 200, 1),
  (2, 195, 200, 1),
  (2, 196, 200, 1),
  (2, 197, 200, 1),
  (2, 198, 200, 1),
  (2, 199, 200, 1),
  (2, 200, 200, 1),
  -- Grupo 9 (asientos 201-230, precio 0)
  (2, 201, 200, 1),
  (2, 202, 200, 1),
  (2, 203, 200, 1),
  (2, 204, 200, 1),
  (2, 205, 200, 1),
  (2, 206, 200, 1),
  (2, 207, 200, 1),
  (2, 208, 200, 1),
  (2, 209, 200, 1),
  (2, 210, 200, 1),
  (2, 211, 200, 1),
  (2, 212, 200, 1),
  (2, 213, 200, 1),
  (2, 214, 200, 1),
  (2, 215, 200, 1),
  (2, 216, 200, 1),
  (2, 217, 200, 1),
  (2, 218, 200, 1),
  (2, 219, 200, 1),
  (2, 220, 200, 1),
  (2, 221, 200, 1),
  (2, 222, 200, 1),
  (2, 223, 200, 1),
  (2, 224, 200, 1),
  (2, 225, 200, 1),
  (2, 226, 200, 1),
  (2, 227, 200, 1),
  (2, 228, 200, 1),
  (2, 229, 200, 1),
  (2, 230, 200, 1);
  
-- Date Un voltio

INSERT INTO Boletos(idEvento, idAsiento, precio, disponible)
VALUES
  (3, 271, 50, 1),
  (3, 272, 50, 1),
  (3, 273, 50, 1),
  (3, 274, 50, 1),
  (3, 275, 50, 1),
  (3, 276, 50, 1),
  (3, 277, 50, 1),
  (3, 278, 50, 1),
  (3, 279, 50, 1),
  (3, 280, 50, 1);

-- Concierto Ha Ash

INSERT INTO Boletos(idEvento, idAsiento, precio, disponible)
VALUES
  (4, 121, 50, 1),
  (4, 122, 50, 1),
  (4, 123, 50, 1),
  (4, 124, 50, 1),
  (4, 125, 50, 1),
  (4, 126, 50, 1),
  (4, 127, 50, 1),
  (4, 128, 50, 1),
  (4, 129, 50, 1),
  (4, 130, 50, 1);

-- Obra de teatro
INSERT INTO Boletos(idEvento, idAsiento, precio, disponible)
VALUES
  -- Grupo 1 (asientos 91-100, precio 1000, 1)
  (5, 91, 1000, 1),
  (5, 92, 1000, 1),
  (5, 93, 1000, 1),
  (5, 94, 1000, 1),
  (5, 95, 1000, 1),
  (5, 96, 1000, 1),
  (5, 97, 1000, 1),
  (5, 98, 1000, 1),
  (5, 99, 1000, 1),
  (5, 100, 1000, 1),
  -- Grupo 2 (asientos 101-110, precio 800, 1)
  (5, 101, 800, 1),
  (5, 102, 800, 1),
  (5, 103, 800, 1),
  (5, 104, 800, 1),
  (5, 105, 800, 1),
  (5, 106, 800, 1),
  (5, 107, 800, 1),
  (5, 108, 800, 1),
  (5, 109, 800, 1),
  (5, 110, 800, 1),
  -- Grupo 3 (asientos 111-120, precio 600, 1)
  (5, 111, 600, 1),
  (5, 112, 600, 1),
  (5, 113, 600, 1),
  (5, 114, 600, 1),
  (5, 115, 600, 1),
  (5, 116, 600, 1),
  (5, 117, 600, 1),
  (5, 118, 600, 1),
  (5, 119, 600, 1),
  (5, 120, 600, 1);
  
-- Final de Box

INSERT INTO Boletos(idEvento, idAsiento, precio, disponible)
VALUES
  -- Grupo 1 (asientos 1-10, precio 2000)
  (6, 1, 2000, 1),
  (6, 2, 2000, 1),
  (6, 3, 2000, 1),
  (6, 4, 2000, 1),
  (6, 5, 2000, 1),
  (6, 6, 2000, 1),
  (6, 7, 2000, 1),
  (6, 8, 2000, 1),
  (6, 9, 2000, 1),
  (6, 10, 2000, 1),
  -- Grupo 2 (asientos 11-20, precio 1800, 1)
  (6, 11, 1800, 1),
  (6, 12, 1800, 1),
  (6, 13, 1800, 1),
  (6, 14, 1800, 1),
  (6, 15, 1800, 1),
  (6, 16, 1800, 1),
  (6, 17, 1800, 1),
  (6, 18, 1800, 1),
  (6, 19, 1800, 1),
  (6, 20, 1800, 1),
  -- Grupo 3 (asientos 21-30, precio 1600, 1)
  (6, 21, 1600, 1),
  (6, 22, 1600, 1),
  (6, 23, 1600, 1),
  (6, 24, 1600, 1),
  (6, 25, 1600, 1),
  (6, 26, 1600, 1),
  (6, 27, 1600, 1),
  (6, 28, 1600, 1),
  (6, 29, 1600, 1),
  (6, 30, 1600, 1),
  -- Grupo 4 (asientos 31-40, precio 1400, 1)
  (6, 31, 1400, 1),
  (6, 32, 1400, 1),
  (6, 33, 1400, 1),
  (6, 34, 1400, 1),
  (6, 35, 1400, 1),
  (6, 36, 1400, 1),
  (6, 37, 1400, 1),
  (6, 38, 1400, 1),
  (6, 39, 1400, 1),
  (6, 40, 1400, 1),
  -- Grupo 5 (asientos 41-50, precio 1200, 1)
  (6, 41, 1200, 1),
  (6, 42, 1200, 1),
  (6, 43, 1200, 1),
  (6, 44, 1200, 1),
  (6, 45, 1200, 1),
  (6, 46, 1200, 1),
  (6, 47, 1200, 1),
  (6, 48, 1200, 1),
  (6, 49, 1200, 1),
  (6, 50, 1200, 1),
  -- Grupo 6 (asientos 51-60, precio 1000, 1)
  (6, 51, 1000, 1),
  (6, 52, 1000, 1),
  (6, 53, 1000, 1),
  (6, 54, 1000, 1),
  (6, 55, 1000, 1),
  (6, 56, 1000, 1),
  (6, 57, 1000, 1),
  (6, 58, 1000, 1),
  (6, 59, 1000, 1),
  (6, 60, 1000, 1),
  -- Grupo 7 (asientos 61-70, precio 800, 1)
  (6, 61, 800, 1),
  (6, 62, 800, 1),
  (6, 63, 800, 1),
  (6, 64, 800, 1),
  (6, 65, 800, 1),
  (6, 66, 800, 1),
  (6, 67, 800, 1),
  (6, 68, 800, 1),
  (6, 69, 800, 1),
  (6, 70, 800, 1),
  -- Grupo 8 (asientos 71-80, precio 600, 1)
  (6, 71, 600, 1),
  (6, 72, 600, 1),
  (6, 73, 600, 1),
  (6, 74, 600, 1),
  (6, 75, 600, 1),
  (6, 76, 600, 1),
  (6, 77, 600, 1),
  (6, 78, 600, 1),
  (6, 79, 600, 1),
  (6, 80, 600, 1),
  -- Grupo 9 (asientos 81-90, precio 400, 1)
  (6, 81, 400, 1),
  (6, 82, 400, 1),
  (6, 83, 400, 1),
  (6, 84, 400, 1),
  (6, 85, 400, 1),
  (6, 86, 400, 1),
  (6, 87, 400, 1),
  (6, 88, 400, 1),
  (6, 89, 400, 1),
  (6, 90, 400, 1);
# -------------------------------------------------------------------------------------- VISTAS ---------------------------------------------------------------------------------------- #
CREATE VIEW BoletosVista
AS
SELECT bol.id as IdBoleto , lug.nombre as NombreLugar , eve.nombre as EventoNombre , zone.descripcion Zona , asi.fila Fila , asi.numero Numero, bol.precio Precio, bol.disponible
FROM Boletos bol
INNER JOIN Asientos asi ON asi.id = bol.idAsiento
INNER JOIN Eventos eve ON eve.id = bol.idEvento
INNER JOIN Lugares lug ON eve.idLugar = lug.id
INNER JOIN Zonas zone ON zone.id = asi.idZona;

# ----------------------------------------------------------- #
CREATE VIEW AsientosVista
AS
SELECT asi.id as IdAsiento, lug.id as IdLugar, lug.nombre as Lugar, zona.id as IdZona, zona.descripcion as 'Zona de Asiento' , asi.fila as Fila , asi.numero as Numero
FROM Asientos asi
INNER JOIN Zonas zona ON zona.id = asi.idZona
INNER JOIN Lugares lug ON lug.id = zona.idLugar;
# ----------------------------------------------------------- #
CREATE VIEW TicketsVista 
AS
SELECT tic.id AS TicketID, ev.nombre AS Evento, lug.nombre AS Lugar, ev.fechaHora AS Fecha, ev.descripcion AS Descripcion, lug.direccion AS Direccion, cli.nombre AS Cliente, fdp.tipo AS 'Forma de Pago' , concat(asi.fila, '-' , asi.numero) AS Asiento FROM tickets tic
INNER JOIN Boletos bol ON bol.id = tic.idBoleto
INNER JOIN Eventos ev ON ev.id = bol.idEvento
INNER JOIN Lugares lug ON lug.id = ev.idLugar
INNER JOIN Clientes cli ON cli.id = tic.idCliente
INNER JOIN Formasdepago fdp ON fdp.id = tic.idFormaDePago
INNER JOIN Asientos asi ON asi.id = bol.idAsiento;
# -------------------------------------------------------------------------------------- FUNCIONES ---------------------------------------------------------------------------------------- #
DELIMITER //

CREATE FUNCTION ZonaExisteEnEvento(idEvento INT, idZona INT) RETURNS INT
DETERMINISTIC
BEGIN

  /*
    Esta función verifica la existencia de una zona en un evento específico, 
    basándose en los identificadores de evento (idEvento) e identificadores de zona (idZona) proporcionados.
    Devuelve 1 si laz zona existe en el evento o 0 en caso contrario.
    */
    
    DECLARE existe INT;
    
    SELECT COUNT(*) INTO existe
    FROM Zonas z
    INNER JOIN Lugares l ON z.idLugar = l.id
    INNER JOIN Eventos e ON e.idLugar = l.id
    WHERE e.id = idEvento AND z.id = idZona;
    
    IF existe > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END //

DELIMITER ;
# ----------------------------------------------------- #
DELIMITER //

CREATE FUNCTION ExisteEvento(eventId INT) RETURNS INT
DETERMINISTIC
BEGIN
    /*
    Esta función verifica la existencia de un evento en la tabla Eventos, 
    basándose en el identificador de evento (eventId) proporcionado.
    Devuelve 1 si el evento existe o 0 en caso contrario.
    */
    
    IF EXISTS (SELECT * FROM Eventos WHERE id = eventId) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END //

DELIMITER ;
# ----------------------------------------------------- #
DELIMITER // 

CREATE FUNCTION ZonaAsiento(idAsiento INT) RETURNS INT
DETERMINISTIC
BEGIN

		/*
		Dado un asiento, devuelve el id de la zona en el que esta
		*/
		
		DECLARE zona INT;
        SET zona = (SELECT idZona FROM Asientos WHERE id = idAsiento);
        
        RETURN zona;
	
END //

DELIMITER ;
# -------------------------------------------------------------- #
DELIMITER // 

CREATE FUNCTION AsientoEnEvento(idAsiento INT, idEvento INT) RETURNS INT
DETERMINISTIC
BEGIN
		/*
			Regresa 1 si es que el asiento existe en el lugar en donde se realiza un evento
        */
		SET @idLugar = (SELECT idLugar FROM eventos WHERE id = idEvento);
        -- Esta es la vista AsientosVista, por cuestiones de sintaxis la recreamos aqui dentro en vez de llamarla 
        IF EXISTS (SELECT asi.id as IdAsiento, lug.id as IdLugar, lug.nombre as Lugar, zona.id as IdZona, zona.descripcion as 'Zona de Asiento' , asi.fila as Fila , asi.numero as Numero
					FROM Asientos asi
					INNER JOIN Zonas zona ON zona.id = asi.idZona
					INNER JOIN Lugares lug ON lug.id = zona.idLugar
					WHERE (lug.Id = @idLugar AND asi.id = idAsiento)) THEN
			RETURN 1;
        ELSE 
			RETURN 0;
		END IF;

		
END //

DELIMITER ;
# ----------------------------------------------------- #
DELIMITER //

CREATE FUNCTION AsientoOcupado(idAsientos INT, idEventos INT) RETURNS INT
DETERMINISTIC
BEGIN
		/* Verifica si un asiento está ocupado en un evento específico. */

	-- si el asiento existe en evento entonces asientoExisteEnEvento valdrá 1, en otro caso 0
    SET @asientoExisteEnEvento = (SELECT AsientoEnEvento(idAsientos, idEventos));
    
    -- si ya existe un evento con el mismo id de asiento y id de evento que el que ingresamos y que no está disponible significa que está ocupado
    IF @asientoExisteEnEvento = 1 THEN
    
		 IF NOT EXISTS (SELECT * FROM Boletos WHERE (idAsiento = idAsientos AND idEvento = idEventos AND disponible = 1)) THEN
				-- retorna 0 si está libre
                RETURN 1;
			ELSE
				-- retorna 1 si está ocupado
				RETURN 0;
			END IF;


	ELSE
    
		-- retorna 2 si no existe
		RETURN 2;
	END IF;

END //

DELIMITER ;

