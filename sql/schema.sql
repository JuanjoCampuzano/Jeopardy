create schema Jeopardy;
use Jeopardy;

create table Usuario (
	id mediumint not null auto_increment,
	username varchar(100) not null,
	password varchar(100) not null,
	failed tinyint not null default 0 check (difficulty in (0, 1, 2, 3)),
	password_changed bool not null default false,
	primary key(id)
);

create table Clase (
	id mediumint not null auto_increment,
	nombre varchar(100) not null,
	primary key(id)
);

create table Tema (
	id mediumint not null auto_increment,
	id_clase mediumint not null,
	nombre varchar(100) not null,
	primary key(id),
	foreign key(id_clase) references Clase(id)
);

create table Pista (
	id mediumint not null auto_increment,
	pregunta varchar(200) not null,
	respuesta varchar(200) not null,
	difficulty tinyint not null check (difficulty in (0, 1, 2, 3, 4)),
	id_tema mediumint not null,
	primary key(id),
	foreign key(id_tema) references Tema(id)
);

create table Perfil (
	id mediumint not null auto_increment,
	id_usuario mediumint not null,
	id_clase mediumint not null,
	primary key(id),
	foreign key(id_usuario) references Usuario(id),
	foreign key(id_clase) references Clase(id)
);

create table Pistas_Perfiles (
	id_Perfil mediumint not null,
	id_Pista mediumint not null,
	primary key(id_Perfil, id_Pista),
	foreign key(id_Perfil) references Perfil(id),
	foreign key(id_pista) references Pista(id)
);

create table Juego (
	id mediumint not null auto_increment,
	fecha timestamp default current_timestamp,
	id_perfil mediumint not null,
	primary key(id),
	foreign key(id_perfil) references Perfil(id)
);

create table Alumno (
	id mediumint not null auto_increment,
	nombre varchar(100) not null,
	primary key(id)
);

create table Resultados (
	id_juego mediumint not null,
	id_alumno mediumint not null,
	points mediumint not null,
	primary key(id_juego, id_alumno),
	foreign key(id_juego) references Juego(id),
	foreign key(id_alumno) references Alumno(id)
);



