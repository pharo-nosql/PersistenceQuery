Extension { #name : #BlockClosure }

{ #category : #'*PersistenceQuery-Core' }
BlockClosure >> asPersistenceQuery [ 
	^ PQQueryBuilder queryFor: self
]

{ #category : #'*PersistenceQuery-Core' }
BlockClosure >> asPersistenceQueryFor: aSymbol [
	^ PQQueryBuilder new 
		generatorClass: (PQVisitor withName: aSymbol);
		buildQueryFor: self
]
