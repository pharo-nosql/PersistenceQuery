Extension { #name : #Object }

{ #category : #'*PersistenceQuery-Core' }
Object >> pqAccept: aVisitor [
	^ aVisitor visitObject: self
]
