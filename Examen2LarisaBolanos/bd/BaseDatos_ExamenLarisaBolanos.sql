
CREATE DATABASE EXAMEN
GO
USE EXAMEN
GO
 CREATE TABLE EQUIPOS
 (
 id int identity,
 tipoequipo varchar(50) NOT NULL,
 modelo varchar(50),
 idusuario int,
 CONSTRAINT pk_idequipo PRIMARY KEY(id)
 )
 GO

 CREATE TABLE USUARIO
 (
 id int identity,
 idequipo int,
 nombre varchar(50) NOT NULL,
 CorreoElectronico varchar(50),
 telefono int,
 CONSTRAINT pk_idusuario PRIMARY KEY(id),
 CONSTRAINT fk_idequipo FOREIGN KEY (idequipo) REFERENCES equipos(id)
 
  )
 GO

 CREATE TABLE REPARACIONES
 (
 id int identity,
 idequipo int,
fechasolicitud date CONSTRAINT df_fecha DEFAULT GETDATE(),
estado int,
 CONSTRAINT pk_reparaciones PRIMARY KEY(id),
 CONSTRAINT fk_idequipo FOREIGN KEY (idequipo) REFERENCES equipos(id)
 
  )
 GO

 CREATE TABLE TECNICOS
 (
 id int identity,
 idequipo int,
fechasolicitud date CONSTRAINT df_fecha DEFAULT GETDATE(),
estado int,
 CONSTRAINT pk_TECNICOS PRIMARY KEY(id),
 CONSTRAINT fk_idequipo FOREIGN KEY (idequipo) REFERENCES equipos(id)
 
  )
 GO

 CREATE TABLE ASIGNACION
 (
 id int identity,
 idequipo int,
Reparacionid varchar(50),
Tecnicoid VARCHAR,
fechasolicitud date CONSTRAINT df_fecha DEFAULT GETDATE(),
 CONSTRAINT pk_asignacion PRIMARY KEY(id),
 CONSTRAINT fk_idequipo FOREIGN KEY (idequipo) REFERENCES equipos(id)
 
  )
 GO

  CREATE TABLE DetallesReparacion
 (
 id int identity,
 idreparaciones int,
  idequipo int,
Reparacionid varchar,
Descripcion VARCHAR(50),
fechaInicio date CONSTRAINT df_fecha DEFAULT GETDATE(),
fechaFin date CONSTRAINT df_fecha DEFAULT GETDATE(),
 CONSTRAINT pk_DetallesReparacin PRIMARY KEY(id),
  CONSTRAINT fk_idequipo FOREIGN KEY (idequipo) REFERENCES equipos(id)
 )
 GO
 CREATE PROCEDURE CONSULTARFILTRO
 AS
 BEGIN
 SELECT * FROM USUARIO
 END
  
  CREATE PROCEDURE MODIFICAR
  @CODIGO INT
  AS
  EXEC BORRAREQUIPO
  EXEC CONSULTAREQUIPO
  EXEC CONSULTARTECNICO
  CREATE PROCEDURE BORRAREQUIPO
  @CODIGO INT
  AS
  BEGIN
  DELTE EQUIPO WHERE ID=@CODIGO
  END



