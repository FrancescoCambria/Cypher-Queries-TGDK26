// Q5_legalvoid_trigger.cypher
// Trigger for Legal void

UNWIND $createdRelationships AS newRel
MATCH (art)<-[:HAS_ARTICLE]-(newLaw:Law)-[newRel:REPEAL]->(law:Law)
          -[:IS_LEGAL_BASIS_OF]->(law2:Law)-[:HAS_ARTICLE]->(art2:Article)
WHERE NOT EXISTS (()-[:REPEAL]->(law2)) 
AND newLaw.id <> law2.id 
AND NOT EXISTS ((art)-[:ABROGATES|CITES|AMENDS|INTRODUCES]->(art2))
MERGE (newLaw)-[:UNDERMINES]->(law2)
