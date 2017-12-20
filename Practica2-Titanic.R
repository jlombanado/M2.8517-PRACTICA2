
################# PARTE 1: Lectura del dataset y carga de liberias ##################################
# 1. Librerias graficas
require(ggplot2) # visualizacion
library('dplyr') # manipulacion
library('tidyr') # manipulacion

# 2. dataset

titanic_data <- read.csv('train.csv', stringsAsFactors=F)

# 2.1. Creamos un dataframe de los datos
titanic_data = data.frame(titanic_data)

################# PARTE 2: LIMPIEZA DE LOS DATOS : DATA CLEANING ####################################

# 1. Visualizacion de variables (distribucion, dimensiones y valores)
dim(titanic_data)

unique(titanic_data$Pclass)
unique(titanic_data$Sex)
unique(titanic_data$SibSp)
unique(titanic_data$Parch)
unique(titanic_data$Embarked)

summary(titanic_data)
glimpse(titanic_data)

# 2. Tratamiento de valores nulos y vacios

sapply(titanic_data, function(x) sum(is.na(x)))
sum(is.na(titanic_data$titanic_data))
sum(is.na(titanic_data$Age))

summarise(median_age = median(titanic_data$Ag, na.rm=TRUE))

titanic_data_means <- titanic_data %>% group_by(Survived,Pclass) %>% summarise(median_age = median(Age, na.rm=TRUE)) 

# calculamos los valores medios por grupo de supervivencia y clase
nonsurvived1class = titanic_data_means %>% filter(Survived == 0 & Pclass == 1 ) %>% select(median_age)
nonsurvived2class = titanic_data_means %>% filter(Survived == 0 & Pclass == 2 ) %>% select(median_age)
nonsurvived3class = titanic_data_means %>% filter(Survived == 0 & Pclass == 3 ) %>% select(median_age)
survived1class = titanic_data_means %>% filter(Survived == 1 & Pclass == 1 ) %>% select(median_age)
survived2class = titanic_data_means %>% filter(Survived == 1 & Pclass == 2 ) %>% select(median_age)
survived3class = titanic_data_means %>% filter(Survived == 1 & Pclass == 3 ) %>% select(median_age)

# y despues asignamos la media de edad de cada grupo a a edad que corresponde del dataset
titanic_data$Age[titanic_data$Survived == 0 & titanic_data$Pclass == 1 & is.na(titanic_data$Age)] = nonsurvived1class[,2]
titanic_data$Age[titanic_data$Survived == 0 & titanic_data$Pclass == 2 & is.na(titanic_data$Age)] = nonsurvived2class[,2]
titanic_data$Age[titanic_data$Survived == 0 & titanic_data$Pclass == 3 & is.na(titanic_data$Age)] = nonsurvived3class[,2]
titanic_data$Age[titanic_data$Survived == 1 & titanic_data$Pclass == 1 & is.na(titanic_data$Age)] = survived1class[,2]
titanic_data$Age[titanic_data$Survived == 1 & titanic_data$Pclass == 2 & is.na(titanic_data$Age)] = nonsurvived2class[,2]
titanic_data$Age[titanic_data$Survived == 1 & titanic_data$Pclass == 3 & is.na(titanic_data$Age)] = nonsurvived3class[,2]

# finalmente convertimos la columna edad de tipo 'lista' a numerica, para facilitar su posterior manejo
titanic_data$edad <- sapply(titanic_data$edad, as.numeric)

# 3. Cleaning de las variables (modificamos las descripciones de las columnas para adaptarlas a español)
colnames(titanic_data) = c('pass_id', 'sobrevive', 'clase', 'nombre',
                           'sexo', 'edad', 'num_hermanos', 'num_padres',
                           'billete', 'tarifa', 'cabina', 'embarcado')

# eliminamos la variable cabina del dataset
titanic_data =  subset(titanic_data , select=-c(cabina))

# 4. Modificacion de la descripcion de las etiquetas de clases
titanic_data$clase[titanic_data$clase == 1] = '1a clase'
titanic_data$clase[titanic_data$clase == 2] = '2a clase'
titanic_data$clase[titanic_data$clase == 3] = '3a clase'

# 4.1. Verificamos cambio
unique(titanic_data$clase)

# 5. Factorizacion de columnas para facilitar su uso
titanic_data$clase = as.factor(titanic_data$clase)
titanic_data$edad = as.factor(titanic_data$edad)
titanic_data$sexo = as.factor(titanic_data$sexo)
titanic_data$sobrevive = as.factor(titanic_data$sobrevive)
titanic_data$tarifa = as.factor(titanic_data$tarifa)


################# PARTE 3: ANALISIS ESTADISTICO DE LOS DATOS : DATA EXPLORATION  #####################
library(mlbench)
library(e1071)

# En primer lugar identificamos la tipologia de las clases que componen el dataset
sapply(titanic_data, class)

# 1. Desviaciones y medias de atributos cuantitativos (Standard Deviation): edad y tarifa
sapply(titanic_data[,c(6,10)], mean)
sapply(titanic_data[,c(6,10)], sd)

# 2. Asimetria (Skewness) de las variables cuantitativas
skew <- apply(titanic_data[,c(6,10)] , 2, skewness)
print(skew)

# 3. Correlaciones entre las variables
correlations <- cor(titanic_data[,c(2,6)] )
# mostramos la matriz de correlacion
print(correlations)

correlations <- cor(titanic_data[,c(2,10)] )
# mostramos la matriz de correlacion
print(correlations)

correlations <- cor(titanic_data[,c(6,10)] )
# mostramos la matriz de correlacion
print(correlations)

# 4. Distribuciones de valor por variable y probabilidades (porcentuales)
# paquete
y <- titanic_data$clase
cbind(freq=table(y), percentage=prop.table(table(y))*100)
y <- titanic_data$sobrevive
cbind(freq=table(y), percentage=prop.table(table(y))*100)
y <- titanic_data$sexo
cbind(freq=table(y), percentage=prop.table(table(y))*100)

################################# FIN PARTE 3 #############################################################
################# PARTE 4: VISUALIZACIONES #############
# 1. Preparamos los datos para visualizarlos: factorizacion y agrupacion
# Edad
summary(titanic_data$edad)
int <- seq(0,80,by=10)
edad.bins <- cut(titanic_data$edad,breaks=int,right=FALSE)
plot(edad,edad.bins)
table(edad,edad.bins)
aggregate(edad, by=list(edad.bins), FUN=mean, na.rm=TRUE)

# Tarifa
summary(titanic_data$tarifa)
int <- seq(0,550,by=25)
tarifa.bins <- cut(titanic_data$tarifa,breaks=int,right=FALSE)
plot(titanic_data$tarifa , tarifa.bins)
table(titanic_data$tarifa , tarifa.bins)
aggregate(titanic_data$tarifa , by=list(tarifa.bins), FUN=mean, na.rm=TRUE)

# 2. Visualizacion 1: SCATTERPLOTS
plot(titanic_data$edad , titanic_data$tarifa)
abline(lm(titanic_data$edad~titanic_data$tarifa),col="red",lwd=4)

# Visualizacion 2:  HISTOGRAMAS
hist(titanic_data$tarifa,main="Histograma de tarifas",col="blue")
hist(titanic_data$edad,main="Histograma de edades",col="blue")

# Visualizacion 3:  DIAGRAMA DE DENSIDAD
den.edad <- density(titanic_data$edad)
plot(den.edad,main="Densidad en base a la edad")
ggplot(titanic_data, aes(x=edad)) +
  geom_density(aes(fill = sobrevive), alpha = 0.5) +
  facet_wrap(~sexo)

den.tarifa <- density(titanic_data$tarifa)
plot(den.tarifa,main="Densidad en base a la tarifa")

# Visualizacion 4:  DIAGRAMA DE BARRAS
summary(titanic_data$sexo)
# Sexo vs  tarifa
titanic_data %>% ggplot() + geom_bar(aes(tarifa.bins, fill = sobrevive), position = "dodge") + scale_y_log10()

# Supervivencia vs tarifa
titanic_data %>% ggplot() + geom_bar(aes(sobrevive, fill = clase), position = "dodge") + scale_y_log10()

# Supervivencia vs edad
titanic_data %>% ggplot() + geom_bar(aes(edad.bins, fill = sobrevive), position = "dodge") + scale_y_log10()
################################# FIN PARTE 4 #############################################################

################# PARTE 5: PREGUNTAS QUE PODEMOS RESPONDER DEL DATASET : DATA INTERROGATION #############

# 1. PREGUNTA 1: QUIEN COMPRO LOS TICKETS MAS CAROS?
# 1.1. Realizamos un ranking de los datos por tarifa y ordenado descendentemente
View(titanic_data[order(-titanic_data$tarifa),])

# 2. PREGUNTA 2: ¿CUANTOS HOMBRES Y MUJERES SOBREVIVIERON?
# 2.1. Realizamos un summary de los datos
survivors_sex = aggregate(titanic_data$sobrevive, by = list(sexo = titanic_data$sex),FUN = sum)
# 2.2. Y a continuacion un plot del barchart
qplot(sexo, data = survivors_sex, geom='bar', weight = x) +
  ggtitle("Supervivientes por sexo") +
  xlab("Sexo") +
  ylab("Sobreviven")

# 3. PREGUNTA 3:  CUAL ES LA DISTRIBUCION DE PASAJEROS POR CLASE?
# 3.1. Realizamos un summary de los datos
number_passengers_class = aggregate(titanic_data$clase, by = list(passenger_class = titanic_data$clase),
                                    FUN = length)
# 3.2. Y a continuacion un plot del barchart
qplot(passenger_class, data = number_passengers_class, geom='bar', weight = x) +
  ggtitle("Numero de Pasajeros por Clase") +
  xlab("Clase") +
  ylab("Numero de Pasajeros")

# 4. PREGUNTA 4: ¿CUANTAS PERSONAS TENIAN EL TITULO Mrs (mujer)  EN EL PASAJE?
nrow(
  titanic_data[grepl('Mrs', titanic_data$nombre),]
)

# 5. PREGUNTA 5: ¿CUAL ES LA CORRELACION ENTRE EDAD Y TARIFAS?
# 5.1. Correlacion entre tarifas y edad
cor(titanic_data$edad, titanic_data$tarifa, use = 'complete.obs')
# 5.2. Gplot para mostrar graficamente la Correlacion entre tarifas y edad
qplot(edad, tarifa, data = titanic_data) +
  ggtitle("Correlacion entre edad y tarifa") +
  xlab("Edad") +
  ylab("Tarifa")

# 6. PREGUNTA 6: ¿CUAL ES LA DISTRIBUCION DE LAS TARIFAS PAGADAS? 
# 6.1. Histograma de Tarifas
qplot(tarifa, data = titanic_data, geom = 'histogram',
      binwidth = 20,
      xlim = c(-10,300),
      fill = 'rojo') +
  ggtitle("Distribucion por tarifa") +
  xlab("tarifa") +
  ylab("Numero de pasajeros")
################################# FIN PARTE 5 #############################################################

