// Q6_minegraphrule.cypher
// Mine Graph Rule Operator for Association rules based on topics governments have been working on

MINE GRAPH RULE FrequentChangesOnTopic
GROUPING ON (topic:Topic) 
WHERE t.name CONTAINS '$topicName'
DEFINING 
    BODY AS (topic)<-[:OF_TOPIC]-(art:Article)<-[:HAS_ARTICLE]-(law:Law)
               <-[:CREATED_UNDER]-(gov:Government)-[:SUCCEDED_BY]->(gov2.Government)
    HEAD AS (topic)<-[:OF_TOPIC]-(art2:Article) <-[:ABROGATES]-(art3:Article)
               <-[:HAS_ARTICLE]-(law2:Law)<-[:CREATED_UNDER]-(gov3:Government)
WHERE gov2 = gov3
IGNORE art, law, gov2, art2, art3, law2
EXTRACTING RULES WITH SUPPORT > 0.2 
               AND CONFIDENCE > 0.6
