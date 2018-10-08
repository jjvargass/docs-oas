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

DIAGRAMA DE ACTIVIDADES DEL SISTEMA
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

## DESCRIPCIÓN DE LAS ACTIVIADES DEL SISTEMA

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
        - Nombre, Descripción, Tipo (Preventivo, Correctivo, De Mejora, Corrección), Área, Jefe de Área, Responsable, Objetivo(texto), Indicador(texto), Unidad de medida(texto),Meta(texto), Recursos(texto), Fecha inicial(date), Fecha final(date), Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [2] **Registrar Acción Plan de Mejoramiento Externo PM Contraloría de Bogotá**: El sistema debe permitir diligenciar los campos:
        - Nombre, Descripción, Área, Jefe de Área, Responsable, Indicador(texto), Meta(texto), Recursos(Texto), Fecha inicial, Fecha final, Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [3] **Registrar Acción de Plan de Mejoramiento Externo Contraloría General de la República (CGR)**: El sistema debe permitir diligenciar los campos:
        - Nombre, Descripción, Área, Jefe de Área, Responsable, Objetivo(texto), Denominación de Medida, Unidad De Medida, Fecha inicial, Fecha final, Responsable seguimiento OCI(Relacionado con el auditor del hallazgo).
    - [4] **Filtros y Búsquedas de Acción**: El sistema debe permitir consultar las Actividades y filtrarlas por Tipo(Interno, Contraloría Bogotá, Contraloría General), Plan de mejoramiento, Estado, Dependencia, Responsable. Adicionalmente se debe permitir agrupar las actividades por Fecha de inicio, Fecha de finalización, Dependencia, Responsable.
    - [5] **Restricción de dominio de Acción**: El usuario **responsable** podrá registrar las acciones relacionadas a un hallazgo de su dependencia. tendrá acceso de lectura a todas las Acciones pero solo podrá modificar o intervenir en las que estén asignadas a su dependencia.
El usuario **auditor** podrá crear registros de Acciones, podrá leer todos los registro de Acciones para realizar control y auditoría de estos; pero solo podrá modificar los registros asignados a él.
El usuario **analistas** podrá leer todos los Acciones.


### Aceptar Acción
En esta actividad los usuarios **auditor** aceptan o rechazan el registro de acciones creados por los usuarios responsables.

#### Historias de Usuario

- HUPM-04: Como **responsable** requiero cambiar el estado de las acciones del plan de mejoramiento de **Nuevo** a **Por Aprobar** para que el auditor realice la revisión.
    - [1] **Acción por Aprobar**: El sistema debe permitir cambiar el estado de nuevo a por abrobar.
    - [2] **Notificar Cambio de Estado**: El sistema debe notificar al auditor del cambio de estado de la acción.
<br>

- HUPM-05: Como usuario **auditor** quiero aprobar o rechazar una acción creada por los usuarios responsables.

    - [1] **Aceptar/Rechazar Acciones**: El sistema debe  permitir aceptar o rechazar la acción.
    - [2] **Notificar Aceptación y Rechazo de Acciones**: El sistema debe notificar al usuario **responsable** del rechazo de la acción por el auditor.


### Actualizar Acción
En esta actividad los usuarios **responsables** actualizan la acción acorde a las observaciones dejadas por el auditor.

#### Historias de Usuario

- HUPM-06: Como **responsable** requiero actualizar el registro de las acciones para que sean revisadas nuevamente por el auditor.
    - [1] **Acción para actualizar**: El sistema debe permitir actualizar la acción para de nuevo cambiar de estado por aprobar.


### Registrar Avances y/o Tareas

Durante esta actividad se realiza el registro de Tareas y avaces pertenecientes a una Acción del Plan de Mejoramiento.
Las tareas se asignan a otras áreas para dar cumplimiento de la actividad en caso de requerir insumos de otras areas de la organización.
Los avances es la definición de lo realizado o trabajado en el transcurso del mes vencido.

#### Historias de Usuario

- HUPM-07: Como **resonsable** quiero registrar tareas para solicitar insumos a otras áreas; para abarcar la solución de la Acción definida.

    - [1] **Registrar Tarea a la Acción**: El sistema debe permitir diligenciar los campos: resumen de la tarea, asignado a(ejecutor), fecha de inicio, fecha de finalización, actividad del plan a la que pertenece.
    - [2] **Filtros y Búsquedas de Tareas**: El sistema debe permitir consultar las Tareas y filtrarlas por Responsable, Estado, Asignadas a mí, Plan de Mejoramiento(proyecto), Actividad. Adicionalmente se debe permitir agrupar las tareas por Fecha de inicio, Fecha de finalización, Responsable, Plan de mejoramiento, Actividad y Estado.
    - [3] **Restricción de dominio de Tareas**: El usuario auditor podrá leer  todos los registros de Tareas.
El jefe_dependencia puede crear y editar todas las tareas relacionadas a una acción que pertenezca a su dependencia.
El usuario analistas podrá leer todas las tareas.

<br>

- HUPM-08: como Administrador del módulo quiero abrir el sistema para permitir el registro de avances a las actividades.

    - [1] **Abrir sistema para registro de acciones**: Al estar abierto el sistema los usuarios responsables podrán adicionar avances a las actividades de sus planes de mejoramiento. No se podrán editar avances de periodos anteriores.
    - [2] **Cerrar sistema para registro de acciones**: Al estar cerrado el sistema los  usuarios responsables no podrán adicionar ni editar los avances de las actividades de sus planes de mejoramiento.

<br>

- HUPM-09: como responsable quiero registrar avances de una acción para soportar lo realizado durante el mes a esta acción encomendada a realizar.

    - [1] **Registrar Avance**: El sistema debe permitir diligenciar los campos: descripción avance, fecha de corte.
    - [2] **Restricción de dominio de Avances**: La creación del avance la puede realizar el jefe de la dependencia. La edición la puede realizar solo para los avances del periodo actual, no podrá editar los avances ya registrados para otros periodos.
Los auditores OCI sólo podrá consultar los avances.
El usuario analistas sólo podrá leer los avances.


### Aceptar/Rechazar avances mensuales de la Acción

El **jefe dependencia** quiero aprobar “dar visto bueno” a un avances creado por el ejecutor para autorizar la legalidad del avances y pueda ser calificado.

#### Historias de Usuario

- HUPM-10: como usuario administrador requiero parametrizar las diferentes calificaciones disponibles en el sistema de acuerdo al tipo de plan de mejoramiento.

    - [1] **Dar visto bueno al Avances**: El sistema debe permitir seleccionar un botón de aprobación únicamente para el jefe del are.  con está aprobación se podrá realizar la calificación por parte del auditor.

### Registrar Observaciones

Se registra las observaciones a los avances reportados mensualmente.

#### Historias de Usuario
- SPM-09: como usuario quiero registrar una observación a un  avance de las actividades establecidas en un plan de mejoramiento, esto con el fin de darle seguimiento y cumplimiento a las acciones.

    - [1] **Registrar Observación a Avances de Plan de Mejoramiento**: El sistema debe permitir diligenciar los campos: descripción observación.


### Registrar calificación (cuantificación/cualificación) de Avances

El **auditor** quiero registra un porcentaje de avance "calificación" y asigna un estado de dicho avances realizados por el área encargada en el transcurso de mes.

#### Historias de Usuario

- HUPM-10: como usuario administrador requiero parametrizar las diferentes calificaciones disponibles en el sistema de acuerdo al tipo de plan de mejoramiento.

    - [1] **Registrar Tipos de Calificaciones de Avances**: El sistema debe permitir diligenciar los campos: Nombre de la calificación, tipo de plan de mejoramiento al que aplica, estado interno (sin iniciar, en progreso, bloqueado, terminado, terminado con retraso)
    - [2] **Restricción de dominio de Tipos de Calificaciones Avances**: La creación/Edición la puede realizar el administrador y puede ser consultada por todos los usuarios.

- HUPM-11: como usuario **auditor** quiero registrar una calificación a los Avances de una Acción; para darle un control porcentual al trabajo de las áreas relacionadas en el transcurso del mes.

    - [1] **Registrar Calificación de Avances**: El sistema debe permitir diligenciar los campos: Cuantificación de Cumplimiento, Estado (Selección).
    - [2] **Notificar Calificación de Avances**: El sistema debe enviar un correo electrónico a los jefe de dependencia notificando dicha calificación.
    - [3] **Registrar Cambios de Avances**: Se permite la modificación de calificaciones pero el sistema debe guardar el registro de los cambios realizados en la calificación.
    - [4] **Restricciones de dominio**: Sólo puede calificar el auditor responsable del plan de mejoramiento al que pertenece la actividad. Los jefes de dependencia sólo pueden consultar la calificación.

### Generar Reportes

En esta actividad los usuarios podrán acceder a los distintos tipos de reportes para el control, seguimiento y monitoreo del plan de mejoramiento.

#### Historias de Usuario Generar Reportes

- SPM-10: como usuario quiero generara un reporte de los planes de mejoramiento para entregarlos a los distintos entes de control internos como externos.

    - [1] **Generar Informe formato internos**: El sistema debe proporcionar un archivo consolidado con la información de los planes de mejoramiento en el formato requerido
    - [3] **Generar Informe formato Contraloría General**: El sistema debe proporcionar un archivo consolidado con la información de los planes de mejoramiento en el formato requerido
    - [2] **Generar Informe formato Contraloría Distrital**: El sistema debe proporcionar un archivo consolidado con la información de los planes de mejoramiento en el formato requerido

- SPM-11: como usuario quiero acceder a un semáforo que me muestre el estado de avance o retraso de las actividades de acuerdo a las fechas programadas

    - [1] **Despliegue de Semáforo**: El sistema debe desplegar en verde las actividades terminada antes de las fecha final programada, en amarillo las terminas con retraso y en rojo las vencidas y no terminadas.
