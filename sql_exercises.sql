-- =====================================
-- SQL Practice Queries
-- MySQL Exercises
-- =====================================

-- 1. Average, Max and Min salary
SELECT 
AVG(salario) AS salario_medio,
MAX(salario) AS salario_maximo,
MIN(salario) AS salario_minimo
FROM salarios
WHERE hasta_fecha = '9999-01-01';


-- 2. Employees per department
SELECT id_dpto, COUNT(id_empleado) AS total_empleados
FROM dpto_empresa
GROUP BY id_dpto
HAVING COUNT(id_empleado) > 25000
ORDER BY total_empleados DESC;


-- 3. Employees earning more than company average
SELECT nombre, apellido
FROM empleados
WHERE id_empleado IN (
    SELECT id_empleado
    FROM salarios
    WHERE salario > (
        SELECT AVG(salario)
        FROM salarios
    )
);


-- 4. Employees with salary above 100000 and their department
SELECT 
    e.nombre,
    e.apellido,
    d.nombre_dpto,
    s.salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
JOIN dpto_empresa de ON e.id_empleado = de.id_empleado
JOIN departamentos d ON de.id_dpto = d.id_dpto
WHERE s.salario > 100000
AND s.hasta_fecha = '9999-01-01'
AND de.hasta_fecha = '9999-01-01'
ORDER BY e.nombre ASC;
