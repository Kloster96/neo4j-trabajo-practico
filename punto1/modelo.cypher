// Crear departamentos
CREATE (:Departamento {nombre: 'Desarrollo'}),
       (:Departamento {nombre: 'Marketing'}),
       (:Departamento {nombre: 'Finanzas'});

// Crear empleados
CREATE (:Empleado {nombre: 'Luciano', id: 1}),
       (:Empleado {nombre: 'Valentina', id: 2}),
       (:Empleado {nombre: 'Pedro', id: 3});

// Relacionar empleados con departamentos
MATCH (e:Empleado {id: 1}), (d:Departamento {nombre: 'Desarrollo'})
CREATE (e)-[:PERTENECE_A]->(d);

MATCH (e:Empleado {id: 2}), (d:Departamento {nombre: 'Marketing'})
CREATE (e)-[:PERTENECE_A]->(d);

// Crear proyectos
CREATE (:Proyecto {nombre: 'Proyecto A', id: 'A'}),
       (:Proyecto {nombre: 'Proyecto B', id: 'B'});

// Relacionar empleados con proyectos (TRABAJA_EN con horas)
MATCH (e:Empleado {id: 1}), (p:Proyecto {id: 'A'})
CREATE (e)-[:TRABAJA_EN {horas: 20}]->(p);

// Crear líderes
MATCH (e:Empleado {id: 1}), (p:Proyecto {id: 'A'})
CREATE (e)-[:LIDERA]->(p);