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
