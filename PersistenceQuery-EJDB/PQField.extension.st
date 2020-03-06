Extension { #name : #PQField }

{ #category : #'*PersistenceQuery-EJDB' }
PQField >> ejdbLabel [

	^ String streamContents: [ :stream |
		stream 
			nextPut: $"; 
			nextPutAll: self label; 
			nextPut: $" ]
]
