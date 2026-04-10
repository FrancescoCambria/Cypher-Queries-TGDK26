// 04_match_relationships.cypher
// MATCH queries that traverse relationships

// Find all actors and the movies they acted in
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name AS actor, m.title AS movie;

// Find all directors and the movies they directed
MATCH (p:Person)-[:DIRECTED]->(m:Movie)
RETURN p.name AS director, m.title AS movie;

// Find all people connected to a specific movie (any relationship type)
MATCH (p:Person)-[r]->(m:Movie {title: 'The Graph Adventure'})
RETURN p.name AS person, type(r) AS relationship;

// Find movies that a specific person is involved in (acted or directed)
MATCH (p:Person {name: 'Alice'})-[r]->(m:Movie)
RETURN m.title AS movie, type(r) AS role;

// Find co-actors: people who acted in the same movie as Alice
MATCH (alice:Person {name: 'Alice'})-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(coActor:Person)
RETURN coActor.name AS coActor, m.title AS movie;
