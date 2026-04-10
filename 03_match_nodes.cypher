// 03_match_nodes.cypher
// Basic MATCH queries to retrieve nodes

// Return all Person nodes
MATCH (p:Person)
RETURN p;

// Return all Movie nodes
MATCH (m:Movie)
RETURN m;

// Return only the name of every Person
MATCH (p:Person)
RETURN p.name AS name;

// Return title and release year of every Movie
MATCH (m:Movie)
RETURN m.title AS title, m.released AS released;

// Return all nodes and their labels (regardless of type)
MATCH (n)
RETURN labels(n) AS labels, n;
