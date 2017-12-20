

Como se puede intuir por mi respuesta en el epílogo, considero la selección del dataset clave en el contexto de la respuesta al problema del que se trate. Como se puede apreciar, he seleccionado el dataset en cuestión a raiz de unas premisas clave que he tenido en consideración a la hora de abordar el problema planteado en la práctica, pero en el caso de que estuviéramos tratando de responder a otras preguntas, o el enfoque fuera diferente, el dataset podría bien haber sido diferente. Por poner sólo algunos ejemplos, de algunos otros datasets que podrían haber sido incluidos en la práctica, enumeraré algunos tipos con los que  me he encontrado en la propia web especializada kaggle o en otras fuentes de internet:

•	Datasets eminentemente cuantitativos apropiados para realizar regresiones 
•	Datasets asociados a opiniones de usuarios o clientes en forma de ‘lenguaje natural’.
•	Datasets apropiados para realizar clasificaciones de mayor o menor complejidad (ya sean binarias, como las del caso de análisis de supervivencia del titanic, o multi-clasificaciones).
•	Datasets apropiados para escenarios ‘no supervisados’ y por tanto, no clasificados a priori.

Los tipos de datasets enumerados arriba son sólo algunos ejemplos de los tipos de conjuntos de datos con los que nos podemos encontrar. Todos ellos pueden ser sujeto de tareas de limpieza de datos, análisis y visualizaciones, aunque las técnicas varían ostensiblemente dependiendo de la tipología de datos de que se trate. En la misma línea, las tareas de limpieza son ostensiblemente diferentes si tratamos con variables cuantitativas o categóricas, pero ese es un punto al que volveré más adelante en el apartado correspondiente de la práctica. 

A continuación me centraré principalmente en el análisis del dataset escogido, y haré mención a la metodología utilizada en el análisis del dataset, incluida su limpieza, exploración y visualización. 

En lo que respecta al dataset, el propio sitio web kaggle define las siguientes variables y claves como parte del dataset escogido (copio literalmente respetando el idioma inglés original):


Variable
Definition
Key
Tipo
survival
Survival
0 = No, 1 = Yes
Variable clasificatoria
pclass
Ticket class
1 = 1st, 2 = 2nd, 3 = 3rd
Variable categórica
sex
Sex

Variable categórica
Age
Age in years

Variable continua
sibsp
# of siblings / spouses aboard the Titanic

Variable discreta
parch
# of parents / children aboard the Titanic

Variable discreta
ticket
Ticket number

Variable continua
fare
Passenger fare

Variable continua
cabin
Cabin number

Variable continua
embarked
Port of Embarkation
C = Cherbourg, Q = Queenstown, S = Southampton
Variable categórica

Como podemos apreciar, el dataset se compone de un total de 10 variables de diferentes tipos, destacando una variable clasificatoria que podremos utilizar para identificar qué pacientes sobrevivieron tras el naufragio del Titanic.

En lo que respuesta al ejercicio desarrollado en el lenguaje de programación estadístico R, he decidido realizar el análisis desglosado en diferentes pasos metodológicos lógicos que se dividen en 4 partes fundamentales, de las cuales copio a continuación las cabeceras. El detalle del contenido de las mismas puede apreciarse en el propio sitio git donde he colgado el ejercicio práctico. De la misma forma, profundizaré más en detalle en cada una de las partes en mis respuesas a las preguntas 2 (limpieza de los datos), 3 (análisis de los datos) y 4 (visualizaciones)

PARTE 1: LECTURA DEL DATASET Y CARGA DE LIBRERIAS
1.	Librerias graficas
2.	Carga del Dataset

PARTE 2: LIMPIEZA DE LOS DATOS : DATA CLEANING
1.	Visualizacion de variables (distribucion, dimensiones y valores)
2.	Tratamiento de valores nulos y vacios
3.	Visualizacion de variables (distribucion, dimensiones y valores)
4.	Cleaning de las variables (descripciones de las columnas)
5.	Modificacion de la descripcion de las etiquetas de clases
6.	Factorizacion de columnas para facilitar su uso

PARTE 3: ANALISIS ESTADISTICO DE LOS DATOS : DATA EXPLORATION  
1.	Distribuciones de valor por variable
2.	Desviaciones (Standard Deviation)
3.	Asimetria (Skewness)
4.	Correlaciones
5.	Probabilidades

PARTE 4: PREGUNTAS QUE PODEMOS RESPONDER DEL DATASET : DATA INTERROGATION 
1. PREGUNTA 1: CUALES SON LAS DIMENSIONES DEL DATASET
2. PREGUNTA 2: QUIEN COMPRO LOS TICKETS MAS CAROS?
3. PREGUNTA 3: ¿CUANTOS HOMBRES Y MUJERES SOBREVIVIERON?
4. PREGUNTA 4:  CUAL ES LA DISTRIBUCION DE PASAJEROS POR CLASE?
5. PREGUNTA 5: ¿CUANTAS MUJERES HABIA EN EL PASAJE?
6. PREGUNTA 6: ¿CUAL ES LA CORRELACION ENTRE EDAD Y TARIFAS?
7. PREGUNTA 7: ¿CUAL ES LA DISTRIBUCION DE LAS TARIFAS PAGADAS? 

PARTE 5:
1.	Conclusiones
