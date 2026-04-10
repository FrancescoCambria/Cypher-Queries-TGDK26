// 08_aggregation.cypher
// Aggregation functions, ORDER BY, LIMIT, and SKIP

// Count the total number of Person nodes
MATCH (p:Person)
RETURN count(p) AS totalPersons;

// Count how many movies each person has acted in
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name AS actor, count(m) AS moviesActedIn
ORDER BY moviesActedIn DESC;

// Find the earliest and latest movie release years
MATCH (m:Movie)
RETURN min(m.released) AS earliest, max(m.released) AS latest;

// Collect movie titles into a list grouped by person
MATCH (p:Person)-[:ACTED_IN]->(m:Movie)
RETURN p.name AS actor, collect(m.title) AS movies;

// Return the top 3 most recently released movies
MATCH (m:Movie)
RETURN m.title AS title, m.released AS released
ORDER BY m.released DESC
LIMIT 3;

// Skip the first result and return the next 2 movies ordered by release year
MATCH (m:Movie)
RETURN m.title AS title, m.released AS released
ORDER BY m.released ASC
SKIP 1
LIMIT 2;

// Average birth year of all persons
MATCH (p:Person)
RETURN avg(p.born) AS averageBirthYear;
