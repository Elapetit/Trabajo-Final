#Trabajo Final

library(tidyverse)
library(haven)
#cabecera
bd_deso=read_dta('Input/Enero.dta/Cabecera - Desocupados.dta')
bd_carac=read_dta('Input/Enero.dta/Cabecera - Características generales (Personas).dta')
bd_vivi=read_dta('Input/Enero.dta/Cabecera - Vivienda y Hogares.dta')
bd_ing=read_dta('Input/Enero.dta/Cabecera - Otros ingresos.dta')

#resto
bd_deso_r=read_dta('Input/Enero.dta/Resto - Desocupados.dta')
bd_carac_r=read_dta('Input/Enero.dta/Resto - Características generales (Personas).dta')
bd_vivi_r=read_dta('Input/Enero.dta/Resto - Vivienda y Hogares.dta')
bd_ing_r=read_dta('Input/Enero.dta/Resto - Otros ingresos.dta')

#unir bases de datos
bd1=full_join(x=bd_deso, y=bd_deso_r, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))




bd=left_join(x=bd_deso, y=bd_carac, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_tot=left_join(x=bd, y=bd_ing, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_total=left_join(x=bd_tot, y=bd_vivi, by=c('DIRECTORIO','SECUENCIA_P'))

install.packages('rio')
library(rio)
export(bd_total, 'base de datos cabecera.xlsx')


