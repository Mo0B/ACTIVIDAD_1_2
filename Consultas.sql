-- consulta # 1 inner join (consultas con valores asociador)
SELECT c.id_consulta, c.fecha, c.motivo, p.nombre AS paciente, d.nombre AS doctor
FROM consultas c -- de la tabla consultas referenciada con c
-- traemos los id de otras tablas con el inner join, y asi usar las datos alojados en esas tablas
INNER JOIN enfermedades e ON c.id_enfermedad = e.id_enfermedad
INNER JOIN pacientes p ON e.id_paciente = p.id_paciente
INNER JOIN doctores d ON c.id_doctor = d.id_doctor;

-- consulta # 2 left join (todos los valores de la tabla izquierda y los valores de la tabla derecha que esten asociados)
SELECT e.id_enfermedad, e.nombre AS enfermedad, p.nombre AS paciente
FROM enfermedades e
LEFT JOIN pacientes p ON e.id_paciente = p.id_paciente;

-- consulta $ 3 right join (todos los valores de la tabla derecha y los valores de la tabla izquierda que esten asociados)
SELECT d.id_doctor, d.nombre AS doctor, c.id_consulta, c.fecha
FROM consultas c
RIGHT JOIN doctores d ON c.id_doctor = d.id_doctor;

-- consulta $ 4 where (muestra valores con un filtro)
SELECT * FROM pacientes WHERE nombre LIKE 'A%';

-- consulta $ 5 orden by (muestra los valores ordenador por...)
SELECT * FROM doctores ORDER BY especialidad DESC;

-- consulta $ 6 group by y having (agrupa valores, y contabilidza valores segun un condicional)
SELECT e.nombre AS enfermedad, COUNT(e.id_paciente) AS total_pacientes
FROM enfermedades e
GROUP BY e.nombre
HAVING COUNT(e.id_paciente) >= 1;

-- consulta $ 7 disctinct (muestra todos los valores sin sus duplicaciones)
SELECT DISTINCT especialidad FROM doctores;

-- consulta $ 8 union (muestra valores de dos tablas o mas)
SELECT nombre FROM pacientes
UNION
SELECT nombre FROM doctores;

-- consulta $ 9 update (actualiza valores)
UPDATE doctores SET especialidad = 'Cardiología' WHERE id_doctor = 3;

-- consulta $ 10 delete (elimina valores)
DELETE FROM tratamientos WHERE id_tratamiento = 5;
