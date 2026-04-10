// 07_delete_data.cypher
// Removing nodes and relationships with DELETE and DETACH DELETE

// Delete a specific relationship (Bob no longer directed 'Query of Shadows')
MATCH (bob:Person {name: 'Bob'})-[r:DIRECTED]->(m:Movie {title: 'Query of Shadows'})
DELETE r;

// Delete a node that has no relationships (safe delete)
MATCH (p:Person {name: 'Eve'})
DETACH DELETE p;

// Delete all relationships of a given type across the entire graph
MATCH ()-[r:ACTED_IN]->()
WHERE r.roles = ['Newcomer']
DELETE r;

// Use DETACH DELETE to remove a node together with all its relationships
MATCH (m:Movie {title: 'Return of the Path'})
DETACH DELETE m;

// WARNING: Delete everything in the graph (use with caution)
// MATCH (n)
// DETACH DELETE n;
