[[
title: Documento de diseño de Alto Nivel del Proceso Registro y Seguimiento Planes de Mejoramiento
author: José Javier Vargas Serrato
]]
Diseño de Alto Nivel
====================

Registro y Seguimiento Planes de Mejoramiento
============================

[TOC]

DIAGRAMA DE CLASES DE ALTO NIVEL
--------------------------------

{uml}

    hr.department "1" --* "*" plan_mejoramiento.plan: dependencia_id
    plan_mejoramiento.plan --|> project.project: Delegation[project_id]
    plan_mejoramiento.plan "1" --* "*" plan_mejoramiento.hallazgo
    plan_mejoramiento.hallazgo "1" --* "*" plan_mejoramiento.accion
    mapa_proceso.proceso "1" --* "*" plan_mejoramiento.hallazgo
    plan_mejoramiento.accion "1" --* "*" plan_mejoramiento.avance
    plan_mejoramiento.avance "*" *-- "1" plan_mejoramiento.tipo_calificacion
    plan_mejoramiento.accion "1" --* "*" project.task
    plan_mejoramiento.hallazgo --|> project.wbs: Delegation[wbs_root_id]
    plan_mejoramiento.accion --|> project.wbs: Delegation[wbs_root_id]
    project.project "*" -- "1" project.wbs

{enduml}

MODELO DE MÁQUINA DE ESTADOS
----------------------------

### Acciones

#### Diagrama de Estados

{uml}

    skinparam backgroundColor #E7E3E3
    [*] -> Nuevo
    Nuevo -> Por_Aprobar
    Por_Aprobar -> Nuevo
    Por_Aprobar -> En_Progreso
    Por_Aprobar -down> Cancelado
    En_Progreso -> Terminada
    Terminada -> [*]

{enduml}

- **Nuevo**
    - **Descripción:** Estado inicial y por defecto el que se asigna cuando se crea el registro de la acción.
    - **Acción a ejecutar en el sistema:**No aplica.

- **Por_Aprobar**
    - **Descripción:** Estado que indica que la acción ha sido creada y esta a la espera de la aprobación por el usuario auditor.
    - **Acción a ejecutar en el sistema:** El campo state cambia al valor por_aprobar. Se notifica al usuario auditor que se le ha creado una nueva acción para su debida revisión.

- **En_Progreso**
    - **Descripción:** Estado que indica que la acción fue aprobada por el auditor y puede ser alimentada con sus respectivos avances.
    - **Acción a ejecutar en el sistema:**El campo state cambia al valor en_progreso.

- **Terminada**
    - **Descripción:** Estado que indica que la acción ha sido cumplida o terminada por el responsable correspondiente al área a la cual se establecio la acción.
    - **Acción a ejecutar en el sistema:**El campo state cambia al valor terminada.

- **Cancelada**
    - **Descripción:** Estado que indica la acción ya no está activa en el sistema.
    - **Acción a ejecutar en el sistema:**El campo state cambia al valor cancelado.

#### Transiciones

- **Nuevo a Por_Aprobar**
    - **Validación**: Los campo obligatorios diligenciados.
    - **Grupo**: Responsables
    - **Acción disparadora/trigger**: Acción manual a través de boton.

- **Por_Aprobar a Nuevo**
    - **Validación**: No aplica.
    - **Grupo**: Auditor
    - **Acción disparadora/trigger**: Acción manual a través de boton.

- **Por_Aprobar a En_Progreso**
    - **Validación**: No aplica.
    - **Grupo**: Auditor
    - **Acción disparadora/trigger**: Acción manual a través de boton.

- **En_Progreso a Terminada**
    - **Validación**: No aplica.
    - **Grupo**: Auditor
    - **Acción disparadora/trigger**: Acción manual a través de boton.

- **En_Progreso a Cancelada**
    - **Validación**: No aplica.
    - **Grupo**: Auditor
    - **Acción disparadora/trigger**: Acción manual a través de boton.

MODELO DE SEGURIDAD Y CONTROL DE ACCESO
---------------------------------------

A continuación se listan los permisos que tendrán los grupos de usuario sobre los diferentes objetos de negocio del sistema y las restricciones de dominio.
<center>

|Nombre del Grupo|Objeto de negocio|Permisos||||Restricciones de dominio|
|--------|-------|--------|-------|--------|-------|-------|
|||**Leer**|**Actualizar**|**Crear**|**Borrar**||
|Analistas|Plan de Mejoramiento|X|-|-|-|-|
|Analistas|Hallazgo|X|-|-|-|-|
|Analistas|Acciones|X|-|-|-|-|
|Analistas|Avances|X|-|-|-|-|
|Analistas|Observaciones|X|X|X|-|-|
|Responsable|Plan de Mejoramiento|X|-|-|-|Solo puede ver los registros asociado a su dependencia|
|Responsable|Hallazgo|X|-|-|-|Solo puede ver los registros asociado a su dependencia|
|Responsable|Accion|X|X|X|-|Solo puede ver los registros asociado a su dependencia|
|Responsable|Avances|X|X|X|-|-|
|Auditor|Plan de Mejoramiento|X|X|X|-|-|
|Auditor|Hallazgo|X|X|X|-|-|
|Auditor|Acciones|X|X|-|-|-|
|Auditor|Avances|X|X|-|-|-|
|Auditor|Observaciones|X|X|X|-|-|
|administrador|Plan de Mejoramiento|X|X|X|X|-|
|administrador|Hallazgo|X|X|X|X|-|
|administrador|Acciones|X|X|X|X|-|
|administrador|Avances|X|X|X|X|-|
|administrador|Observaciones|X|X|X|X|-|

</center>
