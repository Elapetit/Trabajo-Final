#Trabajo Final

library(tidyverse)
library(haven)
library(readxl)

#leer bases de datos
bd_enero=read_excel('Output 1/base de datos enero.xlsx')
bd_febrero=read_excel('Output 1/base de datos febrero.xlsx')
bd_marzo=read_excel('Output 1/base de datos marzo.xlsx')

#unir bases de datos
bd1=full_join(x=bd_enero, y=bd_febrero, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P6020', 'P6040', 'ESC', 'P4030S1A1', 'P7422S1', 'P7250', 'P1806', 'P750S2A1'))
bd_tot=full_join(x=bd1, y=bd_marzo, by=c('DIRECTORIO','SECUENCIA_P','ORDEN', 'P6020', 'P6040', 'ESC', 'P4030S1A1', 'P7422S1', 'P7250', 'P1806', 'P750S2A1'))

#exportar
install.packages('rio')
library(rio)
export(bd_tot, 'base de datos total.xlsx')

