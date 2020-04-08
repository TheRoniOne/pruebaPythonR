# tiempoInicio <- Sys.time()
prepararAmbiente <- function(){
  if (!is.element("tidyverse", installed.packages())){
    install.packages("tidyverse")
  }
  if (!is.element("readxl", installed.packages())){
    install.packages("readxl")
  }
  if (!is.element("jsonlite", installed.packages())){
    install.packages("jsonlite")
  }
}

prepararAmbiente()

library("tidyverse")
# library("readxl")
library("jsonlite")

args = commandArgs(trailingOnly=TRUE)
# path_loc <- "D:/Datos de Usuario/rgamezv/Downloads/prueba"
path_loc <- args[1]
archivoOrigen <- args[2]
# archivoOrigen <- "telecom.json"
setwd(path_loc)

dataOriginal <- fromJSON(archivoOrigen) %>% as_tibble()
# dataOriginal <- read_csv(archivoOrigen)
resultado <- slice(dataOriginal, 1)

# path_loc <- "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"
path_loc <- args[3]
setwd(path_loc)
nombreArchivoFinal <- str_glue("resultado.csv")
write_excel_csv(resultado, nombreArchivoFinal)
# tiempoFin <- Sys.time()
# 
# print(tiempoFin - tiempoInicio)

# write_json(dataOriginal, "telecom.json")