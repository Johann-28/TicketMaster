# TicketMaster

Este repositorio será una bitácora de un sistema administrador de eventos al estilo de TicketMaster, un sistema que promete llevar la administracion de eventos proximos y su gestión de base de datos utilizando mySQL

## Diagrama entidad relacion

> ![Diagrama Entidad-Relacion](/TicketMaster/img/Diagrama%20ER.png)

## Diagrama de clases

> ![Diagrama de clases](/TicketMaster/img/Diagrama.png)

## Explicación de tablas

> ### Artistas
  > ![Tabla de artistas](/TicketMaster/img/Artistas.png)
    > Esta tabla guardara los registros de los artistas, tendrá un id auto incrementable que será la llave primaria, nombre de tipo varchar (un ejemplo sería 'Luis Miguel'), y el genero (por ejemplo 'Musica').

    
> ### Lugares
  > ![Tabla de lugares](/TicketMaster/img/Lugares.png)
    > Esta tabla guardara los registros de los lugares registrados, (un ejemplo sería 'Auditorio Facpya'), cuenta con un id auto incrementable que es la PK, también el nombre varchar y la direccion también varchar.

> ### Eventos
  > ![Tabla de eventos](/TicketMaster/img/Eventos.png)
    > En esta tabla se registran los eventos, podemos ver 2 FK, el primero es el idArtista el cual nos dice de qué artista será el evento, después tenemos idLugar que nos dirá en dónde se realizará el evento

> ### Zonas
  > ![Tabla de zonas](/TicketMaster/img/Zonas.png) 
    > Esta tabla guardará las zonas que existen en un lugar, la siguiente imagen ilustra un ejemplo de las zonas que existen en un lugar(cada zona de un color distintos) , más adelante en la tabla de "Boletos" determinaremos el precio de este dependiendo de que zona esté. 
     ![Tabla de zonas](/TicketMaster/img/EjemploZonas.png) 

> ### Boletos
  > ![Tabla de boletos](/TicketMaster/img/Boletos.png)
    > Esta tabla guardara los registros de los boletos que existen en un evento, el idEvento nos determina indirectamente en que lugar se hará lo que nos podría ayudar a llevar un control realista de al cantidad de boletos disponibles en caso de ser necesario, el idZona nos ayuda a determinar el precio del boleto

> ### Asientos
  > ![Tabla de asientos](/TicketMaster/img/Asientos.png)
    > Esta tabla nos ayudará más adelante en la tabla de "Tickets" a determinar en que asiento estás asignado, podremos tener el control de que cada asiento sea único a cada boleto


> ### Clientes
  > ![Tabla de clientes](/TicketMaster/img/Clientes.png)
    > Esta tabla guardara los registros de los clientes registrados.

> ### Tickets
  > ![Tabla de tickets](/TicketMaster/img/Ticket.png)
    > Esta tabla será el resultado de todo el proceso de compra, como podemos ver en su mayoría se conforma por FK, el que un boleto tenga un ticket significa que ya ha sido vendido al igual que si un asiento tiene relacionado un ticket, el idCliente será para generar un buen formato