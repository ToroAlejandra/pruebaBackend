create database if not exists pruebaDirektio;
use pruebaDirektio;
create table if not exists Usuarios(
	id int not null,
    name varchar(120) not null,
    lastname varchar(120) not null,
    phone varchar(30) not null,
    status boolean default true,
    primary key (id)
);
    
create table if not exists Habilidades(
	id int not null,
    name varchar(120) not null,
    description text(120) not null,
    status boolean default true,
    user_id int not null,
    foreign key(user_id) references Usuarios(id),
    primary key(id)
);

create table if not exists Niveles(
	id int not null,
    type varchar(120) not null,
    status boolean default true,
    primary key(id)
);


create table if not exists Habilidades_niveles(
	id int not null,
    habilidad_id int not null,
    nivel_id int not null,
    foreign key(habilidad_id) references Habilidades(id),
    foreign key(nivel_id) references Niveles(id),
    primary key(id)
);

insert into Usuarios (id, name, lastname, phone, status)
values 
	(1, 'Juana', 'Velez', '3215148852', true), 
	(2, 'Carlos', 'Sanchez', '3100258741', false),
    (3, 'Arturo', 'Arias', '3002586957', true),
    (4, 'Gabriela', 'Huertas', '3018529423', false),
    (5, 'Jenny', 'Torres', '3201596742', true),
    (6, 'Lina', 'Ospina', '3211593574', false),
    (7, 'Laura', 'Rodriguez', '3192586201', true),
    (8, 'Cristina', 'Mebarak', '3026523987', false),
    (9, 'Santiago', 'Arroyave', '3206974156', true),
    (10,'Isaac', 'Linero', '3159620147', false),
    (11, 'Mariana', 'Toro', '3216549870', true);

insert into Habilidades (id, name, description, status, user_id) values
	(1, 'Liderazgo', 'permite influir, motivar y organizar a una persona o grupo de personas, con el fin de alcanzar determinados objetivos.',true, 1),
    (2, 'Proactividad', 'se trata de actuar de manera anticipada ante situaciones que requieren nuevas formas de hacer las cosas.',true, 2),
    (3, 'Trabajo en equipo', 'la habilidad para trabajar con otras personas con el fin de alcanzar objetivos en común.',true, 3),
    (4, 'Resiliencia', 'se trata de la capacidad para superar situaciones o circunstancias traumáticas.',true, 4),
    (5, 'Empatía', 'la habilidad para comprender las emociones de las otras personas.',true, 5),
    (6, 'Actitud positiva', 'asumir con una mentalidad diferente, los desafíos del día a día.',true, 6),
    (7, 'Inteligencia emocional', 'la habilidad de controlar las emociones propias y entender cómo nos influyen.',true, 7),
    (8, 'Capacidad de recibir y dar feedback', 'retroalimentar a otros y recibir la retroalimentación de otras personas de forma asertiva.',false, 8),
    (9, 'Solución de problemas y conflictos', 'resolver problemas sin generar hostilidades.',true, 9),
    (10, 'Habilidades lingüísticas','todo el conjunto de competencias para hablar, leer, escribir y escuchar.',true,10),
    (11, 'Expresión oral','la habilidad de dominar las técnicas para comunicarse efectivamente.',true,1),
    (12, 'Pensamiento matemático','se refiere al razonamiento y comprensión de las nociones numéricas.',true,2),
    (13, 'Manejo de recursos tecnológicos:','la habilidad para manejar computadores, software y demás herramientas digitales.',true,10),
    (14, 'Gestión de equipos','necesaria para aquellas personas que desean liderar equipos',true,3),
    (15, 'Gestión de proyectos','habilidad necesaria para lograr coordinar proyectos y llevarlos',false,4);


insert into Niveles (id, type, status) values
(1, 'new', true),
(2, 'beginner', true),
(3, 'intermediate', true),
(4, 'advance', true),
(5, 'advance pluss', false);

insert into Habilidades_niveles (id, habilidad_id, nivel_id) values
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,1),
(7,7,2),
(8,8,3),
(9,9,4),
(10,10,5),(11,11,1),(12,12,2),(13,13,3),(14,14,4),(15,15,5);

select Usuarios.*, group_concat(Habilidades.name) 
from Usuarios 
inner join Habilidades on Usuarios.id = Habilidades.user_id 
group by Usuarios.id;

select * from Usuarios where name like '%ana%';

##Yo pienso que la tabla habilidades_niveles existe para medir el dominio de cierta habilidad por usuario
# Un usuario puede tener muchas habilidades, sin embargo una habilidad solo puede pertenecer a un usuario
#
