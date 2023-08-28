#separar por sexo
#hombre
hombres <- subset(datos2023, sexo=="M")
hombres
#mujeres
mujeres <- subset(datos2023, sexo=="F")
mujeres

#seleccionar solo continuas por sexo:
#hombre continuas
hombrecont <- hombres[ , 7:22]
hombrecont
#mujeres continuas
mujercont <- mujeres[ , 7:22]
mujercont

#promedio de continuas por sexo
#promedio hombres continuas
prom_hombres <- lapply(hombrecont, mean)
prom_hombres
#promedio mujeres continuas
prom_mujeres <- lapply(mujercont, mean)
prom_mujeres

#ColMeans
mean_hombre <- colMeans(hombrecont)
mean_hombre

mean_mujer <- colMeans (mujercont)
mean_mujer

#crear una matriz con cada promedio obtenido
matriz <- cbind(prom_hombres, prom_mujeres)
matriz

matriz2 <- cbind (mean_hombre, mean_mujer)
matriz2

#invertir matriz 
matriz_invertida <- t(matriz)
matriz_invertida

matriz2_invertida <- t(matriz2)
matriz2_invertida

#usar faces
library("aplpack")
caritas <- faces(matriz_invertida)
caritas
caritas2 <- faces (matriz2_invertida)
caritas2

#agregarle nombres a cara carita
row.names(matriz2_invertida) <- c("hombres", "mujeres")
matriz2_invertida

#aplicar de nuevo faces 
faces (matriz2_invertida)

#combinar para hacer hotelling
HOMBRES <- cbind(mean_hombre)
HOMBRES

MUJERES <- cbind(mean_mujer)
MUJERES

##PRUEBA DE HOTELLING
install.packages("Hotelling")
library("Hotelling")
hot <- hotelling.stat(HOMBRES, MUJERES)
hot
hot2 <- hotelling.test (HOMBRES, MUJERES)
hot2


