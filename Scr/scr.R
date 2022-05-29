#Trabajo Final

library(tidyverse)
library(haven)
bd_deso=read_dta('Input/Enero.dta/Cabecera - Desocupados.dta')
bd_carac=read_dta('Input/Enero.dta/Cabecera - Características generales (Personas).dta')
bd_vivi=read_dta('Input/Enero.dta/Cabecera - Vivienda y Hogares.dta')

bd=left_join(x=bd_deso, y=bd_carac, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_tot=left_join(x=bd, y=bd_vivi, by=c('DIRECTORIO','SECUENCIA_P'))

install.packages('rio')
library(rio)
export(bd_tot, "base de datos cabecera.xlsx")

