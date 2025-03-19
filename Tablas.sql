drop table pacientes;
drop table doctores;
drop table enfermedades;
drop table doctores;
drop table consultas;

use basededatos;

create table pacientes 
(
id_paciente int primary key auto_increment, 
nombre varchar (100) not null,
telefono varchar (15) not null,
email varchar (100) not null
);
create table doctores 
(
id_doctor int primary key auto_increment, 
nombre varchar (100) not null,
especialidad varchar (100) not null
);

create table enfermedades 
(
id_enfermedad int primary key auto_increment, 
nombre varchar (100) not null,
peligro varchar (100) not null,
id_paciente int(20),
foreign key (id_paciente) references pacientes (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);

create table consultas 
(
id_consulta int primary key auto_increment, 
fecha date  not null,
motivo text (300) not null,
id_enfermedad int(20),
id_doctor int(20),
foreign key (id_doctor) references doctores (id_doctor),
foreign key (id_enfermedad) references enfermedades (id_enfermedad) ON DELETE CASCADE ON UPDATE CASCADE
);

create table tratamientos 
(
id_tratamiento int primary key auto_increment, 
descripcion text (300)  not null,
costo DECIMAL (10,2) not null,
id_consulta int(20),
foreign key (id_consulta) references consultas (id_consulta) ON DELETE CASCADE ON UPDATE CASCADE
);
