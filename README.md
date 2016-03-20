Esta aplicación está diseñada para gestionar una empresa de transportes y gestionar sus trabajadores, partes e informes.

//---------REQUISITOS---------------//


Son necesarias las siguientes aplicaciones/plugins:


- Sistema Gestor de Base de Datos:
	- Oracle DataBase 12c
	- Puedes seguir este tutorial para instalarlo en una máquina virtual: 
		https://vbatik.wordpress.com/2015/02/23/oracle-12-1-0-2-database-install-with-vagrant-on-centos-6-5-jellema-and-biemond/

- SQL Developer
	http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

- Un entorno de desarrollo Java (IDE)
	-Netbeans 
		https://netbeans.org/			

- Librería Oracle para Java
	- ojdbc6.jar
		http://www.oracle.com/technetwork/database/enterprise-edition/jdbc-112010-090769.html

- Plugin Netbeans jDateChooser
	http://plugins.netbeans.org/plugin/658/jdatechooser-1-2

OPCIONALES

- VisualParadigm 
	https://www.visual-paradigm.com/download/

- SQL Developer Data Modeler
	http://www.oracle.com/technetwork/developer-tools/datamodeler/downloads/datamodeler-087275.html
	

//---------ESTRUCTURA---------------//

Al descomprimir el archivo con extensión .zip se encuentran los siguientes archivos:

	- Diagrama_clases

		Contiene una imágen de la representación de clases de la aplicación y un diagrama.
		Para editar el diagrama es necesaria la instalación de Visual Paradigm.

		- DiagramaClasesProyecto.jpg
		- Proyecto_DiagramaDeClases.vpp 


	- MER_relacional

		Contiene un fichero con los modelos de la base de datos y dos imágenes.
		Para editar los modelos es necesaria la instalación de SQL Developer Data Modeler.

		- MER.png
		- Relational.png
		- MER_relacional.dmd

	- Modelo lógico

		Contiene un fichero SQL para la creación lógica de la base de datos.

		- EDBaseOracle.sql

	- Java *(Añadido en la Fase 2)

		Contiene los ficheros necesarios para la ejecución de la aplicación.
		Para ver o editar el codigo fuente es recomendable usar Netbeans.


//---------INSTALACIÓN---------------//

Paso 1.-

	Instalar el Sistema Gestor de Base de Datos.
	Instalar SQL Developer.
	Instalar Netbeans.

Paso 2.-

	Abrir SQL Developer y crear una conexión nueva.
	Abrir el fichero EDBaseOracle.sql con SQL Developer y ejecutar el Script.

Paso 3.-

	Abrir con Netbeans /Java/EjercicioFase2
	Dentro de Source Packages/CLases/GenericoBD cambiar los siguientes parámetros por los correspondientes a la conexión creada con SQL Developer:
		- Login
		- Password
		- url
			- @SrvOracle es el nombre del servidor
			- 1521 es el puerto
			- orcl es el nombre de la base de datos

Paso 4.-
	
	En Netbeans botón derecho del ratón en Libraries y Add JAR/Folder... y elegir la ruta donde está descargado ojdbc6.jar.
	
	Después en el menú Tools/Plugins. En Download elegir Add plugins... y seleccionar jDateChooser.				

	