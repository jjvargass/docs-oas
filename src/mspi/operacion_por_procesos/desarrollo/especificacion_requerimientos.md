[[
title: Documento de Especificación de requerimientos del Proceso Registro y Seguimiento Planes de Mejoramiento
author: José Javier Vargas Serrato
]]
Especificación de Requerimientos de Aplicaciones
=================================================

Operación por Procesos
=============================================

[TOC]

CASOS DE USO
------------

A continuación se listan y describen los actores principales del sistema, estos son candidatos para ser implementados como grupos de seguridad en el aplicativo:

### ACTORES

* **Administrador Módulo**: Tiene como responsabilidad parametrizar el sistema.

### DIAGRAMA DE CASOS DE USO

#### Usuarios del Aplicativo
***

{uml}
	title Usuarios
	skinparam backgroundColor #E7E3E3

    left to right direction
    skinparam packageStyle rect
    actor administrador_modulo

    usuario <|-- administrador_modulo

{enduml}

#### Administrador del Módulo
***

{uml}
    skinparam backgroundColor #E7E3E3
    left to right direction
    skinparam packageStyle rect
    actor administrador_modulo
    rectangle "Registro de Proceso" {
      administrador_modulo -- (Registrar\n Proceso)
      (Registrar Actividades) .> (Registrar\n Proceso)  : extends
      (Registra\nEntradas/Salidas) .> (Registrar Actividades) : extends
    }

{enduml}


DIAGRAMA DE ACTIVIDADES DEL SISTEMA
-----------------------------------

{uml}

    title Diagrama de Actividades \n
    |#AntiqueWhite|administrador_modulo|
    start
    :Registrar\nProceso;
    :Registrar\nActividad;
    :Registrar\nEntradas/Salidas;
    stop
    | |


{enduml}

## DESCRIPCIÓN DE LAS ACTIVIADES DEL SISTEMA

### Registrar Proceso
En esta actividad se realiza el ingreso de los datos básicos para consolidar el registro del objeto proceso. El objeto proceso es la estructura padre del árbol que consolida la operación por procesos. El Proceso está constituido por uno o varios objetos actividades que tiene relacionados al uno o muchas entradas y salidas denominadas la caracterización del proceso; que representa la entrada de insumos, el troceso las transforma y salen como productos o insumos a otros procesos.

#### Historias de Usuario

- HUOP-01: Como **administrador_modulo** quiero registrar un procesos para parametrizar el sistema de la operación por proceso.

    - [1] **Seleccionar Tipo del Procerso**: El sistema debe permitir seleccionar Tipo de proceso [Estratégico, Misional, Apoyo, Control]

### Registrar Actividad
Durante esta actividad se realiza el ingreso de datos para el registro de un actividades asociado a un proceso.

#### Historias de Usuario

- HUOP-02: Como **administrador_modulo** quiero registrar una actividad o muchas para caracterizar el proceso.

    - [1] **Seleccionar Ciclo de la Actividad**: El sistema debe permitir seleccionar ciclo [Planar, Hacer, Verificar, Actuar]

### Registrar Entradas/Salidas
Durante esta actividad se realiza el ingreso de datos de los objetos Entradas y Salidas pertenecientes al objeto Actividad.

#### Historias de Usuario

- HUOP-03: Como **administrador_modulo** quiero registrar actividades que definirán la solución a los hallazgos del plan de mejoramiento.

    - [1] **Registrar Entrada Interna**: El sistema debe permitir diligenciar el campo Procesos:
    - [1] **Registrar Entrada Externa**: El sistema debe permitir diligenciar el campo Proveedor:
    - [1] **Registrar Salida Interna**: El sistema debe permitir diligenciar el campo Procesos:
    - [1] **Registrar Salida Externa**: El sistema debe permitir diligenciar el campos Cliente/Usuario:
