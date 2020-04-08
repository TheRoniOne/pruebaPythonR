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

df <- fromJSON(archivoOrigen) %>% as_tibble()
# dataOriginal <- read_csv(archivoOrigen)
# resultado <- slice(dataOriginal, 1)
df$TotalCharges <- as.numeric(df$TotalCharges)
#reemplazar los nulos con la media
df <- df %>% mutate(MonthlyCharges = replace(MonthlyCharges, is.na(MonthlyCharges), median(MonthlyCharges, na.rm= TRUE)))

#reemplazar lo q hayan puesto para decir q es nulo por un nulo real
df <- df %>% mutate(TotalCharges = replace(TotalCharges, TotalCharges == "na", NA)) %>% mutate(
  TotalCharges = replace(TotalCharges, TotalCharges == "N/A", NA)) %>% mutate(
    TotalCharges = replace(TotalCharges, is.na(TotalCharges), median(TotalCharges, na.rm = TRUE)))
#reemplazar lo q hayan puesto para decir q es nulo por un nulo real
df <- df %>% mutate(PaymentMethod = replace(PaymentMethod, PaymentMethod == "--", NA)) %>% mutate(
  PaymentMethod = replace(PaymentMethod, PaymentMethod == "", NA)) %>% mutate(
    PaymentMethod = replace(PaymentMethod, is.na(PaymentMethod), "No encontrado"))

# path_loc <- "D:/Datos de Usuario/rgamezv/Downloads/resultadoPrueba"
path_loc <- args[3]
setwd(path_loc)
nombreArchivoFinal <- str_glue("resultado.json")
write_json(df, nombreArchivoFinal)
# write_json(resultado, nombreArchivoFinal)
# tiempoFin <- Sys.time()
# 
# print(tiempoFin - tiempoInicio)

# write_json(dataOriginal, "telecom.json")