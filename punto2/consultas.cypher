// Obtener todos los libros actualmente prestados (estado “Activo”)
MATCH (e:Estudiante)-[p:PRESTAMO {estado: 'Activo'}]->(l:Libro)
RETURN l.titulo AS Libro, e.nombre AS Estudiante, p.fecha AS FechaPrestamo;

// Listar cuántos libros ha pedido prestado cada estudiante
MATCH (e:Estudiante)-[p:PRESTAMO]->(l:Libro)
RETURN e.nombre AS Estudiante, COUNT(p) AS TotalPrestamos;

// Mostrar las categorías con más préstamos activos

MATCH (e:Estudiante)-[p:PRESTAMO {estado: 'Activo'}]->(l:Libro)-[:PERTENECE_A]->(cat:Categoria)
RETURN cat.nombre AS Categoria, COUNT(p) AS PrestamosActivos
ORDER BY PrestamosActivos DESC;

// Encontrar los estudiantes que no tienen préstamos activos

MATCH (e:Estudiante)
WHERE NOT (e)-[:PRESTAMO {estado: 'Activo'}]->(:Libro)
RETURN e.nombre AS EstudianteSinPrestamosActivos;