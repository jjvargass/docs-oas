[[
title: Documento de análisis de Actividades del Módulo Gestión de Riesgos
author: José Javier Vargas Serrato
]]

Análisis de Actividades
=======================

Gestión Riesgos
==========================

[TOC]

INTRODUCCIÓN
------------

Dentro de Marco de Seguridad del **Modelo de Seguridad y Privacidad de la información (en adelante MSPI)**,
un tema decisivo, es la Gestión de riesgos la cual es utilizada para la toma de decisiones.
Por otra parte Teniendo en cuenta que el contexto organizacional de esta guía y del
MSPI en sí, son las entidades del Estado, la metodología en la cual se basa la
presente guía es la “Guía de Riesgos” del DAFP, buscando que haya una
integración a lo que se ha desarrollado dentro de la Entidad para otros modelos de
Gestión, y de éste modo aprovechar el trabajo adelantado en la identificación de
Riesgos para ser complementados con los Riesgos de Seguridad



DEFINICIÓN DE LA TRANSFORMACIÓN DE LA INFORMACIÓN (PROCESOS DEL SISTEMA)
----------------------

Se requiere un sistema de información para identificar, registrar, clasificar y valorar los riesgos tanto de **Seguridad de la Información** como los que la entidad ha venido trabajando.
El sistema estara estructurado acorde a lo definido en el **Modelo de Seguridad y Privacidad de la información (en adelante MSPI)** y el **Departamento de Función Pública - DAFP**

ENTIDADES IDENTIFICADAS (RESPONSABLES Y TAREAS)
-----------------------------------------------

Son las entidades que interactúan con el proceso o forman parte del mismo.

### Funcionarios de las Áreas (Actor)
Cada uno de los funcionarios de las distintas áreas de la entidad. Se relaciona con el sistema mediante el registro de riesgos que tiene a su cargo o responsabilidad por procesos.

### Líder del proceso - jefe del area(Actor)
Encargados de realizar las acciones asociadas a los controles establecidos para cada uno de los riesgos identificados para
su proceso, de acuerdo con la periodicidad establecida en la política de administración del riesgo de la entidad.

### Gestor (Actor)
Es uno o varios funcionarios del proceso que colaboran con la gestión "consulta, validación y verificación" de los registro de riesgos identificados al proceso.

### Oficial de Seguridad (Actor)
Es uno o varios funcionarios del proceso que colaboran con la gestión desde la perpectiva de seguridad de la información.

DIAGRAMA DE ACTIVIDADES
-----------------------
{uml}

	title Diagrama de actividades\n Gestión de Riesgos
	skinparam backgroundColor #E7E3E3
	(*) --> "Registrar\nRiesgo"
	--> "Aceptar o rechazar\nriesgo por lider del proceso"
	--> "Funcionarios analistas consultan,
	supervisan la mitigación del riesgo"
	--> (*)

{enduml}

DESCRIPCIÓN DE LAS ACTIVIDADES DEL PROCESO
------------------------------------------
### Actividad 1: Registrar Riesgos

En esta actividad cada uno de los funcionarios designados por los lideres de área de la entidad realizará el registro de reisgos asociado al procesos que apoyan o perteneciente

### Actividad 2: Aceptar o Rechazar Activo de Información

El lider del proyecto dara visto bueno aceptará o rechazará a la definición del riesgo.

### Actividad 3: Consulta, supervisión  del Inentario

En esta actividad los funcioanrios encargados de la supervisión podrán consultar los activos aprobados y que conformarán el inventario de activos de información.

ENTORNO Y RESTRICCIONES
-----------------------

Aquellos elementos externos al proceso, que se consideran dados, pero no obstante afectan su comportamiento.
