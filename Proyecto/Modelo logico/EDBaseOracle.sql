DROP TABLE centro_ CASCADE CONSTRAINTS ;

DROP TABLE usuarios CASCADE CONSTRAINTS ;

DROP TABLE parte CASCADE CONSTRAINTS ;

DROP TABLE viaje CASCADE CONSTRAINTS;

DROP TABLE administracion CASCADE CONSTRAINTS;

DROP TABLE logistica CASCADE CONSTRAINTS;

DROP TABLE administra CASCADE CONSTRAINTS;

CREATE TABLE centro_
  (
    id        NUMBER (2)
      GENERATED ALWAYS AS IDENTITY 
                        MINVALUE 1 
                        MAXVALUE 99
                        INCREMENT BY 1 
                        START WITH 1  
                        NOORDER  
                        NOCYCLE  NOT NULL ENABLE
      CONSTRAINT centro_id_pk PRIMARY KEY ,
    nombre    VARCHAR2 (30) NOT NULL ,
    calle     VARCHAR2 (30) NOT NULL,
    numero    NUMBER (2) NOT NULL,
    cPostal        VARCHAR2 (5) NOT NULL,
    ciudad    VARCHAR2 (15) NOT NULL,
    provincia VARCHAR2 (40) NOT NULL,
    telefono  VARCHAR2 (9) NOT NULL
  ) ;
  
CREATE TABLE usuarios
  (
    usuario     VARCHAR2 (20) CONSTRAINT usu_us_pk PRIMARY KEY ,
    contrasenia    VARCHAR2 (20) NOT NULL
  ) ;
    
CREATE TABLE logistica
  (
    dni         VARCHAR2 (9) CONSTRAINT log_dni_pk PRIMARY KEY ,
    nombre      VARCHAR2 (20) CONSTRAINT NNC_log_nombre NOT NULL ,
    apellidos   VARCHAR2 (30) CONSTRAINT NNC_log_apellidos NOT NULL,
    calle       VARCHAR2 (20) NOT NULL,
    portal      NUMBER (2) NOT NULL,
    piso        NUMBER (2) NOT NULL,
    mano        VARCHAR2 (4) NOT NULL,
    telEmpresa  VARCHAR2 (9) NOT NULL,
    telPersonal VARCHAR2 (9),
    fechaNac    DATE ,
    salario     NUMBER (5) ,
    idCentro       NUMBER (2) CONSTRAINT NNC_log_centro_id NOT NULL ,
    usuarioUsuarios VARCHAR2(20) CONSTRAINT NNC_log_usuarioUsuario NOT NULL ,
    CONSTRAINT log_centro_fk FOREIGN KEY ( idCentro ) REFERENCES centro_ ( id ),
    CONSTRAINT log_usuario_fk FOREIGN KEY ( usuarioUsuarios ) REFERENCES usuarios ( usuario )
  ) ;
  
CREATE TABLE parte
  (
    id            NUMBER (2)
      GENERATED ALWAYS AS IDENTITY 
                        MINVALUE 1 
                        MAXVALUE 99
                        INCREMENT BY 1 
                        START WITH 1  
                        NOORDER  
                        NOCYCLE  NOT NULL ENABLE
      CONSTRAINT parte_id_pk PRIMARY KEY ,
    kmPrincipio  NUMBER (10) ,
    kmLlegada    NUMBER (10) ,
    abierto      VARCHAR2(1) ,
    validado     VARCHAR2(1) ,
    mValidado    VARCHAR2(1) ,
    fecha        DATE ,
    gasoil       NUMBER (7) ,
    autopista    NUMBER (6) ,
    dieta        NUMBER (7) ,
    otro         VARCHAR2 (1000) ,
    incidencia   VARCHAR2 (1000),
    dniAdministracion VARCHAR2(9),
    dniLogistica VARCHAR2(9),
    CONSTRAINT parte_logistica_fk FOREIGN KEY ( dniLogistica ) REFERENCES logistica ( dni )
  ) ;
  
CREATE TABLE administracion
  (
    dni         VARCHAR2 (9) CONSTRAINT adm_dni_pk PRIMARY KEY ,
    nombre      VARCHAR2 (20) CONSTRAINT NNC_adm_nombre NOT NULL ,
    apellidos   VARCHAR2 (30) CONSTRAINT NNC_adm_apellidos NOT NULL,
    calle       VARCHAR2 (20) NOT NULL,
    portal      NUMBER (2) NOT NULL,
    piso        NUMBER (2) NOT NULL,
    mano        VARCHAR2 (4) NOT NULL,
    telEmpresa    VARCHAR2 (9) NOT NULL,
    telPersonal VARCHAR2 (9),
    fechaNac    DATE,
    salario     NUMBER (5),
    idCentro       NUMBER (2) CONSTRAINT NNC_adm_centro_id NOT NULL ,
    usuarioUsuarios VARCHAR2(20) CONSTRAINT NNC_adm_usuarioUsuario NOT NULL ,
    idParte NUMBER(2),
    CONSTRAINT adm_centro_fk FOREIGN KEY ( idCentro ) REFERENCES centro_ ( id ),
    CONSTRAINT adm_usuario_fk FOREIGN KEY ( usuarioUsuarios ) REFERENCES usuarios ( usuario ),
    CONSTRAINT adm_parte_fk FOREIGN KEY ( idParte ) REFERENCES parte ( id )
  ) ;

CREATE TABLE administra
  (
    iddni    VARCHAR2(9),
    idparte  NUMBER(2),
    
    CONSTRAINT ad_administracion_parte_pk PRIMARY KEY (iddni,idparte),
    CONSTRAINT ad_administracion_fk FOREIGN KEY ( iddni ) REFERENCES administracion ( dni ),
    CONSTRAINT ad_parte_fk FOREIGN KEY ( idparte ) REFERENCES parte ( id )
  ) ;

CREATE TABLE Viaje
  (
    id VARCHAR2 (10) PRIMARY KEY,
    hSalida   DATE NOT NULL ,
    hLlegada  DATE NOT NULL ,
    matricula VARCHAR2 (8) NOT NULL ,
    idParte  NUMBER NOT NULL,
    CONSTRAINT viaje_parte_fk FOREIGN KEY ( idParte ) REFERENCES parte ( id )
  ) ;