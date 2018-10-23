Create database Club_Conquistadores
go
USE Club_Conquistadores
Create Table Club
(
[id_club] [int] IDENTITY (1,1) NOT NULL,
[nom_club]   [NVARCHAR] (40),
[direccion]  [nvarchar] (50),
[lema]       [nvarchar] (50),
[logo]       [nvarchar] (20),
[City]       [nvarchar] (50)
)

Create Table Directivos
(
[id_direct] [int] IDENTITY(1,1) NOT NULL,
[id_club] int,
[nombre]     [nvarchar] (75),
[direccion]  [nvarchar] (50),
[puesto]     [nvarchar] (20)
)

Create Table Conquistadores
(
[id_conquist]  [int] NOT NULL,
[id_club]      [int],
[id_unidad]    [int],
[id_padre]     [int],
[id_clase]     [int],
[Nom_Conquist] [nvarchar] (75),
[fecha_nac]    [date],
[edad]         [int],
[sexo]         [nvarchar] (10),
[estatura]     [decimal] (4,1),
[peso]         [decimal] (4,1),   
)
Create Table Unidad
(
[id_unidad] [int] NOT NULL,
[id_club]   [int],
[nombre]    [nvarchar] (30),
[logo]      [nvarchar] (20),
[lema]      [nvarchar] (50),
)

Create Table Padre
(
[id_padre]   [int] IDENTITY(1,1) NOT NULL,
[nombre]     [nvarchar] (75),
[telefono]   [nvarchar] (20),
[ocupacion]  [nvarchar] (30)

)
Create Table Clase
(
[id_clase] [int] NOT NULL,
[nombre]   [nvarchar] (40),
[color]    [nvarchar] (15),
[logo]     [nvarchar] (20)

)

Create Table Instructor
(
[id_instructor]   [int] IDENTITY(1,1) NOT NULL,
[id_clase]        [int],
[nombre]          [nvarchar] (75),
[direccion]       [nvarchar](50),
[telefono]        [nvarchar](20)

)

Create Table Reunion
(
[id_reunion]    [int] IDENTITY(1,1) NOT NULL,
[id_clase]      [int],
[id_conquist]   [int],
[asistencia]    [nvarchar] (15),
[cuota]         [nvarchar] (20),
[tareas]        [nvarchar] (20),
[uniforme]      [nvarchar] (20),
[pulcritud]     [nvarchar] (20),
[Fecha_reu]     [date]
)

Create Table Actividades
(
[id_act]  [int] NOT NULL,
[nombre]  [nvarchar] (40),
[desc]    [nvarchar] (75)

)

Create Table Especialidad
(
[id_espe]   [int] NOT NULL,
[nombre]    [nvarchar] (40),
[desc]      [nvarchar] (75)


)

Create Table Clase_Act
(
[id_clase]     [int],
[id_conquist]  [int],
[id_act]       [int],
[fecha_reali]  [date]


)


Create Table Especialidad_Act
(
[id_espe]      [int],
[id_clase]     [int],
[id_conquist]  [int],
[id_act]       [int],
[fecha_reali]  [date]

)
