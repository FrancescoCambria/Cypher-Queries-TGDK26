// Q3_modifying_articles.cypher
// Match laws and the article they amends or modify
MATCH (l1:Law)-[:HAS_ARTICLE]->(a1:Article)<-[r:ABROGATES|AMENDS|INTRODUCES]-(a2:Article)<-[:HAS_ARTICLE]-(l2:Law)
RETURN l1, a1, a2, l2
