# Clase umemoria v1.3 - Manual de Instrucciones

21-06-2012

## Requisitos
El requisito principal para instalar esta clase es, por supuesto, una distribuci�n de LaTeX funcionando.
En Windows se recomienda MiKTeX 2.8 o superior y TeXLive 2009 o superior en Linux u OS X. Dado que esta es la
configuraci�n recomendada, las instrucciones siguientes estar�n centradas en estas distribuciones. De todas formas,
la instalaci�n de esta clase es posible en cualquier distribuci�n relativamente reciente de LaTeX pero
los m�todos de instalaci�n podr�an variar.

Para el correcto funcionamiento de la clase, adicionalmente a la distribuci�n de LaTeX, deber�n estar
instalados los siguientes packages:
* geometry
* amsmath, amssymb, amsthm
* graphicx
* babel
* hyperref
* parskip

Para instrucciones de como instalar estos packages en su distribuci�n, por favor consulte el manual de la misma.
Esta clase se encuentra en fase de desarrollo, as� que estos requisitos podr�an variar a futuro. Se est�
realizando el m�ximo esfuerzo posible para tener el m�nimo de dependencias, de forma que esta clase
pueda ser utilizada en un ambiente minimal.

## Instalaci�n
La instalaci�n de la clase depende del sistema operativo y la distribuci�n de LaTeX en uso.

### Windows/MiKTeX 2.8 o superior
Basta con los archivos umemoria.cls y escudou.pdf a la carpeta %MiKTeX%\tex\latex\base y ejecutar el comando
	```initexmf --update-fndb```
en la l�nea de comandos. Como alternativa a este �ltimo paso, se puede ir al men� Inicio y bajo el apartado
de MiKTeX iniciar el programa "Settings", y hacer click en el bot�n "Refresh FNDB".

### Linux/TeXLive 2009 o superior
Es necesarior copiar los archivos umemoria.cls y escudou.pdf al directorio $TEXLIVE/texmf-local/tex/latex/base y ejecutar
el comando ```maketexlsr```

### Alternativa
Otra alternativa es copiar los archivos umemoria.cls y escudou.pdf a la misma carpeta donde se encuentra el archivo fuente
de LaTeX con el cual se desea usar la clase, aunque este m�todo es poco recomendable puesto que no permite usar
facilmente la clase con m�ltiples fuentes (en diferentes carpetas).

## Modo de Uso
Debido a que esta clase se encuentra en formato "class", basta con incluir la l�nea ```\documentclass[<opciones>]{umemoria}``` en el pre�mbulo del documento.

Las opciones de la clase y los comandos disponibles son detallados a continuaci�n.

### Opciones
La clase umemoria cuenta con variadas opciones. En primer lugar, cabe notar que se heredan todas las opciones de la clase
book, por lo que opciones como twoside, fleqn, leqno, etc. se encuentran disponibles. Adem�s, se agregan las siguientes:

* leftnum: Coloca la numeraci�n de los Teoremas, Definiciones, etc. a la izquierda.
* rightnum (por defecto): Coloca la numeraci�n de los Teoremas, Definiciones, etc. a la derecha.
* contnum (por defecto): Activa la numeraci�n correlativa entre los ambientes de tipo teorema.
* nocontnum: Desactiva la numeraci�n correlativa entre los ambientes de tipo teorema.
* uprightd: Transforma todas las letras 'd' en modo matem�tico a fuente normal, no cursiva.
* uprighte: Transforma todas las letras 'e' en modo matem�tico a fuente normal, no cursiva.
* uprighti: Transforma todas las letras 'i' en modo matem�tico a fuente normal, no cursiva.
* upright: Activa las tres opciones anteriores.

Se pasan por defecto las opciones 12pt y openany.

### Comandos
La clase provee los siguientes comandos, proporcionados para definir par�metros necesarios para la generaci�n de la portada,
etc.

* \author{texto}: Nombre del autor.
* \title{texto}: T�tulo del trabajo. Debe estar escrito SIN fines de l�nea (\\).
* \date{texto}: Fecha de entrega.
* \carrera{texto}: Nombre de la carrera.
* \guia{texto}: Nombre del profesor gu�a.
* \depto{texto}: Departamento al que pertenece el autor.
* \comision{texto1}{texto2}{texto3}: Nombres de los integrantes de la comisi�n evaluadora. Se pueden omitir argumentos.
* \auspicio{texto}: Indica qu� institucion u otro texto incluir en el anuncio de auspicio. En caso de ser omitido el comando, no se muestra la l�nea.

Todos los comandos convierten sus argumentos a may�suclas, a excepci�n del �ltimo.

### Entornos
Se definen adem�s entornos que ayudan a dar un formateo adecuado a cada parte de la memoria, adem�s de ayudar a mantener una coherencia sem�ntica en el c�digo.

* \begin{abstract} \end{abstract}: Delimita la secci�n de Resumen de la memoria.
* \begin{dedicatoria} \end{dedicatoria}: Delimita la dedicatoria. El texto se escribe en cursivas, alineado horizontalmente a la izquierda y centrado verticalmente.
* \begin{thanks} \end{thanks}: Secci�n de agradecimientos.
* \begin{intro} \end{intro}: Introducci�n. Es un cap�tulo no numerado, que se agrega al �ndice.
* \begin{conclusion} \end{conclusion}: Conclusion. Es un cap�tulo no numerado, que se agrega al �ndice.

#### Entornos matem�ticos
Adem�s, se definen entornos 'matem�ticos' que permiten agergar teoremas, definici�nes, etc. de manera ordenada y coherente con el estilo del texto. Estos entornos son

* defn: Definicion.
* teo: Teorema.
* cor: Corolario.
* lema: Lema.
* prop: Proposicion.
* ej: Ejemplo.
* obs: Observacion.
* proof: Demostraci�n. Se agrega autom�ticamente el s�mbolo de t�rmino de la demostraci�n al final de esta.

Por defecto, cada uno de estos entornos tiene una numeraci�n correlativa e intercap�tulos, es decir, escribir un teorema, una definici�n y luego otro teorema
en el cap�tulo 1 y luego otro teorema en el cap�tulo 2 tendr� como resultado lo siguiente:

	Teorema 1.1. ...
	Definici�n 1.2. ...
	Teorema 1.3. ...
	Teorema 2.1. ...

Sin embargo, el comportamiento anterior puede modificarse con la opci�n nocontnum, la que al ser activada produce la siguiente salida:

	Teorema 1.1. ...
	Definici�n 1.1. ...
	Teorema 1.2. ...
	Teorema 2.1. ...

### Otros Comandos
Por �ltimo, existen comandos de letras en modo matem�tico. Cada letra may�scula del abecedario tiene un comando asociado, el que imprimir� una letra en una fuente
diferente (que depende de la letra). La fuente en que una letra se imprime ha sido elegida de forma arbitraria, intentando rescatar las que se usan
con mayor frecuencia. Si se desea modificar la letra que imprime un comando basta con redefinirlo mediante ```\renewcommand{\<letra>}{<comando>}```

## Cr�ditos

Esta clase fue inicialmente desarrollada y mantenida por Nikolas Tapia M., alumno memorista del Departamento de Ingenier�a Matem�tica de la Facultad de Ciencias F�sicas y Matem�ticas, Universidad de Chile.
Luego ha sido mantenido por ADI - �rea de Infotecnolog�as - FCFM


## Changelog

[06-01-2015]
- Limpieza del c�digo
- Movido a github del ADI

[21-06-2012] v1.3
- Se saca el package inputenc y fontenc de la definci�n de la clase, delegando la decisi�n al usuario.
- Corregidos problemas de formato con la numeraci�n en el \frontmatter
- Cambiado el nombre del comando \opting a \carrera
- Cambiada la funcionalidad del comando \comision. Ahora acepta cada nombre como argumento separado.
- Agregados los entornos 'intro' y 'conclusion'
- Cambiada la opci�n por defecto openright por openany
- Comentado el codigo fuente
- Cambiada la definici�n de los entornos abstrac y thanks, ahora son m�s coherentes con el formato.
- Reescrito desde cero el archivo de muestra

[19-06-2012] v1.2
- Cambio de nombre de la clase de memoriadim a umemoria
- Arreglados problemas de compatibilidad
- Reducidas dependencias

[28-04-2012] v1.1
- Escudo de la Universidad en formato vectorizado se incluye junto con el package.

[11-04-2012] v1.0
- Primera versi�n
