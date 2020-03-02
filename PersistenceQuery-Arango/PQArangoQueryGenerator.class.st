Class {
	#name : #PQArangoQueryGenerator,
	#superclass : #PQVisitor,
	#category : #'PersistenceQuery-Arango'
}

{ #category : #accessing }
PQArangoQueryGenerator class >> label [
	^ #arango
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitComparisonCondition: aCondition [
	^ Dictionary new 
		at: (self visit: aCondition left) 
		put: (Dictionary new
			at: aCondition label
			put: (self visit: aCondition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitEqualCondition: aCondition [
	^ Dictionary new 
		at: (self visit: aCondition left) 
		put: (self visit: aCondition right);
		yourself
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitField: aField [
	^ aField label
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitInCondition: aCondition [
	^ Dictionary new
		at: aCondition label
		put: (Dictionary new
			at: (self visit: aCondition left) 
			put: (self visit: aCondition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitLogicalCondition: aLogicalCondition [
	^ Dictionary new
		at: aLogicalCondition label
		put: (aLogicalCondition conditions collect: [ :each |
			self visit: each ]);
		yourself
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitNotCondition: aCondition [ 
	^ Dictionary new
		at: (self visit: aCondition condition left)
		put: (Dictionary new
			at: aCondition label
			put: (self visit: aCondition condition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitObject: anObject [
	^ anObject
]

{ #category : #visiting }
PQArangoQueryGenerator >> visitWhereCondition: aWhereCondition [ 
	^ Dictionary new
		at: aWhereCondition label
		put: aWhereCondition javascript;
		yourself
]
