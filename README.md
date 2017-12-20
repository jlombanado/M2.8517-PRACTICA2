# M2.851 - Tipología y ciclo de vida de los datos aula 1: Limpieza y Validación de datos

El presente ejercicio práctico da respuesta a la práctica propuesta en el módulo de Tiplogoíg y Ciclo de vida de los Datos del Máster de Ciencia de Datos de la UOC. Para ello y siendo un ejercicio libre, he decidido basarme en el siguiente caso práctico planteado en el sitio web especializado en Machine Learning www.kaggle.com:

https://www.kaggle.com/c/titanic/data

El caso práctico ha sido elaborado únicamente por Javier Lombana Domínguez

## Dataset y Caso de Uso escogido: Supervivencia en el TITANIC
En lo que respecta al dataset, el propio sitio web kaggle define las siguientes variables y claves como parte del dataset escogido :


![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Dataset.png "Dataset")

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

## Visualizaciones

Conclusiones de las visualizaciones de diagramas de barras: esta visualización nuevamente refuerza varios hechos que ya intuíamos por análisis previos, pero también nos permite profundizar en algún factor nuevo:
1.	El ratio de supervivencia de los pasajeros de tercera clase es sensiblemente inferior al de las demás clases (esto es, teniendo en cuenta los valores absolutos por clase y no comparando unas clases con otras, menos pasajeros de tercera clase tendían a sobrevivir tras el desastre).
2.	Sin tener en cuenta las clases, las edades con menor ratio de supervivencia se encontraban en el rango que va de 20 a 30 años de edad, seguido de cerca por el de 30 a 40.
3.	Los ratios de supervivencia disminuyen concluyentemente en las tarifas bajas, especialmente por debajo de 50$, seguramente asociados a tercera clase.

![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Barchart1.png "Barchart1")
![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Barchart2.png "Barchart2")
![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Barchart3.png "Barchart3")


Conclusiones de los diagramas de densidad : La mayor frecuencia de pasajeros se corresponde a la franja de edad que va de los 30 a los 4 años que, como veremos después, también encaja con la franja de edad con mayor índice de no-supervivencia.  En cuanto a la tarifa, la frecuencia es tremendamente superior en el rango que va de 0 a 50. Este factor se ha visto también con los diagramas de barras, al visualizar las tarifas en relación a la supervivencia.

![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Histograms.png "Histograms")

Conclusiones de los diagramas de densidad : los diagramas muestran la densidad del volumen de los datos en relación a la variable edad en relación a la variable sexo, por lo que podemos ver que existe una mayor densidad para los hombres en la franja de edad que va de 20 a 40 años, franja que en el caso de las mujeres es más suave a nivel de densidad.

![Alt text](https://github.com/jlombanado/M2.8517-PRACTICA2/blob/master/Densidad.png "Densidad")



## Conclusiones

En cualquier caso y a modo de resumen del trabajo expuesto en las secciones previas, resumo a continuación las conclusiones a las que he llegado tras el análisis efectuado:

1.	La mayor frecuencia de pasajeros se corresponde a la franja de edad que va de los 30 a los 40 años, y dentro de ella, existe mayor densidad para el caso de hombres que para mujeres (que tienden a ser más jóvenes de media en el pasaje).
2.	El mayor  índice de no-supervivencia se corresponde a la franja de edad que va de los 30 a los 40 años.  
3.	La tarifa más frecuente con enorme diferencia se corresponde con el rango 0-50, que a su vez se corresponde con los pasajeros de tercera clase. 
4.	El ratio de supervivencia de los pasajeros de tercera clase es sensiblemente inferior al de las demás clases (esto es, teniendo en cuenta los valores absolutos por clase y no comparando unas clases con otras, menos pasajeros de tercera clase tendían a sobrevivir tras el desastre).
5.	Sin tener en cuenta las clases, las edades con menor ratio de supervivencia se encontraban en el rango que va de 20 a 30 años de edad, seguido de cerca por el de 30 a 40.
6.	Los ratios de supervivencia disminuyen concluyentemente en las tarifas bajas, especialmente por debajo de 50$, seguramente asociados a tercera clase.
7.	En los gráficos de densidad, la distribución se acumula en el primer tramo de la gráfica, correspondiendo a las tarifas más bajos para el mayor número de pasajeros asociado, lo que hace pensar que el Titanic iba principalmente ocupado por pasajeros que pagaron tarifas bajas (tercera clase probablemente). Por contra el número de pasajeros disminuye enormemente a medida que las tarifas van aumentando hacia la derecha

En conclusión a los expuesto arriba, podeos decir que había tres variables determinantes en el hecho de que un pasajero sobreviviera o no:
•	Sexo
•	Edad
•	Tarifa

En el caso de la tarifa podríamos incluso reemplazar el atributo por ‘clase’ y obtendríamos el mismo resultado, ya que es precisamente en primera clase donde las tarifas son más caras y en tercera donde son más baratas, y es en ambos casos donde la correlación entre supervivencia y ambos atributos es más elevada.

