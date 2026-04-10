// Q1_create_law_PG_schema.cypher
// PG-schema of the legislative data model.
CREATE GRAPH TYPE lawsGraphType STRICT{(lawType: Law {id STRING, title STRING, 
   lawNum INT, typeLaw STRING, publicationDate, DATE, numArt INT, numAttach INT}),
  (articleType: Article {id STRING, title STRING, number INT}),
  (attachmentType: Attachment {id STRING, title STRING, type STRING}),
  (:lawType)-[hasArticleType: has_article]->(:articleType),
  (:lawType)-[hasAttachmentType:has_attachment]->(:attachmentType),
  (:lawType)-[referenceType: is_legal_basis_of]->(:lawType),
  (:articleType)-[referenceType:is_legal_basis_of|amends|abrogates|cites]->(:lawType),
  (:articleType)-[referenceType: amends|abrogates|cites 
  {paragraph STRING, newText STRING}]->(:articleType),
  (:articleType)-[referenceType: amends|abrogates
   {paragraph STRING, newText STRING}]->(:attachmentType),
  (:attachmentType)-[referenceType:is_legal_basis_of|cites]->(:lawType),
  (:attachmentType)-[referenceType:cites{paragraph STRING}]->(:articleType),
  (:attachmentType)-[referenceType:cites {paragraph STRING}]->(:attachmentType)}
