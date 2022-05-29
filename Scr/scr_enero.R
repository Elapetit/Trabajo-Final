#Trabajo Final

library(tidyverse)
library(haven)
#cabecera
bd_deso_c_ene=read_dta('Input/Enero.dta/Cabecera - Desocupados.dta')
bd_carac_c_ene=read_dta('Input/Enero.dta/Cabecera - Características generales (Personas).dta')
bd_vivi_c_ene=read_dta('Input/Enero.dta/Cabecera - Vivienda y Hogares.dta')
bd_ing_c_ene=read_dta('Input/Enero.dta/Cabecera - Otros ingresos.dta')

#resto
bd_deso_r_ene=read_dta('Input/Enero.dta/Resto - Desocupados.dta')
bd_carac_r_ene=read_dta('Input/Enero.dta/Resto - Características generales (Personas).dta')
bd_vivi_r_ene=read_dta('Input/Enero.dta/Resto - Vivienda y Hogares.dta')
bd_ing_r_ene=read_dta('Input/Enero.dta/Resto - Otros ingresos.dta')

#unir bases de datos
bd1=full_join(x=bd_deso_c_ene, y=bd_deso_r_ene, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd2=full_join(x=bd_carac_c_ene, y=bd_carac_r_ene, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd3=full_join(x=bd_vivi_c_ene, y=bd_vivi_r_ene, by=c('DIRECTORIO','SECUENCIA_P'))
bd4=full_join(x=bd_ing_c_ene, y=bd_ing_r_ene, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))

#left join
bd5=left_join(x=bd1, y=bd2, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd6=left_join(x=bd5, y=bd4, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_enero=left_join(x=bd6, y=bd3, by=c('DIRECTORIO','SECUENCIA_P'))

#exportar
install.packages('rio')
library(rio)
export(bd_enero, 'base de datos enero.xlsx')


