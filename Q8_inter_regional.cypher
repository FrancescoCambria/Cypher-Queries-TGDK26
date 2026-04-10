// Q8_inter_regional.cypher
// Cypher query for inter-regional interactions

MATCH (law:RegionaLaw)-[:HAS_ARTICLE]->(art:Article)
            <-[:CITES]-(art2:Article)-[:HAS_ARTICLE]-(law2:RegionalLaw) 
WHERE law2.region <> law.region
WITH law, art, count(DISTINCT law2.region) AS countRegion
WHERE NOT EXISTS((:Law)-[:HAS_ARTICLE]->(:Article)-[:IS_LEGAL_BASIS_OF]->(law)) and
      countRegion >= 10
RETURN law, art
