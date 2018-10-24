[[
title: Documento de Especificación de requerimientos del Módulo Gestión de Riesgos
author: José Javier Vargas Serrato
]]
Especificación de Requerimientos de Aplicaciones
=================================================

Gestión de Riesgos
=============================================

[TOC]

CASOS DE USO
------------

A continuación se listan y describen los actores principales del sistema, estos son candidatos para ser implementados como grupos de seguridad en el aplicativo:

### ACTORES

* **Registrador**: Tiene como responsabilidad registrar los riesgos a que estén a su cargo (el área a la cual pertenezca haga partes de las áreas gestoras del proceso)

* **Gestor**: Tiene como responsabilidad comentar y dirigir la buena caracterización del riesgo

* **Analista**: Tiene como responsabilidad consultar, supervisar y generar reportes de los riesgos.

### DIAGRAMA DE CASOS DE USO

#### Usuarios del Aplicativo
***

{uml}

		title Usuarios
		skinparam backgroundColor #E7E3E3

		left to right direction
		skinparam packageStyle rect
		actor usuario

		usuario <|-- registrador
		usuario <|-- gestor
		usuario <|-- analista
		registrador <|-- jefe_area
		registrador <|-- usuari_area
		gestor <|-- OAPC
		gestor <|-- OACI
		analista <|-- SGSI

{enduml}

#### Registrador

{uml}

		skinparam backgroundColor #E7E3E3
		left to right direction
		skinparam packageStyle rect
		actor registrador


		rectangle "Registrar Riesgos" {
			registrador -- (Registrar Riesgos)
		}

{enduml}

#### Gestor y Analista

{uml}

skinparam backgroundColor #E7E3E3
left to right direction
skinparam packageStyle rect
actor gestor
actor analista


rectangle "Consultar, Supervisar\ny Generar Reportes\n de Riesgos" {
	gestor -- (Consultar Riesgos)
	analista -- (Consultar Riesgos)
}
{enduml}



DIAGRAMA DE ACTIVIDADES DEL SISTEMA
-----------------------------------

{uml}

		title Diagrama de Actividades\n
		|#AntiqueWhite|registrador|
		start
		:Registrar Riesgos;
		|jefe_areas_gestoras|
		while (Aprobar Riesgo) is (no)
			|registrador|
			:Actualizar Riesgo;
		endwhile (si)
		|#AntiqueWhite|analista|
		:Consultar, supervisar\ny Generar Reportes;
		stop

{enduml}

## DESCRIPCIÓN DE LAS ACTIVIADES DEL SISTEMA

### Registrar Activos Riesgos
En esta actividad se realiza el ingreso de los datos básicos para consolidar el registro de riesgos conforme Guia 7 - Gestión  de Riesgo del Modelo de seguridad y privacidad de la información (MSPI) propuestos por el Mintic y la Gestion de Riesgo del Departamento de Función Publica DAFP.

#### Historias de Usuario

- HUOP-01: Como **registrado** quiero registrar un riesgo para consolidar la identificación y valoración al mismo.

    - [1] **Validar Usuario**: El sistema debe validar la unidad del registrador se encentre entre las areas gestoras del procesos seleccionado.

### Aprobar Riesgo
En esta actividad los jefes de áreas gestoras aprobaran el registro de riesgo definido al proceso que pertenecen.

#### Historias de Usuario

- HUOP-02: Como **jefe_areas_gestoras** quiero aprobar riesgo definido a mi procesos para darle debido tratamiendo de controles y seguimiento en la mitigación de este.

	- [1] **Revisión**: El sistema debe permitir cambiar el estado de  Definido a por_aprobar.
- [2] **Notificar Cambio de Estado**: El sistema debe notificar a los jefe_areas_gestoras del cambio de estado del riesgo.
- [3] **Validar Todas las Aprobaciones de los Jefes**: Se aprobará el riesgo cuando todos los jefes de las áreas gestoras 	del proceso den su aprobación.

### Consultar, Supervisar y Generar Reportes
Durante esta actividad se realiza el ejercicio de solo consulta a los riesgo y poder genera los reportes.

#### Historias de Usuario

- HUOP-03: Como **analista** quiero consultar, supervisar y generar reportes de los riesgo definidor por procesos.
- HUOP-04: Como **analista** quiero generar la matriz de riesgo de la organización definidar por procesos.
