Use Club_Conquistadores

ALTER TABLE Club
ADD CONSTRAINT PK_CLUB PRIMARY KEY(id_club)
go
ALTER TABLE Directivos
ADD CONSTRAINT PK_DIRECTIVO PRIMARY KEY(id_direct)
go
ALTER TABLE Conquistadores
ADD CONSTRAINT PK_CONQUISTADOR PRIMARY KEY(id_conquist)
go
ALTER TABLE Padre
ADD CONSTRAINT PK_PADRE PRIMARY KEY(id_padre)
go
ALTER TABLE Reunion
ADD CONSTRAINT PK_REUNION PRIMARY KEY(id_reunion)
go
ALTER TABLE Unidad
ADD CONSTRAINT PK_UNIDAD PRIMARY KEY(id_unidad)
go
ALTER TABLE Clase
ADD CONSTRAINT PK_CLASE PRIMARY KEY(id_clase)
go
ALTER TABLE Instructor
ADD CONSTRAINT PK_INSTRUCTOR PRIMARY KEY(id_instructor)
go
ALTER TABLE Actividades
ADD CONSTRAINT PK_ACTIVIDADES PRIMARY KEY(id_act)
go
ALTER TABLE Especialidad
ADD CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY(id_espe)
go
------Creacion foreign keys------------
alter table Directivos
add constraint FK_IDCLUB_DIRECTIVOS FOREIGN KEY ( id_club ) references Club(id_club)
go
alter table Conquistadores
add constraint FK_IDCLUB_CONQUISTADORES FOREIGN KEY ( id_club ) references Club(id_club)
go
alter table Conquistadores
add constraint FK_UNIDAD_CONQUISTADORES FOREIGN KEY ( id_unidad ) references Unidad(id_unidad)
go
alter table Conquistadores
add constraint FK_PADRE_CONQUISTADORES FOREIGN KEY ( id_padre ) references Padre(id_padre)
go
alter table Conquistadores
add constraint FK_CLASE_CONQUISTADORES FOREIGN KEY ( id_clase ) references Clase(id_clase)
go
alter table Instructor
add constraint FK_IDCLASE_INSTRUCTOR FOREIGN KEY ( id_clase ) references Clase(id_clase)
go
alter table Reunion
add constraint FK_IDCLASE_REUNION FOREIGN KEY ( id_clase ) references Clase(id_clase)
go
alter table Reunion
add constraint FK_IDCONQUIST_REUNION FOREIGN KEY ( id_conquist ) references Conquistadores(id_conquist)
go
alter table Clase_Act
add constraint FK_IDCLASE_CLASEACT FOREIGN KEY ( id_clase ) references Clase(id_clase)
go
alter table Clase_Act
add constraint FK_IDCONQUIST_CLASEACT FOREIGN KEY ( id_conquist ) references Conquistadores(id_conquist)
go
alter table Clase_Act
add constraint FK_IDACT_CLASEACT FOREIGN KEY ( id_act ) references Actividades(id_act)
go
alter table Especialidad_Act
add constraint FK_IDESPE_ESPECIALIDADACT FOREIGN KEY ( id_espe ) references Especialidad(id_espe)
go
alter table Especialidad_Act
add constraint FK_IDCLASE_ESPECIALIDADACT FOREIGN KEY ( id_clase ) references Clase(id_clase)
go
alter table Especialidad_Act
add constraint FK_IDCONQUIST_ESPECILIDADACT FOREIGN KEY ( id_conquist ) references Conquistadores(id_conquist)
go
alter table Especialidad_Act
add constraint FK_IDACT_ESPECIALIDADACT FOREIGN KEY ( id_act ) references Actividades(id_act)
go
alter table Unidad
add constraint FK_UNIDAD_CLUB FOREIGN KEY (id_club) references Club(id_club)
