// Crear carreras
CREATE (:Carrera {nombre: 'Ingeniería'}),
       (:Carrera {nombre: 'Medicina'}),
       (:Carrera {nombre: 'Derecho'});

// Crear estudiantes
CREATE (:Estudiante {nombre: 'Luciano', id: 1}),
       (:Estudiante {nombre: 'Valentina', id: 2}),
       (:Estudiante {nombre: 'Pedro', id: 3});

// Relacionar estudiantes con carreras
MATCH (e:Estudiante {id: 1}), (c:Carrera {nombre: 'Ingeniería'})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {id: 2}), (c:Carrera {nombre: 'Medicina'})
CREATE (e)-[:PERTENECE_A]->(c);

MATCH (e:Estudiante {id: 3}), (c:Carrera {nombre: 'Derecho'})
CREATE (e)-[:PERTENECE_A]->(c);

// Crear categorías
CREATE (:Categoria {nombre: 'Matemáticas'}),
       (:Categoria {nombre: 'Medicina'}),
       (:Categoria {nombre: 'Historia'}),
       (:Categoria {nombre: 'Derecho'});

// Crear libros
CREATE (:Libro {titulo: 'Cálculo I', id: 'L1'}),
       (:Libro {titulo: 'Anatomía Humana', id: 'L2'}),
       (:Libro {titulo: 'Historia Mundial', id: 'L3'}),
       (:Libro {titulo: 'Derecho Constitucional', id: 'L4'});

// Relacionar libros con categorías
MATCH (l:Libro {id: 'L1'}), (cat:Categoria {nombre: 'Matemáticas'})
CREATE (l)-[:PERTENECE_A]->(cat);

MATCH (l:Libro {id: 'L2'}), (cat:Categoria {nombre: 'Medicina'})
CREATE (l)-[:PERTENECE_A]->(cat);

MATCH (l:Libro {id: 'L3'}), (cat:Categoria {nombre: 'Historia'})
CREATE (l)-[:PERTENECE_A]->(cat);

MATCH (l:Libro {id: 'L4'}), (cat:Categoria {nombre: 'Derecho'})
CREATE (l)-[:PERTENECE_A]->(cat);

// Crear préstamos con fecha y estado
MATCH (e:Estudiante {id: 1}), (l:Libro {id: 'L1'})
CREATE (e)-[:PRESTAMO {fecha: date('2025-07-01'), estado: 'Activo'}]->(l);

MATCH (e:Estudiante {id: 1}), (l:Libro {id: 'L2'})
CREATE (e)-[:PRESTAMO {fecha: date('2025-06-10'), estado: 'Devuelto'}]->(l);

MATCH (e:Estudiante {id: 2}), (l:Libro {id: 'L3'})
CREATE (e)-[:PRESTAMO {fecha: date('2025-06-15'), estado: 'Activo'}]->(l);

MATCH (e:Estudiante {id: 3}), (l:Libro {id: 'L4'})
CREATE (e)-[:PRESTAMO {fecha: date('2025-05-20'), estado: 'Devuelto'}]->(l);

MATCH (e:Estudiante {id: 3}), (l:Libro {id: 'L1'})
CREATE (e)-[:PRESTAMO {fecha: date('2025-07-02'), estado: 'Activo'}]->(l);