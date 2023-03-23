SELECT 'HOLA MUNDO';
SELECT 'PRUEBA DE ACTUALIZACION';
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