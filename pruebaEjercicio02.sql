/**Prueba del Trigger */

-- Habilitar la salida del DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- Probar la eliminación de un registro
DELETE FROM EMPLEADO WHERE EMP_NO = 7937;

-- Confirmar cambios
COMMIT;