// 05_filter_where.cypher
// Filtering results with WHERE

// Find people born after 1988
MATCH (p:Person)
WHERE p.born > 1988
RETURN p.name AS name, p.born AS born;

// Find movies released between 2018 and 2021 (inclusive)
MATCH (m:Movie)
WHERE m.released >= 2018 AND m.released <= 2021
RETURN m.title AS title, m.released AS released;

// Find movies whose title contains the word 'the' (case-insensitive)
MATCH (m:Movie)
WHERE toLower(m.title) CONTAINS 'the'
RETURN m.title AS title;

// Find people whose name starts with a specific letter
MATCH (p:Person)
WHERE p.name STARTS WITH 'A'
RETURN p.name AS name;

// Find actors who acted in movies released after 2019
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
WHERE m.released > 2019
RETURN p.name AS actor, m.title AS movie, m.released AS released;
