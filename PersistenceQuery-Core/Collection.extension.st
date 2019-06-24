Extension { #name : #Collection }

{ #category : #'*PersistenceQuery-Core' }
Collection >> asPersistenceQuery [
	^ self asDictionary
]
