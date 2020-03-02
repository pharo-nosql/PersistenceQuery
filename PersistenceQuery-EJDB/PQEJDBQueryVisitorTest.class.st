Class {
	#name : #PQEJDBQueryVisitorTest,
	#superclass : #TestCase,
	#category : #'PersistenceQuery-EJDB'
}

{ #category : #parsing }
PQEJDBQueryVisitorTest >> parse: aBlock [ 

	^  aBlock asPersistenceQueryFor: #ejdb
]

{ #category : #tests }
PQEJDBQueryVisitorTest >> testVisit [
	
	self
		assert: (self parse: [ :each | each age > 4 ])
		equals: '"age">4'.
		
	self
		assert: (self parse: [ :each | (each age > 4) & (each age < 10) ])
		equals: '("age">4)&("age"<10)'
]
