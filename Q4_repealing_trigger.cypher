// Q4_repealing_trigger.cypher
// Trigger Rule for Repealing a Law

UNWIND $createdRelationship AS newRel
MATCH p=(law:Law)-[:HAS_ARTICLE]->(art:Article)<-[newRel:ABROGATES]-(art2:Article)
               <-[:HAS_ARTICLE]-(newLaw:Law)
WHERE newRel.paragraph IS NULL
WITH law, art, newLaw
MATCH (law)-[:HAS_ARTICLE]->(art)<-[abr:ABROGATES]-()
WHERE abr.paragraph IS NULL
WITH law, law.numArt AS NUMART, COUNT(DISTINCT art) AS NUMREPEALS, newLaw
WHERE NUMREPEALS >= NUMART
MERGE (newLaw)-[rep:REPEAL]->(law)
