[[
title: Documento de análisis de Actividades del Módulo Activos de Información
author: José Javier Vargas Serrato
]]

Análisis de Actividades
=======================

Gestión Activos de Información
==========================

[TOC]

INTRODUCCIÓN
------------

La gestión y clasificación de activos activos de información determina que activos posee la entidad, de cómo deben ser
utilizados, los roles y responsabilidades que tienen los funcionarios sobre los
mismos y, reconociendo adicionalmente el nivel de clasificación de la información
que a cada activo debe dársele.

La realización de un inventario y clasificación de activos hace parte de la debida
diligencia que a nivel estratégico se ha definido en el Modelo de Seguridad y
Privacidad de la Información con respecto a la seguridad de los activos de
información de los procesos de una entidad, y cuyo objetivo es dar cumplimiento a
cuatro puntos principales descritos en el Ítem 8 de la Tabla 2 – de la guía Controles
del Anexo A del estándar ISO/IEC 27001:2013:

DEFINICIÓN DE LA TRANSFORMACIÓN DE LA INFORMACIÓN (PROCESOS DEL SISTEMA)
----------------------

Se requiere un sistema de información para registrar y clasificar los activos de información de la organización, mediante el registro de los atributos de estos.

ENTIDADES IDENTIFICADAS (RESPONSABLES Y TAREAS)
-----------------------------------------------

Son las entidades que interactúan con el proceso o forman parte del mismo.

### Áreas Lideres (Cliente)
Áreas a las que le corresponde liderar la ejecución de los objetivos del proceso de la organización.

### Áreas Gestoras (Cliente)
Áreas de apoyo en la ejecución de los objetivos del proceso de la organización.

### Funcionarios de las Áreas (Actor)
Cada uno de los funcionarios de las distintas áreas de la entidad. Se relaciona con el sistema mediante el registro del activo de información que tiene a su cargo o responsabilidad.

### Líder del proceso - jefe del area(Actor)
Es el propietario de los activos de información del proceso a su cargo. Los líderes del proceso son una o varias áreas de la entidad y se establecerá como propietario el jefe de dicha área.

### Gestor (Actor)
Es uno o varios funcionarios del proceso que colaboran con la gestión del inventario de activos de información del proceso.

### Propietario (Propietario)
Es una parte designada de la entidad, un cargo, proceso, o grupo de
trabajo que tiene la responsabilidad de garantizar que la información y los activos asociados con el proceso se clasifican adecuadamente. Deben definir y revisar periódicamente las restricciones y clasificaciones del acceso.

### Custodio (Propietario)
Es una parte designada de la entidad, un cargo, proceso, o grupo de
trabajo encargado de hacer efectivos las restricciones y clasificaciones de acceso
definidos por el propietario. (Para sistemas de información o información
consignada o respaldada, generalmente es TI o para información física, los
custodios pueden ser los funcionarios o el proceso de archivo o correspondencia, el
custodio generalmente se define donde reposa el activo original).


DIAGRAMA DE ACTIVIDADES
-----------------------
{uml}

	title Diagrama de actividades\n Gestión de Activos de Información
	skinparam backgroundColor #E7E3E3
	(*) --> "Registrar\nActivos de Información"
	--> "Aceptar o rechazar\nactivo de información\n por funcionarios
	encargados de la gestion"
	--> "Funcionarios analistas consultan,
	supervisan el inventario"
	--> (*)

{enduml}

DESCRIPCIÓN DE LAS ACTIVIDADES DEL PROCESO
------------------------------------------
### Actividad 1: Registrar Activos de Información.

En esta actividad cada uno de los funcionarios de la entidad realizará el registro de activos de información a su cargo y asociado al proceso.

### Actividad 2: Aceptar o Rechazar Activo de Información

En esta actividad los funcionarios que pertenezcan al equipo de gestión de activos realizarán la aceptación o rechazo del activo registrado.

### Actividad 3: Consulta, supervisión  del Inventario

En esta actividad los funcionarios encargados de la supervisión podrán consultar los activos aprobados y que conformarán el inventario de activos de información.

ENTORNO Y RESTRICCIONES
-----------------------

Aquellos elementos externos al proceso, que se consideran dados, pero no obstante afectan su comportamiento.

### Restricciones

- La definición de los activos de información "conocimiento e información de gran valor para la organización"  está dada por la política de seguridad de la información establecida en la organización.
