Class {
	#name : #PQEJDBQueryVisitorTest,
	#superclass : #TestCase,
	#category : #'PersistenceQuery-EJDB'
}

{ #category : #parsing }
PQEJDBQueryVisitorTest >> parse: aBlock [ 

	^ aBlock asPersistenceQueryFor: #ejdb
]

{ #category : #tests }
PQEJDBQueryVisitorTest >> testParseQueries [
	
	self
		assert: (self parse: [ :each | each age > 4 ])
		equals: '/["age">4]'.
		
	self
		assert: (self parse: [ :each | (each age > 4) & (each age < 10) ])
		equals: '/[("age">4)&("age"<10)]'.
		
	self
		assert: (self parse: [ :each | each name = 'Bianca' ])
		equals: '/["name"="Bianca"]'.	
	
	self
		assert: (self parse: [ :each | each name = 'Bianca "P" Snow' ])
		equals: '/["name"="Bianca \"P\" Snow"]'
]
