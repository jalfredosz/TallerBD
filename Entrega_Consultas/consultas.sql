Use Club_Conquistadores
select * from Club
----Triviales---------
--1. Mostrar todos los clubes existentes---
Select nom_club as [Nombre de club] from Club
--2.Mostrar los diferentes lemas de los clubs de conquistadores existentes, y a cual pertenece  
Select lema as [Lema del club] , nom_club as [Nombre del club] from Club

--3. Mostrar todos los clubs existentes en la ciudad de culiacan a la vez que su direccion ---
Select nom_club as [Nombre de club], direccion as [Direccion de club] from Club where City='Culiacán'
--4. Mostrar el nombre de las ciudades cede de clubes de conquistadores sin repetir filas-
Select distinct City as [Ciudad Sede] from Club
--5. Mostrar el nombre completo y puesto de los directivos pertenecientes al club alfa y omega con el id 1
Select nombre as [Nombre completo], puesto as [Puesto Directivo] from Directivos where id_club=1
--6.Mostrar el nombre y edad de los conquistadores registrados y pertenecientes a una unidad
Select Nom_Conquist as [Nombre de conquistador] from Conquistadores where id_unidad IS NOT NULL;
--7.Mostrar a todos los conquistadores,junto a su edad, en orden de esta misma
Select Nom_Conquist as [Nombre de conquistador],edad as [Edad de conquistador] from Conquistadores Order By edad DESC
--8 Mostrar la edad,estatura y peso promedio entre los conquistadores registrados del club alfa y omega
Select AVG(edad) as [Edad promedio],AVG(estatura) as [Estatura promedio],AVG(peso) as [Peso promedio] from Conquistadores where id_club=1
--9.Mostrar a los conquistadores nacidos en los años 2004 y 2005
Select Nom_Conquist as [Nombre conquistador] from Conquistadores where Year(fecha_nac) =2004 or Year(fecha_nac)=2005
--10.Listar el nombre y lema de unidades existentes en el club alfa y omega
Select nombre as [Nombre de la unidad] , lema as [Lema de unidad] from Unidad where id_club=1
--11 Mostrar el nombre y telefono de todos los padres registrados
Select nombre as [Nombre de padre/tutor] , telefono as [Numero de contacto] from Padre ORDER BY nombre
--12 Mostrar nombre de los padres cuyo nombre comience con M
Select nombre as [Nombre de padre/tutor] from Padre where nombre like 'M%';
--13 Mostrar el nombre y telefono de los padres o tutores de algun conquistador, cuya ocupacion sea maestr@
select nombre as [Nombre de padre/tutor], telefono as [Numero de contacto] from Padre Where ocupacion IN('Maestra','Maestro')
--14 Mostrar las primeras 3 clases disponibles para los conquistadores
Select top 3 * from Clase 
--15 Mostrar las clases del club de conquistadores cuyos colores sean Azul, Verde y tinto respectivamente
Select nombre as [Nombre de clase], color as [Color representativo] from Clase where color IN('Azul','Verde','Tinto')
--16.Mostrar las primeras 10 asistencias de la tabla reuniones
Select top 10 * from Reunion
--17. Mostras las ultimas 10 asistencias de la tabla reuniones
Select top 10 * from Reunion ORDER BY id_reunion DESC
--18. Mostrar el estatus de asistencia del conquistador con el id 20010 en la fecha de 2018-10-26
Select asistencia , cuota, tareas,uniforme,pulcritud from Reunion where Fecha_reu='2018-10-26' and id_conquist=20010
--19.Mostrar el nombre y descripcion de todas las especialidades disponibles para los conquistadores
Select nombre as [Nombre de especialidad] , [desc] as [Descripcion de especialidad] from Especialidad Order by nombre
--20 Mostrar todas aquellas especialidades relacionadas con artes o salud
Select nombre as [Nombre de especialidad], [desc] as [Descripcion de especialidad] from Especialidad where [desc] like '%Artes%' or [desc] like '%Salud%';



------NO TAN TRIVIALES------------------------
--21.Seleccionar los dos directivos con cargo mas alto del club de conquistadores alfa y omega
Select top 2 nombre as [Nombre directivo] , puesto as [Cargo Actual]
from Directivos
inner join Club 
on Directivos.id_club=Club.id_club
--22.Mostrar el nombre de los directivos, su direccion, asi como el nombre del club donde laboran y su direccion .
Select d.nombre as [Nombre de directivo] ,d.direccion as [Direccion de directivo],c.nom_club as [Nombre del club] , c.direccion as [Direccion del club]
from Directivos d
inner join Club c
on d.id_club=c.id_club
--23 Mostrar los directivos que tiene cada club, mostrar el nombre del club aun si no tiene directivos registrados
Select c.nom_club as [Nombre del club], Count(d.id_direct)
from Club c
left join Directivos d
on c.id_club=d.id_club
group by c.nom_club,c.id_club
Order by c.id_club
--24 Mostrar cuantos clubs se encuentran en una misma ciudad 
Select Distinct City as [Ciudad sede],count(*) as [Clubs Existentes]
from Club
group by City
--25 Seleccionar la ciudad con el mayor numero de clubes 
Select top 1 Count(*) as [Clubs Existentes] , City as [Ciudad]
from Club
group by City
--26 Seleccionar la o las ciudades con menor numero de clubs
Select top 3 Count(*) as [Clubs Existentes], City as [Ciudad]
from Club
GROUP BY City 
order by Count(*) ASC
--NOTA: Estas ultimas 3 las planeaba hacer usando max y min despues de la consulta count y subconsultas, pero no pude encontrar la forma--
--27 Numero de conquistadores por club indistintamente de que este pueda o no tener miembros registrados
Select c.nom_club as [Nombre del club] , count(cq.id_conquist) as [Conquistadores registrados]
from Club c
left join Conquistadores cq
on c.id_club=cq.id_club
group by c.nom_club
--28 Nombre de los conquistadores registrados el club al que pertenecen, y de este ultimo su nombre, direccion y ciudad.
Select cq.Nom_Conquist as [Nombre de conquistador] , c.nom_club as [Nombre de club perteneciente] , c.direccion as [Direccion de club] , c.City
from Conquistadores cq
inner join Club c
on cq.id_club=c.id_club
--29 Obtener la edad maxima entre los conquistadores , y listar el nombre y id de ese conquistador, si varios tuvieran la misma edad, listarlos a todos
Select Nom_Conquist [Nombre del conquistador] , edad as [Edad de conquistador]
from Conquistadores
where edad=(Select Max(edad)
from Conquistadores)
Order By Nom_Conquist
--30 Seleccionar a los conquistadores, junto con su edad y peso, nacidos despues del 2006, cuyo dicho peso este arriba del promedio
Select Nom_Conquist as [Nombre del conquistador] , edad as [Edad de conquistador] ,peso as [Peso de conquistador]
from Conquistadores
where peso>
(Select avg(peso)
from Conquistadores
where fecha_nac>'2006-01-01')
--31 Seleccionar a todos los compañeros de unidad del conquistador con id 20001 asi como el nombre de su unidad
Select c.Nom_Conquist as [Nombre de conquistador] , c.id_unidad as [ID de su unidad perteneciente],u.nombre as [Nombre de la unidad]
from Conquistadores c
inner join Unidad u
on c.id_unidad=u.id_unidad
where c.id_unidad=(Select id_unidad
from Conquistadores
where id_conquist=20001) and id_conquist<>20001
--32 Seleccionar a todos los conquistadores registrados y identificar el nombre , lema y id de sus unidades
Select c.Nom_Conquist as [Nombre del conquistador],u.id_unidad as [ID de unidad],u.nombre as [Nombre de la unidad],u.lema as [Lema de unidad]
from Conquistadores c
inner join Unidad u
on c.id_unidad=u.id_unidad
--33 Mostrar las unidades existentes del club alfa y omega, asi como el numero de conquistadores que tiene cada una
Select u.nombre as [Nombre de la unidad] , count(cq.id_conquist) as [Numero de integrantes]
from Club c
inner join Unidad u
on c.id_club=u.id_club
inner join Conquistadores cq
on cq.id_unidad=u.id_unidad
group by u.nombre

--34 Por medio de sub consulta, mostrar todos los conquistadores cuyos padres sean maetros 

Select Nom_Conquist as [Nombre del conquistador] , id_padre as [ID del padre o tutor]
from Conquistadores
where id_padre in
(Select id_padre
from Padre
where ocupacion in ('Maestra','Maestro'))

--35 Con uso de inner join mostrar la informacion de los conquistadores , su id, a la vez que el nombre y telefono de su padre o tutor
Select c.Nom_Conquist as [Nombre del conquistador] ,c.id_conquist as [ID del conquistador] , p.nombre as [Nombre de padre o tutor],p.telefono as [Numero de contacto]
from Conquistadores c
inner join Padre p
on c.id_padre=p.id_padre
--36 Seleccionar a los conquistadores, el nombre y contacto de sus padres, de todos aquellos pertenecientes a la clase "Amigo"
Select c.Nom_Conquist as [Nombre del conquistador] ,c.id_conquist as [ID del conquistador] , p.nombre as [Nombre de padre o tutor],p.telefono as [Numero de contacto]
from Conquistadores c
inner join Padre p
on c.id_padre=p.id_padre
where 
id_clase=(Select id_clase from Clase where nombre='Amigo')
--37 mostrar el numero de conquistadores actuales en cada clase del club
Select c.nombre as [Nombre de clase] , count(cq.id_conquist) as [Conquistadores cursando]
from Conquistadores cq
right join Clase c
on cq.id_clase=c.id_clase
group by c.nombre
--38 Seleccionar todos los conquistadores y el nombre de su clase, de aquellos cuya fecha de nacimiento sea cualquier dia entre 2004-2006 de sexo masculino
Select cq.Nom_Conquist as [Nombre del conquistador] , c.nombre as [Nombre de su clase]
from Conquistadores cq
inner join Clase c
on cq.id_clase=c.id_clase
where cq.id_conquist in (Select id_conquist from Conquistadores where fecha_nac between '2004-01-01' and '2006-12-31' and sexo='Masculino') 
--39 Seleccionar el nombre de la clase , asi como la informacion de su instructor actual , indiferentemente si tiene uno asignado o no
Select c.nombre as [Nombre de clase],i.nombre as [Nombre de instructor actual]
from Clase c
left join Instructor i
on c.id_clase=i.id_clase

--40 Mostrar cuantos conquistadores asistieron a la reunion de la clase 1001 de la fecha 05/10/2018
Select count(id_conquist) as [Numero de participantes] from Reunion where Fecha_reu='2018-10-05' group by id_clase
--41 Seleccionar a todos aquellos conquistadores, su nombre, nombre de clase, que hayan asistido a mas de 5 reuniones 
Select cq.Nom_Conquist as [Nombre de conquistador],c.nombre as [Nombre de clase], count(r.id_conquist)
from Reunion r
inner join Clase c
on r.id_clase=c.id_clase
inner join Conquistadores cq
on r.id_conquist=cq.id_conquist
group by cq.Nom_Conquist,c.nombre
having count(r.id_conquist) >5
--42 Mostrar el numero de reuniones que se han realizado en la clase amigo este mes
Select  count(DISTINCT Fecha_reu) as [Numero de reuniones realizadas]
from Reunion r
inner join Clase c
on r.id_clase=c.id_clase
where Fecha_reu >='2018-10-01' AND Fecha_reu <'2018-10-23' 
--43 Listar el nombre de todas las actividades necesarias de cumplir en la clase amigo
Select distinct ca.id_act as [ID de actividad], ac.[desc] as [Descripcion de actividad]
from Clase_Act ca
inner join Clase c
on ca.id_clase=c.id_clase
inner join Actividades ac 
on ca.id_act=ac.id_act
--44 Mostrar el id de los conquistadores que han realizado las actividades de clase con id entre 10001-10004 asi como su fecha de realizacion
Select id_conquist as [Id de conquistador], id_act as [ID de actividad], fecha_reali as [Fecha de realizacion]
from Clase_Act
where id_act in (Select id_act from Actividades where id_act between '10001' and '10004');
--45 Seleccionar el id de los conquistadores y la actividad de clase que han realizado entre el 2018-10-01 y el 2018-10-10, incluir fecha
Select ca.id_conquist as [Id de conquistador] , a.[desc] as [Descripcion de actividad],ca.fecha_reali as [Fecha de realizacion]
from Clase_Act ca
inner join Actividades a
on ca.id_act=a.id_act
where fecha_reali between '2018-10-01' and '2018-10-10';
--46 Obtener el promedio de actividades de clase realizadas por dia en el mes de octubre
Select top 1 avg(cuenta) as [Promedio diario]
from Clase_Act tb1
inner join
(select count(id_act) as cuenta ,id_act from Clase_Act where fecha_reali between '2018-10-01' and '2018-10-31' group by id_act) tb2 on tb1.id_act=tb2.id_Act
group by fecha_reali
--47 Listar a cada conquistador y el numero de actividades de clase completadas
Select cq.Nom_Conquist as [Nombre del conquistador], count(ca.id_act) as [Actividades de clase completadas]
from Clase_Act ca
inner join Conquistadores cq
on ca.id_conquist=cq.id_conquist
group by cq.Nom_Conquist
--48 Mostrar todas las especialidades disponibles para la clase Amigo
Select distinct ca.id_act as [ID de actividad], ac.[desc] as [Descripcion de especialidad]
from Especialidad_Act ca
inner join Clase c
on ca.id_clase=c.id_clase
inner join Actividades ac 
on ca.id_act=ac.id_act
--49 Listar los ids y la fecha de realizacion de los conquistadores de la clase amigo que han completado el dibujo animal a mano
Select ea.id_conquist as [Id de conquistador], ea.fecha_reali as [Fecha de cumplimiento]
from Especialidad_Act ea
inner join Actividades a
on ea.id_act=a.id_act
where a.[desc] like 'Dibujo%' and ea.id_clase=1001

--50 Mostrar el total de actividades de clase y actividades de especialidad completadas por los conquistadores y su nombre
Select c.Nom_Conquist as [Nombre conquistador] , count(ca.id_conquist) as [Actividades de clase completadas],count(ea.id_conquist) as [Actividades de especialidad completadas]
from Conquistadores c
inner join Clase_Act ca
on c.id_conquist=ca.id_conquist
inner join Especialidad_Act ea
on c.id_conquist=ea.id_conquist
group by c.Nom_Conquist