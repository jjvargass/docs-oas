[[
title: Documento de diseño de Alto Nivel del Módulo Gestión de Activod de Información
author: José Javier Vargas Serrato
]]
Diseño de Alto Nivel
====================

Gestión de Activos de Información
============================

[TOC]

DIAGRAMA DE CLASES DE ALTO NIVEL
--------------------------------

{uml}

  riesgo.riesgo "*" *-- "1" riesgo.causa
  riesgo.riesgo "*" *-- "1" riesgo.contexto
  riesgo.riesgo "*" *-- "1" riesgo.tipo_riesgo
  riesgo.riesgo "*" *-- "1" riesgo.probabilidad
  riesgo.riesgo "*" *-- "1" riesgo.impacto
  riesgo.riesgo "1" --* "*" riesgo.evaluacion_control
  riesgo.riesgo "*" *-- "1" mapa_proceso.proceso
  riesgo.riesgo "*" *-- "1" activo_informacion.activo_tipo
  riesgo.riesgo "*" *-- "1" hr.department
  riesgo.riesgo "*" *-- "1" res.user

{enduml}

MODELO DE MÁQUINA DE ESTADOS
----------------------------

### Modelo: riesgo.riesgo

#### Diagrama de Estados

{uml}

    [*] -> Nuevo
    Nuevo -> Aprobado
    Aprobado -> Tratamiento
    Tratamiento -> Aceptado
    Aceptado -> [*]
    Tratamiento -> Actualizado
    Actualizado -> Tratamiento
    Actualizado -> Aceptado

{enduml}

- **Nuevo**
    - **Descripción:** Estado inicial o por defecto. Este estado es asignado cuando se ha creado un registro de riesgo.
    - **Acción a ejecutar en el sistema:** No aplica.

- **Aprobado**
    - **Descripción:** Estado que indica la aprobación de los jefes de áreas gestoras del proceso.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Aprobado.

- **Tratamiento**
    - **Descripción:** Estado que indica la fase de monitoreo y control del riesgo por los gestores
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Publicado.

- **Actualizado**
    - **Descripción:** Estado que indica que el riesgo se actualiza en su definición para obtener nueva valoración.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Actualizado.

- **Aceptado**
    - **Descripción:** Estado que indica que el riesgo será aceptado por la organización.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Aceptado.

#### Transiciones

- **Nuevo a Aprobado**
    - **Validación**: los campos obligatorios diligenciados.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción Automática del sistema, valida aprobación de jefes de áreas gestoras.

- **Aprobado a Tratamiento**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Tratamiento a Actualizado**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Actualizado a Tratamiento**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Tratamiento a Aceptado**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Actualiazado a Aceptado**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.


MODELO DE SEGURIDAD Y CONTROL DE ACCESO
---------------------------------------

A continuación se listan los permisos que tendrán los grupos de usuario sobre los diferentes objetos de negocio del sistema y las restricciones de dominio.
<center>

|Nombre del Grupo|Objeto de negocio|Permisos||||Restricciones de dominio|
|--------|-------|--------|-------|--------|-------|-------|
|||**Leer**|**Actualizar**|**Crear**|**Borrar**||
|registrado|causa|X|X|X|-|-|
|registrado|contexto|X|X|X|-|-|
|registrado|tipo_riesgo|X|X|X|-|-|
|registrado|probabilidad|X|-|-|-|-|
|registrado|impacto|X|-|-|-|-|
|registrado|control|X|X|X|-|-|
|registrado|evaluacion_control|X|X|X|-|-|
|registrado|riesgo|X|X|X|-|-|
|gestor|causa|X|-|-|-|-|
|gestor|contexto|X|-|-|-|-|
|gestor|tipo_riesgo|X|-|-|-|-|
|gestor|probabilidad|X|-|-|-|-|
|gestor|impacto|X|-|-|-|-|
|gestor|control|X|-|-|-|-|
|gestor|evaluacion_control|X|-|-|-|-|
|gestor|riesgo|X|-|-|-|-|
|administrador|causa|X|X|X|X|-|
|administrador|contexto|X|X|X|X|-|
|administrador|tipo_riesgo|X|X|X|X|-|
|administrador|probabilidad|X|X|X|X|-|
|administrador|impacto|X|X|X|X|-|
|administrador|control|X|X|X|X|-|
|administrador|evaluacion_control|X|X|X|X|-|
|administrador|riesgo|X|X|X|X|-|

</center>
