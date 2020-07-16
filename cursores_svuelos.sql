use sistemaVuelos 
/*Cursores programa_Vuelo*/
declare CursorProgramaVuelo Cursor Scroll
for select *from Programa_vuelo 

open CursorProgramaVuelo 
fetch next from CursorProgramaVuelo

close CursorProgramaVuelo 
deallocate CursorProgramaVuelo 

/*Cursores Vuelo*/
declare CursoVuelo Cursor Scroll
for select *from Vuelo

open CursoVuelo
fetch next from CursoVuelo

close CursoVuelo
deallocate CursoVuelo 

/*Cursores Aeropuerto*/

declare CursoAeropuerto Cursor Scroll
for select *from Aeropuerto

open CursoAeropuerto
fetch next from CursoAeropuerto

close CursoAeropuerto
deallocate CursoAeropuerto
