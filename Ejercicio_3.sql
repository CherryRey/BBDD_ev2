DROP PROCEDURE consultarDato;
-- Para que nos muestre los resultados en pantalla
SET SERVEROUTPUT ON; 

/*Ejercicio 3.     Crear un procedimiento PL/SQL que permita consultar los datos de un determinado empleado indicado como parámetro. */

CREATE OR REPLACE PROCEDURE consultarDato
(idEmp EMPLEADO.EMP_NO%TYPE) -- Coloco el parametro que se obtendra de la tabla de Empleados del campo EMP_NO. Uso %TYPE para indicar que sea el mismo tipo de dato
IS
--Declaro variables para almacenar los datos que quiero obtener de la tabla y de mi consulta
varID EMPLEADO.EMP_NO%TYPE;
varApellido EMPLEADO.APELLIDO%TYPE;
varOficio EMPLEADO.OFICIO%TYPE;
varSalario EMPLEADO.SALARIO%TYPE;
--iniciamos bloque que contendrá el funcionamiento, en este caso una consulta:
BEGIN
    SELECT EMP_NO, APELLIDO, OFICIO, SALARIO
    INTO varID, varApellido, varOficio,varSalario -- almacenamos los valores de la consulta en nuestras variables anteriores
    FROM EMPLEADO
    WHERE EMP_NO = idEmp; -- para la búsqueda lo igualamos con el parametros
    DBMS_OUTPUT.PUT_LINE('Código de Empleado: ' ||varId || ' Apellido: ' || varApellido || ' Oficio: ' || varOficio || ' Salario: ' || varSalario);
END;
/
--Colocamos la barra si inmediatamente vamos a iniciar otro bloque distinto. *Los comentarios siempre en la siguiente línea.*
BEGIN
  consultarDato
(7934); -- indicamos el numero del empleado.
END;


