use educandoSA

/*Cursores Solicitud Compra*/
declare CursorSolicitudes_compra Cursor Scroll
for select *from Solicitudes_compra 

open CursorSolicitudes_compra
fetch next from CursorSolicitudes_compra

close CursorSolicitudes_compra
deallocate CursorSolicitudes_compra

/*Cursores Entrada Almacen*/
declare CursoOrdenCotractual Cursor scroll
for select *from Orden_contractual

open CursoOrdenCotractual
fetch next from CursoOrdenCotractual

close CursoOrdenCotractual
deallocate CursoOrdenCotractual 

/*Cursores Item*/
declare CursoItem Cursor Scroll
for select *from item

open CursoItem
fetch next from CursoItem

close CursoItem
deallocate CursoItem

/*Cursores EntradaAlmacen*/
declare CursorEntrada_Almacen cursor scroll
for select *from Entrada_almacen

open CursorEntrada_Almacen
fetch next from CursorEntrada_Almacen

close CursorEntrada_Almacen
deallocate CursorEntrada_Almacen
