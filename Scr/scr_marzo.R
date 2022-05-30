#Trabajo Final

library(tidyverse)
library(haven)
#cabecera
bd_deso_c_mar=read_dta('Input/Marzo.dta/Cabecera - Desocupados.dta')
bd_carac_c_mar=read_dta('Input/Marzo.dta/Cabecera - Características generales (Personas).dta')
bd_vivi_c_mar=read_dta('Input/Marzo.dta/Cabecera - Vivienda y Hogares.dta')
bd_ing_c_mar=read_dta('Input/Marzo.dta/Cabecera - Otros ingresos.dta')

#resto
bd_deso_r_mar=read_dta('Input/Marzo.dta/Resto - Desocupados.dta')
bd_carac_r_mar=read_dta('Input/Marzo.dta/Resto - Caracteristicas generales (Personas).dta')
bd_vivi_r_mar=read_dta('Input/Marzo.dta/Resto - Vivienda y Hogares.dta')
bd_ing_r_mar=read_dta('Input/Marzo.dta/Resto - Otros ingresos.dta')

#unir bases de datos
bd1=full_join(x=bd_deso_c_mar, y=bd_deso_r_mar, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P7422S1', 'P7250', 'P1806'))
bd2=full_join(x=bd_carac_c_mar, y=bd_carac_r_mar, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P6040', 'P6020', 'ESC'))
bd3=full_join(x=bd_ing_c_mar, y=bd_ing_r_mar, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P750S2A1'))
bd4=full_join(x=bd_vivi_c_mar, y=bd_vivi_r_mar, by=c('DIRECTORIO','SECUENCIA_P', 'P4030S1A1'))

#left_join
bd5=left_join(x=bd1, y=bd2, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd6=left_join(x=bd5, y=bd3, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_marzo=left_join(x=bd6, y=bd4, by=c('DIRECTORIO','SECUENCIA_P'))

#exportar
install.packages('rio')
library(rio)
export(bd_marzo, 'base de datos marzo.xlsx')




