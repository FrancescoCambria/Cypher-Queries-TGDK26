// 01_create_nodes.cypher
// Create Person and Movie nodes

CREATE (:Person {name: 'Alice', born: 1990});
CREATE (:Person {name: 'Bob', born: 1985});
CREATE (:Person {name: 'Carol', born: 1978});
CREATE (:Person {name: 'David', born: 1995});

CREATE (:Movie {title: 'The Graph Adventure', released: 2020, tagline: 'Nodes and edges like never before'});
CREATE (:Movie {title: 'Query of Shadows', released: 2018, tagline: 'Find what the data hides'});
CREATE (:Movie {title: 'Return of the Path', released: 2022, tagline: 'Every journey has a start node'});
