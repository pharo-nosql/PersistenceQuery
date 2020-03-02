Class {
	#name : #PQMongoQueryGenerator,
	#superclass : #PQVisitor,
	#category : #'PersistenceQuery-Mongo'
}

{ #category : #accessing }
PQMongoQueryGenerator class >> label [
	^ #mongo
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitComparisonCondition: aCondition [
	^ Dictionary new 
		at: (self visit: aCondition left) 
		put: (Dictionary new
			at: aCondition label
			put: (self visit: aCondition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitEqualCondition: aCondition [
	^ Dictionary new 
		at: (self visit: aCondition left) 
		put: (self visit: aCondition right);
		yourself
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitField: aField [
	^ aField label
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitInCondition: aCondition [
	^ Dictionary new
		at: aCondition label
		put: (Dictionary new
			at: (self visit: aCondition left) 
			put: (self visit: aCondition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitLogicalCondition: aLogicalCondition [
	^ Dictionary new
		at: aLogicalCondition label
		put: (aLogicalCondition conditions collect: [ :each |
			self visit: each ]);
		yourself
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitNotCondition: aCondition [ 
	^ Dictionary new
		at: (self visit: aCondition condition left)
		put: (Dictionary new
			at: aCondition label
			put: (self visit: aCondition condition right);
			yourself);
		yourself
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitObject: anObject [
	^ anObject
]

{ #category : #visiting }
PQMongoQueryGenerator >> visitWhereCondition: aWhereCondition [ 
	^ Dictionary new
		at: aWhereCondition label
		put: aWhereCondition javascript;
		yourself
]
