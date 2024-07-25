/*Ejercicio 2.     Crea un disparador que se ejecutará automáticamente cuando se elimine algún empleado en la tabla EMPLEADO, visualizando el número y el nombre de las personas borradas. 
(1,5  PUNTOS)*/

DROP TRIGGER BorrarEmpleado;


CREATE OR REPLACE TRIGGER BorrarEmpleado
AFTER INSERT OR DELETE
ON EMPLEADO
FOR EACH ROW
BEGIN
IF DELETING THEN
DBMS_OUTPUT.PUT_LINE('Empleado borrado - Numero: ' || :OLD.EMP_NO ||', Apellido: ' || :OLD.APELLIDO);
END IF;
END;

