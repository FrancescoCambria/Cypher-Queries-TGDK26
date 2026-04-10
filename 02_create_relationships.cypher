// 02_create_relationships.cypher
// Create ACTED_IN and DIRECTED relationships between Person and Movie nodes

MATCH (alice:Person {name: 'Alice'}), (m:Movie {title: 'The Graph Adventure'})
CREATE (alice)-[:ACTED_IN {roles: ['Protagonist']}]->(m);

MATCH (bob:Person {name: 'Bob'}), (m:Movie {title: 'The Graph Adventure'})
CREATE (bob)-[:ACTED_IN {roles: ['Villain']}]->(m);

MATCH (carol:Person {name: 'Carol'}), (m:Movie {title: 'The Graph Adventure'})
CREATE (carol)-[:DIRECTED]->(m);

MATCH (alice:Person {name: 'Alice'}), (m:Movie {title: 'Query of Shadows'})
CREATE (alice)-[:ACTED_IN {roles: ['Detective']}]->(m);

MATCH (david:Person {name: 'David'}), (m:Movie {title: 'Query of Shadows'})
CREATE (david)-[:ACTED_IN {roles: ['Sidekick']}]->(m);

MATCH (bob:Person {name: 'Bob'}), (m:Movie {title: 'Query of Shadows'})
CREATE (bob)-[:DIRECTED]->(m);

MATCH (carol:Person {name: 'Carol'}), (m:Movie {title: 'Return of the Path'})
CREATE (carol)-[:ACTED_IN {roles: ['Mentor']}]->(m);

MATCH (david:Person {name: 'David'}), (m:Movie {title: 'Return of the Path'})
CREATE (david)-[:DIRECTED]->(m);
