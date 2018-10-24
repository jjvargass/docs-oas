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

    activo_informacion.activo "*" *-- "1" activo_informacion.activo_tipo
    activo_informacion.activo "*" *-- "1" hr.department
    activo_informacion.activo "*" *-- "1" hr.employee
    activo_informacion.activo "*" *-- "1" mapa_proceso.proceso

{enduml}

MODELO DE MÁQUINA DE ESTADOS
----------------------------

### Modelo: activo_informacion.activo

#### Diagrama de Estados

{uml}

    [*] -> Definido
    Definido -> Revisado
    Revisado -> Definido
    Revisado -> Publicado
    Publicado -> Cancelado
    Cancelado -> [*]
    Publicado -> Actualizado
    Actualizado -> Publicado

{enduml}

- **Definido**
    - **Descripción:** Estado inicial o por defecto. Este estado es asignado cuando se ha creado un registro de activo de información.
    - **Acción a ejecutar en el sistema:** No aplica.

- **Revisado**
    - **Descripción:** Estado que indica la solicitud de revisión por el usuario Gestor.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Revisado.

- **Publicado**
    - **Descripción:** Estado que indica que el Activo fue aceptada por el Gestor y hará parte del inventario.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Publicado.

- **Actualizado**
    - **Descripción:** Estado que indica que el Activo será Actualizado del inventario.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor Actualizado.

- **Cancelado**
    - **Descripción:** Estado que indica que el Activo será cancelado del inventario.
    - **Acción a ejecutar en el sistema:** El campo estado cambia al valor cancelado.

#### Transiciones

- **Definido a Revisado**
    - **Validación**:  No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Revisado a Definido**
    - **Validación**: No aplica.
    - **Grupo**: Gestor
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Revisado a Publicado**
    - **Validación**: No aplica.
    - **Grupo**: Gestor
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Publicado a Actualizado**
    - **Validación**: No aplica.
    - **Grupo**: Gestor
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Actualizado a Publicado**
    - **Validación**: No aplica.
    - **Grupo**: Registrador
    - **Acción disparadora/trigger**: Acción manual a través de botón.

- **Publicado a Cancelado**
    - **Validación**: No aplica.
    - **Grupo**: Gestor
    - **Acción disparadora/trigger**: Acción manual a través de botón.


MODELO DE SEGURIDAD Y CONTROL DE ACCESO
---------------------------------------

A continuación se listan los permisos que tendrán los grupos de usuario sobre los diferentes objetos de negocio del sistema y las restricciones de dominio.
<center>

|Nombre del Grupo|Objeto de negocio|Permisos||||Restricciones de dominio|
|--------|-------|--------|-------|--------|-------|-------|
|||**Leer**|**Actualizar**|**Crear**|**Borrar**||
|registrado|activo|X|X|X|-|-|
|registrado|activo_tipo|X|-|-|-|-|
|gestor|activo|X|X|-|-|-|
|registrado|activo_tipo|X|X|X|-|-|
|administrador|activo|X|X|X|X|-|
|administrador|activo_tipo|X|X|X|X|-|



</center>
