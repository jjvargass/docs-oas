[[
title: Documento de diseño de Alto Nivel del Módulo Operación por Procesos
author: José Javier Vargas Serrato
]]
Diseño de Alto Nivel
====================

Operación por Procesos
============================

[TOC]

DIAGRAMA DE CLASES DE ALTO NIVEL
--------------------------------

{uml}

    hr.department "*" --> "*" mapa_proceso.proceso
    mapa_proceso.proceso "1"--> "*" mapa_proceso.actividad
    mapa_proceso.actividad "1"--> "*" mapa_proceso.entrada
    mapa_proceso.actividad "1"--> "*" mapa_proceso.salida

{enduml}

MODELO DE MÁQUINA DE ESTADOS
----------------------------
No se cuenta con un objeto que contenga cambios de estados

MODELO DE SEGURIDAD Y CONTROL DE ACCESO
---------------------------------------

A continuación se listan los permisos que tendrán los grupos de usuario sobre los diferentes objetos de negocio del sistema y las restricciones de dominio.
<center>

|Nombre del Grupo|Objeto de negocio|Permisos||||Restricciones de dominio|
|--------|-------|--------|-------|--------|-------|-------|
|||**Leer**|**Actualizar**|**Crear**|**Borrar**||
|administrador|Proceso|X|X|X|X|-|
|administrador|Actividad|X|X|X|X|-|
|administrador|Entrada|X|X|X|X|-|
|administrador|Salida|X|X|X|X|-|
</center>
