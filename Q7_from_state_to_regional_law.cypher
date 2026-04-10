// Q7_from_state_to_regional_law.cypher
// Cypher Query to detect laws Lombardia (or any specific region) needs to work on

MATCH (:Law)-[:HAS_ARTICLE]->(art:Article)
WHERE ('regioni' in art.topics or 'lombardia' in art.topics) and
NOT (EXISTS((art)<-[:CITES]-(:Article)<-[:HAS_ARTICLE]-(law:RegionalLaw) 
     WHERE law.region = 'lombardia')
or EXISTS((art)-[:IS_LEGAL_BASIS_OF]->(law:RegionalLaw) 
           WHERE law.region = 'lombardia'))
RETURN art
