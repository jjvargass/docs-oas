[[
title: Documento de Especificación de requerimientos del Módulo Gestión Activo de Información
author: José Javier Vargas Serrato
]]
Especificación de Requerimientos de Aplicaciones
=================================================

Gestión Actiovos de Información
=============================================

[TOC]

CASOS DE USO
------------

A continuación se listan y describen los actores principales del sistema, estos son candidatos para ser implementados como grupos de seguridad en el aplicativo:

### ACTORES

* **Registrador**: Tiene como responsabilidad registrar los activos de información que estén a su cargo o disposición.

* **Gestor**: Tiene como responsabilidad aprobar o rechazar los activos de información de un grupo a su cargo que pertenezcan a su unidad o departamento.

* **Analista**: Tiene como responsabilidad consultar y supervisar  los activos de información.

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
	analista <|-- OAP
	gestor <|-- SGSI

{enduml}

#### Registrador

{uml}

	skinparam backgroundColor #E7E3E3
	left to right direction
	skinparam packageStyle rect
	actor registrador


	rectangle "Registro Activo de Información" {
		registrador -- (Registrar\nActivo de Información)
	}

{enduml}

#### Gestión

{uml}

	skinparam backgroundColor #E7E3E3
	left to right direction
	skinparam packageStyle rect
	actor gestor


	rectangle "Aproba o Rechazar\nActivo de Información" {
		gestor -- (Aprobar o Rechazar\nActivos de Información)
	}

{enduml}

#### Analista

{uml}

	skinparam backgroundColor #E7E3E3
	left to right direction
	skinparam packageStyle rect
	actor analista

	rectangle "Consulta y Generación de Reportes" {
	 analista -- (Generar reporte de inventario)
	 analista -- (Consulta de activos de información)

	}


{enduml}


DIAGRAMA DE ACTIVIDADES DEL SISTEMA
-----------------------------------

{uml}

	title Diagrama de Actividades \n
	|#AntiqueWhite|registrador|
	start
	:Registrar\nActivos de Información;
	|gestor|
	while (Aprobar Activos) is (no)
		|registrador|
		:Actualizar\nActivos de Información;
	endwhile (si)
	|#AntiqueWhite|analista|
	:Consultar, supervisar\ny Generar Reportes;
	stop


{enduml}

## DESCRIPCIÓN DE LAS ACTIVIADES DEL SISTEMA

### Registrar Activos de Información
En esta actividad se realiza el ingreso de los datos básicos para consolidar el registro del objeto activo de información conforme a la Guia 7 - Gestión  y Clasificación de Activos de Información del Modelo de seguridad y privacidad de la información (MSPI) propuestos por el Mintic.

#### Historias de Usuario

- HUOP-01: Como **registrado** quiero registrar un activo de información para consolidar un inventario de activos por procesos.

    - [1] **Validar Usuario**: El sistema debe validar la unidad del registrador se encentre entre las areas del procesos seleccionado.

### Aprobar Activos
En esta actividad el usuario gestor aprueba o rechaza el activo de información conforme a los criterios de la politica de seguridad de la ifnormación y lo establecido por el dueño de la ifnormación.

#### Historias de Usuario

- HUOP-02: Como **gestor** quiero cambiar el estado de un activo de información para garantizar la calidad de los datos de este y confirmar el ingreos del activo al inventario.

    - [1] **Revisión**: El sistema debe permitir cambiar el estado de  Definir a Revisión.[2] Notificar Cambio de - [2] **Estado**: El sistema debe notificar al registrador del cambio de estado del activo.

### Consultar, Supervisar y Generar Reportes
Durante esta actividad se realiza el ejercicio de solo consulta a los actios de información y poder genera los reportes de inventarios.

#### Historias de Usuario

- HUOP-03: Como **analista** quiero consultar, supervisar y generar reportes de activos de información para estar informado de lo activos de información dentro de la organización.
