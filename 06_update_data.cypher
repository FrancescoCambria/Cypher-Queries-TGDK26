// 06_update_data.cypher
// Updating nodes and relationships with SET and MERGE

// Add a new property to an existing node
MATCH (p:Person {name: 'Alice'})
SET p.email = 'alice@example.com'
RETURN p;

// Update a property on all Movie nodes (add a genre property)
MATCH (m:Movie)
SET m.genre = 'Sci-Fi'
RETURN m.title AS title, m.genre AS genre;

// Use MERGE to create a node only if it does not already exist
MERGE (p:Person {name: 'Eve'})
ON CREATE SET p.born = 2000
ON MATCH  SET p.updated = true
RETURN p;

// Use MERGE to ensure a relationship exists between two nodes
MERGE (eve:Person {name: 'Eve'})
MERGE (m:Movie {title: 'Return of the Path'})
MERGE (eve)-[:ACTED_IN {roles: ['Newcomer']}]->(m);

// Remove a property from a node using REMOVE
MATCH (p:Person {name: 'Alice'})
REMOVE p.email
RETURN p;
