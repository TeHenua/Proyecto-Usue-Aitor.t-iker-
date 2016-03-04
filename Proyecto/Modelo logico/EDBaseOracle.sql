DROP TABLE trabajador CASCADE CONSTRAINTS ;

DROP TABLE centro CASCADE CONSTRAINTS ;

DROP TABLE usuario CASCADE CONSTRAINTS ;

DROP TABLE parte CASCADE CONSTRAINTS ;

DROP TABLE viaje CASCADE CONSTRAINTS;

CREATE TABLE centro
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
  
CREATE TABLE usuario
  (
    usuario     VARCHAR2 (20) CONSTRAINT usu_us_pk PRIMARY KEY ,
    contrasenia    VARCHAR2 (20) NOT NULL,
  ) ;

CREATE TABLE trabajador
  (
    dni         VARCHAR2 (9) CONSTRAINT trab_dni_pk PRIMARY KEY ,
    nombre      VARCHAR2 (20) CONSTRAINT NNC_trab_nombre NOT NULL ,
    apellidos   VARCHAR2 (30) CONSTRAINT NNC_trab_apellidos NOT NULL,
    calle       VARCHAR2 (20) NOT NULL,
    portal      NUMBER (2) NOT NULL,
    piso        NUMBER (2) NOT NULL,
    mano        VARCHAR2 (4) NOT NULL,
    telEmpresa    VARCHAR2 (9) NOT NULL,
    telPersonal VARCHAR2 (9) ,
    fechaNac    DATE ,
    salario     NUMBER (5) ,
    idCentro       NUMBER (2) CONSTRAINT NNC_trab_centro_id NOT NULL ,
    usuarioUsuario VARCHAR2(20) CONSTRAINT NNC_trab_usuarioUsuario NOT NULL ,
    tipoTrabajador VARCHAR2 (1) NOT NULL,
    CONSTRAINT trab_centro_fk FOREIGN KEY ( idCentro ) REFERENCES centro ( id )
    CONSTRAINT trab_usuario_fk FOREIGN KEY ( usuarioUsuario ) REFERENCES usuario ( usuario )
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
    abierto      BOOLEAN ,
    validado     BOOLEAN ,
    mValidado    BOOLEAN ,
    fecha        DATE ,
    gasoil       NUMBER (7) ,
    autopista    NUMBER (6) ,
    dieta        NUMBER (7) ,
    otro         VARCHAR2 (1000) ,
    incidencia   VARCHAR2 (1000)
    CONSTRAINT parte_trabajador_fk FOREIGN KEY ( idTrabajador ) REFERENCES trabajador ( id )
  ) ;

CREATE TABLE Viaje
  (
    id VARCHAR2 (10) PRIMARY KEY,
    hSalida   DATE NOT NULL ,
    hLlegada  DATE NOT NULL ,
    matricula VARCHAR2 (8) NOT NULL ,
    idParte  NUMBER NOT NULL
    CONSTRAINT viaje_parte_fk FOREIGN KEY ( idParte ) REFERENCES parte ( id )
  ) ;