/*Ejercicio 3.     Crear un procedimiento PL/SQL que permita consultar los datos de un determinado cliente indicado como parámetro. */

-- VERSIÓN EXAMEN
DROP PROCEDURE consultaDatos;

CREATE OR REPLACE PROCEDURE consultaDatos
(id_cliente NUMBER,
emp_no EMPLEADOS.EMP_NO%TYPE)-- No es necesario declarar una variable nueva para recoger el parametro, con el emp_no es suficiente
IS
TYPE cursorConsulta IS REF CURSOR RETURN EMPLEADOS%ROWTYPE;-- debido a lo anterior, tampoco es necesario un cursor EXPLICITO
v_consulta cursorConsulta; -- recordar que aqui declaro la variable para instanciar a mi cursor. ES DECIR ES UN CURSOR LLAMADO V_CONSULTA
newCons v_consulta%ROWTYPE; -- y aqui hago una variable que contendra LOS DATOS DE mi cursor instanciado
BEGIN
OPEN v_consulta FOR SELECT * FROM EMPLEADOS WHERE id_cliente = emp_no; -- Es correcto hacer esta consulta para la obtencionde los datos por ello es que no es necesario el cursor explicito. Se debe cambiar id_cliente por emp_no, refiriendonos solo a la variable de tipo empleado.emp_no%rowtype
FETCH v_consulta into newCons;
CLOSE v_consulta;
DBMS_OUTPUT.PUT_LINE (EMP_NO); -- Para que funcione todo este bloque, deberia ser asi "newCons.EMP_NO" es decir, NewCons es donde se almacena mi datos de cursor
END;
/

-- VERSIÓN CORREGIDA DEL EXAMEN Y FUNCIONAL (AUNQUE SIGUE ESTANDO MAL PORQUE TIENE DOS PARAMETROS EL PROCEDIMIENTO)
DROP PROCEDURE consultaDatos;

CREATE OR REPLACE PROCEDURE consultaDatos
(id_cliente NUMBER, 
emp_no EMPLEADO.EMP_NO%TYPE)
IS
TYPE cursorConsulta IS REF CURSOR RETURN EMPLEADO%ROWTYPE;
v_consulta cursorConsulta;
newCons v_consulta%ROWTYPE;
BEGIN
OPEN v_consulta FOR SELECT * FROM EMPLEADO WHERE id_cliente = emp_no;
FETCH v_consulta into newCons;
CLOSE v_consulta;
DBMS_OUTPUT.PUT_LINE ( 'Codigo de Empleado: ' || newCons.EMP_NO || ' Apellido: ' || newCons.APELLIDO ||  ' Oficio: ' || newCons.OFICIO );
END;
/

/*Para ver que nuestro procedimiento funcione como lo habíamos escrito anteriormente TENIA QUE PONER DOS VECES EL PARAMETRO.
Esto debido al error inicial de crear la variable "id_cliente"*/

SET SERVEROUTPUT ON;

BEGIN
  consultaDatos(7934, 7934); -- número de empleado que deseas consultar.
END;
/

/*Problemas del cursor:
- Estoy usando dos parametros, cuando con UNO SOLO es más que suficiente. 
    No necesito crear uno nueva variable, con una variable que almacene el dato de la tabla era suficiente
- Aun confundo, objeto, variable que crea una copia del objeto, y variable de tipo objeto que almacena los datos*/


-- VERSION FINAL
/*Ejercicio 3.     Crear un procedimiento PL/SQL que permita consultar los datos de un determinado empleado indicado como parámetro. */

-- 
DROP PROCEDURE consultarDato;

CREATE OR REPLACE PROCEDURE consultarDato
(id_empleado EMPLEADO.EMP_NO%TYPE) -- Asigno una variable que tome el tipo de dato del campo que quiero que es el ID de empleado (EMP_NO)
IS
TYPE cursorConsulta IS REF CURSOR RETURN EMPLEADO%ROWTYPE; -- SIGO ABRIENDO UN CURSOR EXPLICITO
v_consulta cursorConsulta;
newCons v_consulta%ROWTYPE;
BEGIN
OPEN v_consulta FOR SELECT * FROM EMPLEADO WHERE EMP_NO = id_empleado; -- EN EL CURSOR igualo la búsqueda del registro de la tabla "Empleado" con el del parametro.
FETCH v_consulta into newCons;
CLOSE v_consulta;
DBMS_OUTPUT.PUT_LINE ( 'Codigo de Empleado: ' || newCons.EMP_NO || ' Apellido: ' || newCons.APELLIDO ||  ' Oficio: ' || newCons.OFICIO );
END;
/

SET SERVEROUTPUT ON;

BEGIN
  consultarDato
(7934); -- Reemplaza 7369 con el número de empleado que deseas consultar.
END;
/