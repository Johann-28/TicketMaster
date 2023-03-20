# TicketMaster
---
* **[Introduccion](#introduccion)**
* **[¿Qué es un diagrama entidad-relación?](#que-es-un-diagrama-entidad-relacion)**
* **[Diagrama Entidad-Relacion](#diagrama-entidad-relacion)**
* **[¿Qué es un diagrama de clases?](#que-es-un-diagrama-de-clases)**
* **[Diagrama de clases](#diagrama-de-clases)**
* **[Explicacion de las tablas](#explicación-de-tablas)**
* **[Conclusión](#conclusion)**
* **[Bibliografía](#bibliografía)**

## Introduccion
Este repositorio será una bitácora de un sistema administrador de eventos al estilo de TicketMaster, un sistema que promete llevar la administracion de eventos proximos y su gestión de base de datos utilizando mySQL, como se dice mucho: 
   > Fallar al planear es planear fallar 💡  

Por lo que es de suma importancia comenzar a diseñar el sistema de una manera correcta desde el principio, en este caso en el que estamos diseñando una base de datos deberemos de diseñar un diagrama de entidades y como es que se relacionan para poder así llegar a un buen diseño y posteriormente codificarlo.


## Que es un diagrama entidad relacion

>Un diagrama entidad-relación, también conocido como modelo entidad relación o ERD, es un tipo de diagrama de flujo que ilustra cómo las "entidades", como personas, objetos o conceptos, se relacionan entre sí dentro de un sistema. Los diagramas ER se usan a menudo para diseñar o depurar bases de datos relacionales en los campos de ingeniería de software, sistemas de información empresarial, educación e investigación. También conocidos como los ERD o modelos ER, emplean un conjunto definido de símbolos, tales como rectángulos, diamantes, óvalos y líneas de conexión para representar la interconexión de entidades, relaciones y sus atributos. Son un reflejo de la estructura gramatical y emplean entidades como sustantivos y relaciones como verbos. (Qué es un diagrama entidad-relación, s. f.)

En los modelos de entidad relación nos encontramos con simbolos que nos ayudan a leer y entender mejor como es que se comporta un diagrama, entre ellos tenemos cuadrados para representar a las entidades, ovalos para representar a los atributos y rombos para representar las relaciones que existen entre entidades como podemos apreciar en la siguiente imagen

   ![Comopnentes](/TicketMaster/img/ComponentesModeloEntidadRelacion.png)

Además de una cardinalidad, la cual nos indica como es la relacion que existen entre las entidades, entre ellas tenemos:

 ![Cardinalidad](/TicketMaster/img/Cardinalidad.png)

 * Por ejemplo,. entre tenemos la cardinalidad 1,1 entre las entidades empleado y equipo, lo que nos dice que 1 empleado maneja 1 equipo y 1 equipo es manejado por un empleado
 * Un cliente toma N ordenes y N ordenes son tomadas por un solo cliente
 * N empleados se reoprta en un departamento y 1 departamento reporta N empleados
 * M estudiantes se inscriben a N clases y N clases tienen M studiantes
 
 El entendimiento de estas herramientas y el poder hacer un diagrama correcto es lo que nos hará realizar un buen sistema
  

## Diagrama entidad relacion

> ![Diagrama Entidad-Relacion](/TicketMaster/img/Diagrama%20ER.png)

## Que es un diagrama tablar
Este modelo es aterrizar a una idea más aplicable el modelo entidad relación que previamente introducimos, en este modelo especificaremos cada entidad como una tabla y cada atributo como una fila de esta, además especificaremos el tipo de dato de cada atributo; lo bueno de este modelo es que podemos ver la relaciones entre las llaves primarias con las llaves foráneas de otras tablas de una mejor manera, permitiendonos saber qué flujo seguiría nuestra base de datos.

## Diagrama tabular

> ![Diagrama de clases](/TicketMaster/img/Diagrama.png)








## Explicación de tablas

<details><summary>TABLAS</summary>
<p>

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

    </p>
</details>

## Conclusión
Hasta este punto ya habré dedicado mucho tiempo en la creación de este contenido y la revisión de los diagramas, he creado este repositorio para poder ver el avance de este proyecto además de tenerlo como muestra de conocimiento para en un futuro no tan lejano poder justificar mis habilidades en la administracion de base de datos, por ahora me siento seguro de mis conocimientos, necesité un poco de tiempo para despejar mi mente y problemas pero ahora ya me siento mejor como para poder dar lo mejor de mi, muchas gracias profe si es que llegó hasta aqui lo aprecio mucho, cualquier critica será bien recibida.

## Bibliografía
 * Qué es un diagrama entidad-relación. (s. f.). Lucidchart. https://www.lucidchart.com/pages/es/que-es-un-diagrama-entidad-relacion
