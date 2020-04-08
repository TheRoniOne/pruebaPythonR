# tiempoInicio <- Sys.time()
# prepararAmbiente <- function(){
#   if (!is.element("tidyverse", installed.packages())){
#     print("Yes")
#   }
#   if (!is.element("readxl", installed.packages())){
#     print("Yes")
#   }
# }
# 
# prepararAmbiente()

library("tidyverse")
library("readxl")

args = commandArgs(trailingOnly=TRUE)
# path_loc <- "D:/Datos de Usuario/rgamezv/Downloads/prueba"
path_loc <- args[1]
archivoOrigen <- args[2]
# archivoOrigen <- "telecom.csv"
setwd(path_loc)

dataOriginal <- read_csv(archivoOrigen)
resultado <- slice(dataOriginal, 1)

# path_loc <- "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"
path_loc <- args[3]
setwd(path_loc)
nombreArchivoFinal <- str_glue("resultado.csv")
write_excel_csv(resultado, nombreArchivoFinal)
# tiempoFin <- Sys.time()
# 
# print(tiempoFin - tiempoInicio)
