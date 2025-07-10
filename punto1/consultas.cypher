// 1. Nombre del proyecto, su líder y empleados asignados
MATCH (p:Proyecto)<-[:LIDERA]-(l:Empleado)
MATCH (p)<-[:TRABAJA_EN]-(e:Empleado)
RETURN p.nombre AS Proyecto, l.nombre AS Lider, collect(e.nombre) AS Empleados;

// 2. Total de horas semanales por proyecto
MATCH (e:Empleado)-[t:TRABAJA_EN]->(p:Proyecto)
RETURN p.nombre AS Proyecto, SUM(t.horas) AS TotalHoras;

// 3. Empleados que trabajan en más de un proyecto
MATCH (e:Empleado)-[:TRABAJA_EN]->(p:Proyecto)
WITH e, COUNT(DISTINCT p) AS proyectos
WHERE proyectos > 1
RETURN e.nombre AS Empleado, proyectos;