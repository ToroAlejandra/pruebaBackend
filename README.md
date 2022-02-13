# pruebaBackend
## SQL
1. Consulta SQL entre tabla Usuarios y Habilidades que trae por usuario las habilidades asociadas
    ``` sql 
    select Usuarios.*, group_concat(Habilidades.name) 
    from Usuarios 
    inner join Habilidades on Usuarios.id =
    Habilidades.user_id 
    group by Usuarios.id;
    ```

2. Consulta a tabla Usuarios donde pueda buscar por el campo name una cadena Buscando similitudes
    ``` sql
    select * from Usuarios where name like '%ana%';
    ```
    
3. Yo pienso que la tabla habilidades_niveles existe para medir el dominio de cierta habilidad por usuario
4. Un usuario puede tener muchas habilidades, sin embargo una habilidad solo puede pertenecer a un usuario, eso quiere decir que existe una relación de uno a muchos. 

---
