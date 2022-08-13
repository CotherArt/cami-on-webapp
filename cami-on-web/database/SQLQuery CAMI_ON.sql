 create database CAMI_ON
 use CAMI_ON

create table Horario(
	id_horario int identity (1,1) primary key,
	hora_inicio time not null,--tipo de dato cambiado
	hora_final time not null,--tipo de dato cambiado
);

create table Paradas(
	id_parada int identity(1,1) primary key
);

create table Precio(
	id_precio int identity (1,1) primary key,
	precio_regular decimal not null, --tipo de dato cambiado
	precio_estudiantes decimal not null, --tipo de dato cambiado
	precio_regularalt decimal, --tipo de dato cambiado
	precio_estudiantesalt decimal, --tipo de dato cambiado
	hora_alt time, --tipo de dato cambiado --Hora a partir de la cual se usan los precios alternativos
);

create table Lugar_referencia(
	id_lugar int identity (1,1) primary key,
	nombre_lugar varchar (30) not null,
	calle varchar (30),
	numero varchar (5),
	colonia varchar (30),
	cp varchar (5),
	ciudad varchar (10),
);

create table Central( --Tabla añadida
	id_central int identity(1,1) primary key,
	nombre varchar(200),
	calle varchar (30),
	numero varchar (5),
	colonia varchar (30),
	cp varchar (5),
	ciudad varchar (10),
);

create table Ruta(
	id_ruta int identity (1,1) primary key,
	id_precio int,
	id_central int, --campo de "central" remplazado
	descricpion varchar (200),
	nombre_ruta varchar (30),
	CONSTRAINT fk_precio FOREIGN KEY(id_precio) REFERENCES Precio (id_precio),
	CONSTRAINT fk_central FOREIGN KEY(id_central) REFERENCES Central (id_central) --foreign key añadida
);

create table Ruta_horario(
	id_ruta_horario int identity (1,1) primary key,
	id_horario int,
	id_ruta int,
	CONSTRAINT fk_horario FOREIGN KEY(id_horario) REFERENCES Horario (id_horario),
	CONSTRAINT fk_ruta1 FOREIGN KEY(id_ruta) REFERENCES Ruta (id_ruta)
);

create table Ruta_lugar_referencia(
	id_ruta_ref int identity(1,1) primary key,
	id_ruta int,
	id_lugar int,
	CONSTRAINT fk_ruta3 FOREIGN KEY(id_ruta) REFERENCES Ruta (id_ruta),
	CONSTRAINT fk_lugar FOREIGN KEY(id_lugar) REFERENCES Lugar_referencia (id_lugar)
);

create table Ruta_parada(
	id_ruta_parada int identity(1,1) primary key,
	id_parada int,
	id_ruta int,
	CONSTRAINT fk_parada FOREIGN KEY(id_parada) REFERENCES Paradas (id_parada),
	CONSTRAINT fk_ruta2 FOREIGN KEY(id_ruta) REFERENCES Ruta (id_ruta)
);

create table Vehiculo(
	id_vehículo int identity(1,1) primary key,
	id_ruta int,
	matricula varchar (12) not null,
	modelo varchar (15) not null,
	color varchar (20),
	serie varchar (10) not null,
	CONSTRAINT fk_ruta4 FOREIGN KEY(id_ruta) REFERENCES Ruta (id_ruta)
);

