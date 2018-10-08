[[
title: Documento de análisis de Actividades del Módulo Operación por Procesos
author: José Javier Vargas Serrato
]]

Análisis de Actividades
=======================

Operación por Procesos
==========================

[TOC]

INTRODUCCIÓN
------------

El modelo de operación por procesos es el estándar
organizacional que soporta la operación de la
entidad pública, integrando las competencias constitucionales y legales que la rigen con el conjunto de
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

DIAGRAMA DE ACTIVIDADES
-----------------------
{uml}

	title Diagrama de Actividades\nOperación Por Procesos
	skinparam backgroundColor #E7E3E3

	(*) --> "Registrar Procesos"
	--> "Asociar Actividades al Proceso"
	--> "Asociar Entradas y Salidas a las Actividades"
	--> (*)
{enduml}

DESCRIPCIÓN DE LAS ACTIVIDADES DEL PROCESO
------------------------------------------
### Actividad 1: Registrar Procesos.

En esta actividad el administrador realiza el registro de los procesos definidos en la organización, para proporcionar en el sistema el atributo de gestión por procesos en los módulos que lo requieran y así caracterizar la operación de los sistemas con el atributo de processos

### Actividad 2: Asociar Actividades al Proceso.

En esta actividad se caracteriza el procesos, que es definir las actividades que le corresponde al proceso para cumplir con sus objetivos.


### Actividad 3: Registrar mensualmente los avances por actividad.

En esta actividad se detalla cada una de las actividades del proceso; con el registro de sus entradas y salidas; que hace parte de la transformación de insumos en productos de dicho proceso.

ENTORNO Y RESTRICCIONES
-----------------------

Aquellos elementos externos al proceso, que se consideran dados, pero no obstante afectan su comportamiento.

### Elementos del Entorno

- La consolidación y estructuración del proceso de la organización es propia del área de planeación que luego es difundida en el portal web; esta es la fuente que se tomó para consolidar la información en el sistema.

### Restricciones

- Se encuentra en algunos procesos como área líder el consejo superior, que no es definido como un área de la organización, pero para el sistema si, de esta forma se logra incluir y caracterizar el proceso.
