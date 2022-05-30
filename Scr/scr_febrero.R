#Trabajo Final

library(tidyverse)
library(haven)
#cabecera
bd_deso_c_feb=read_dta('Input/Febrero.dta/Cabecera - Desocupados.dta')
bd_carac_c_feb=read_dta('Input/Febrero.dta/Cabecera - Características generales (Personas).dta')
bd_vivi_c_feb=read_dta('Input/Febrero.dta/Cabecera - Vivienda y Hogares.dta')
bd_ing_c_feb=read_dta('Input/Febrero.dta/Cabecera - Otros ingresos.dta')

#resto
bd_deso_r_feb=read_dta('Input/Febrero.dta/Resto - Desocupados.dta')
bd_carac_r_feb=read_dta('Input/Febrero.dta/Resto - Caracteristicas generales (Personas).dta')
bd_vivi_r_feb=read_dta('Input/Febrero.dta/Resto - Vivienda y Hogares.dta')
bd_ing_r_feb=read_dta('Input/Febrero.dta/Resto - Otros ingresos.dta')

#unir bases de datos
bd1=full_join(x=bd_deso_c_feb, y=bd_deso_r_feb, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P7422S1', 'P7250', 'P1806'))
bd2=full_join(x=bd_carac_c_feb, y=bd_carac_r_feb, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P6040', 'P6020', 'ESC'))
bd3=full_join(x=bd_ing_c_feb, y=bd_ing_r_feb, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P750S2A1'))
bd4=full_join(x=bd_vivi_c_feb, y=bd_vivi_r_feb, by=c('DIRECTORIO','SECUENCIA_P', 'P4030S1A1'))

#left join
bd5=left_join(x=bd1, y=bd2, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd6=left_join(x=bd5, y=bd3, by=c('DIRECTORIO','SECUENCIA_P','ORDEN'))
bd_febrero=left_join(x=bd6, y=bd4, by=c('DIRECTORIO','SECUENCIA_P'))

#exportar
install.packages('rio')
library(rio)
export(bd_febrero, 'base de datos febrero.xlsx')


