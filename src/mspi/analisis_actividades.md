[[
title: Documento de análisis de Actividades del Módulo Gestión por Procesos
author: José Javier Vargas Serrato
]]

Análisis de Actividades
=======================

Gestión por Procesos
==========================

[TOC]

INTRODUCCIÓN
------------

El modelo de operación por procesos es el estándar
organizacional que soporta la operación de la
entidad pública, integrando las competencias consti-
tucionales y legales que la rigen con el conjunto de
planes y programas necesarios para el cumplimiento
de su misión, visión y objetivos institucionales.
Pretende determinar la mejor y más eficiente forma
de ejecutar las operaciones de la entidad.

DEFINICIÓN DE LA TRANSFORMACIÓN DE LA INFORMACIÓN (PROCESOS DEL SISTEMA)
----------------------

Se requiere un sistema de información para registrar los procesos de la organización, mediante el registro de los atributos de estos, para así caracterizar los las operaciones en el sistema por medio de procesos.

ENTIDADES IDENTIFICADAS (RESPONSABLES Y TAREAS)
-----------------------------------------------

Son las entidades que interactúan con el proceso o forman parte del mismo.

### Áreas Lideres (Cliente)
Áreas a las que le corresponde liderar la ejecución de los objetivos del procesos de la organización.

### Áreas Gestoras (Cliente)
Áreas de apoyo en la ejecución de los objetivos del proceso de la organización.

### Oficina Asesora de Planeación y Control – OAPC (Propietario)
Responsable del plan de mejoramiento con los organismos de control en su conjunto. Su rol es de seguimiento y apoyo especial a aquellas actividades complejas y/o que requieran de la participación de otras entidades. Se relacionan con el sistema mediante la generación de reportes y consulta de los registros de las áreas responsables, corresponsables, la OAP y la OCI.

Diagrama de actividades
-----------------------
{uml}

	title Diagrama de Actividades\nOperación Por Procesos
	skinparam backgroundColor #E7E3E3

	(*) --> "Registrar Procesos"
	--> "Asociar Actividades al Proceso"
	--> "Asociar Entradas y Salidas a las Actividades"
	--> (*)
	header
	Designed by jjvargass
	end header

{enduml}
