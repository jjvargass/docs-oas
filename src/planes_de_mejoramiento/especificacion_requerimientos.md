[[
title: Documento de Especificación de requerimientos del Proceso Registro y Seguimiento Planes de Mejoramiento
author: José Javier Vargas Serrato
]]
Especificación de Requerimientos de Aplicaciones
=================================================

Registro y Seguimiento de los Planes de Mejoramiento
=============================================

[TOC]

CASOS DE USO
------------

A continuación se listan y describen los actores principales del sistema, estos son candidatos para ser implementados como grupos de seguridad en el aplicativo:

### ACTORES

* **Responsable**:  Tiene a cargo el registro de Acciones y Avances que coincidan con su dependencia. 
    * **Jefe De Area**
    * **Ejecutor**
  
* **Auditor**: Tiene como responsabilidad registrar los planes, los hallazgo, aprobar las acciones y calificar los avances. 

* **Analista**: Tiene como responsabilidad:

    - Consultar los registros de avances de los usuarios responsables y auditores.
    - Registro de observaciones para solicitar a los responsables la ampliación de la información.
    - Generar reportes.


* **Administrador Módulo**: Tiene como responsabilidad parametrizar el sistema.

### DIAGRAMA DE CASOS DE USO

#### Usuarios del Aplicativo
***

{uml}
	title Usuarios
	skinparam backgroundColor #E7E3E3

    left to right direction
    skinparam packageStyle rect
    actor usuario
    actor responsable
    actor jefe_dependencia
    actor ejecutor
    actor auditor
    actor analista

    usuario <|-- responsable
    responsable <|-- jefe_dependencia
    responsable <|-- ejecutor
    usuario <|-- auditor
    auditor <|-- oci
    usuario <|-- analista
    analista <|-- OAP
    analista <|-- CCCI
    analista <|-- DG

{enduml}

#### Auditor
***

{uml}
    skinparam backgroundColor #E7E3E3
    left to right direction
    skinparam packageStyle rect
    actor auditor
    rectangle "Registro de Plan de Mejoramiento" {
      auditor -- (Registrar\n Plan de mejoramiento)
      (Registrar hallazgo) .> (Registrar\n Plan de mejoramiento)  : extends

      (Aprobar/Desaprobrar\n acciones)
      (Aprobar/Desaprobrar\n acciones) .> (Registrar hallazgo) : extends
      (Calificar avances)
      (Calificar avances) .> (Aprobar/Desaprobrar\n acciones) : extends
    }

{enduml}

#### Responsable
***

{uml}

    skinparam backgroundColor #E7E3E3
    left to right direction
    skinparam packageStyle rect
    actor responsable

    rectangle "Resgistro de Acciones y Avances" {
      responsable -- (Registrar acciones)
      (Registrar Tareas) .> (Registrar acciones): extends
      responsable -- (Resgistrar avances)
    }

{enduml}

#### Analista
***

{uml}

    skinparam backgroundColor #E7E3E3
    left to right direction
    skinparam packageStyle rect
    actor analista

    rectangle "Registro de Observaciones\n Módulo Plan de Mejoramiento" {
      analista -- (Registrar observaciones\nPlan, Hallazgo,\nAcción, Avance)
    }

{enduml}

#### Módulos
***

{uml}

    skinparam backgroundColor #E7E3E3
    left to right direction
    skinparam packageStyle rect
    actor usuario

    rectangle "Módulo de Reportes" {
     usuario  -- (Reporte Planes de Mejoramiento)
    }

{enduml}

{uml}

skinparam backgroundColor #E7E3E3
left to right direction
    skinparam packageStyle rect
    actor responsable

    rectangle "Módulo de Notificaciones" {
     responsable -- (Notificar asignación de hallazgo)
     responsable -- (Notificar aprobación de acción)
     responsable -- (Notificar fechas de registro de avances)
    }

{enduml}

Diagrama de Actividades del sistema
-----------------------------------

{uml}

    title Diagrama de Actividades \n
    |#AntiqueWhite|auditor|
    start

    :Registrar\nplan de mejoramiento;
    :Registrar hallazgo;
    |responsable|
    :Registrar Acciones;
    |auditor|
    while (aceptar accion) is (no)
      |responsable|
      :Actualizar acción;
    endwhile (si)
    |responsable|
    :Registrar avances y/o tareas;
    |Jefe Dependencia|
    :Aceptar/Rechazar avances\nmensuales de las Acciones;
    |usuario|
    :Registrar observaciones;
    |auditor|
    :Registrar calicicación\n(cuantificación/cualificación)\nde avances;
    |#AntiqueWhite|usuario|
    :Generar reportes;
    stop

{enduml}

## Descripción de las Actividades del Sistema

### Registrar Plan de Mejoramiento
En esta actividad se realiza el ingreso de los datos básicos para consolidar el registro del objeto Plan. El objeto Plan es la estructura padre del árbol que consolida un plan de mejoramiento. 

El Plan de Mejoramiento está constituido por uno o varios objetos Hallazgos relacionados al objeto Plan. Los registros del objeto Acción están asociados a los objetos Hallazgos; a su vez el objeto Avances al objeto Ación.

##### **Historias de Usuario**

- HUPM-01: Como **auditor** quiero registrar un plan de mejoramiento para darle debido tratamiento conforme a la mejora continua de la organización. 

    - [1] **Registrar Plan de Mejoramiento Interno**: El sistema debe permitir diligenciar los campos: Nombre, Radicado, Dependencia, Tipo, Origen plan de mejoramiento, proceso origen plan de mejoramiento, dependencia que formula el plan.
    - [2] **Registrar Plan de Mejoramiento Externo Contraloría General de la República (CGR)**: El sistema debe permitir diligenciar los campos: Nombre, Radicado Orfeo, Tipo, Dependencia.
    - [3] **Registrar Plan de Mejoramiento Externo Contraloría de Bogotá (CB)**: El sistema debe permitir diligenciar los campos: Nombre, Radicado, Dependencia, Tipo.
    - [4] **Filtros y Búsquedas de planes de mejoramiento**: El sistema debe proporcionar una vista que permite realizar filtros de búsqueda por; tipo de plan de mejoramiento, estados, áreas responsables. Esto para facilitar el seguimiento y control de los planes de mejoramiento.
    - [5] **Restricción de dominio del plan de mejoramiento**: El usuario auditor podrá leer todos los registros de planes para realizar control y auditoría de estos; pero solo podrá modificar los que esté en su dominio "registro creados por él". 
    El usuario jefe_dependencia tendrá acceso de lectura únicamente a los planes que estén asignados a su dependencia. 
    El usuario analistas podrá leer todos los planes.


### Registrar Hallazgo
Durante esta actividad se realiza el ingreso de datos para el registro de un Hallozgo asosiado a un plan de mejoramiento registrado.

#### Historias de Usuario

- HUPM-02: Como **auditor** quiero registrar un hallazgo a un área específica de la organización para que éste le dé el tratamiento debido para solucionarlo. 

    - [1] **Registrar Hallazgo de Plan de Mejoramiento Interno**: El sistema debe permitir diligenciar los campos: Nombre de hallazgo, Descripción, Causa, Área.
    - [2] **Registrar Hallazgo de Plan de Mejoramiento Externo Contraloría de Bogotá**: El sistema debe permitir diligenciar los campos: Nombre de hallazgo, Descripción Causa, Área, Causas.
    - [3] **Registrar Hallazgo de Plan de Mejoramiento Externo Contraloría General de la República (CGR)**: El sistema debe permitir diligenciar los campos: Nombre de hallazgo, Descripción hallazgo, Causa del hallazgo, Efecto del hallazgo.
    - [4] **Filtros y Búsquedas de Hallazgos**: El sistema debe permitir consultar los hallazgos y filtrarlos por Tipo (Interno, Contraloria Bogotá, Contraloría General), Plan de Mejoramiento.
    - [5] **Restricción de dominio de Hallazgos**: El usuario auditor podrá leer todos los registro de Hallazgo para realizar control y auditoria de estos; pero solo podrá modificar los registros que esté en su dominio "registro creados por él".
    El usuario jefe_dependencia tendrá acceso de lectura únicamente a los hallazgos que estén asignados a su dependencia.
    El usuario analistas podrá leer todos los Hallazgos.

### Registrar Acción
Durante esta actividad se realiza el ingreso de datos de los objetos Acciones que van a permitir dar solución un Hallazgo definido por el auditor.

#### Historias de Usuario

- HUPM-03: Como **responsable** quiero registrar actividades que definirán la solución a los hallazgos del plan de mejoramiento.

    - [1] **Registrar Acción de Plan de Mejoramiento Interno:**: El sistema debe permitir diligenciar los campos: 
        - Nombre
        - Descripción
        - Tipo (Preventivo, Correctivo, De Mejora, Corrección)
        - Área
        - Jefe de Área
        - Objetivo(texto)
        - Indicador(texto)
        - Unidad de medida(texto)
        - Meta(texto)
        - Recursos(texto)
        - Fecha inicial(date)
        - Fecha final(date)
        - Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [2] **Registrar Acción Plan de Mejoramiento Externo PM Contraloría de Bogotá**: El sistema debe permitir diligenciar los campos: 
        - Nombre
        - Descripción
        - Área
        - Jefe de Área
        - Indicador(texto)
        - Meta(texto)
        - Recursos(Texto)
        - Fecha inicial 
        - Fecha final 
        - Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [3] **Registrar Acción de Plan de Mejoramiento Externo Contraloría General de la República (CGR)**: El sistema debe permitir diligenciar los campos: 
        - Nombre
        - Descripción
        - Área
        - Jefe de Área
        - Objetivo(texto)
        - Denominación de Medida
        - Unidad De Medida
        - Fecha inicial 
        - Fecha final 
        - Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [4] **Filtros y Búsquedas de Acción**: El sistema debe permitir consultar las Actividades y filtrarlas por Tipo(Interno, Contraloría Bogotá, Contraloría General), Plan de mejoramiento, Estado, Dependencia, Responsable. Adicionalmente se debe permitir agrupar las actividades por Fecha de inicio, Fecha de finalización, Dependencia, Responsable.
    - [5] **Restricción de dominio de Acción**: El usuario **responsable** podrá registrar las acciones relacionadas a un hallazgo de su dependencia. tendrá acceso de lectura a todas las Acciones pero solo podrá modificar o intervenir en las que estén asignadas a su dependencia.
El usuario **auditor** podrá crear registros de Acciones, podrá leer todos los registro de Acciones para realizar control y auditoría de estos; pero solo podrá modificar los registros asignados a él.
El usuario **analistas** podrá leer todos los Acciones.
