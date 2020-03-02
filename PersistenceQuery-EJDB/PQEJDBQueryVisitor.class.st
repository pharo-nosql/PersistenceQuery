Class {
	#name : #PQEJDBQueryVisitor,
	#superclass : #PQVisitor,
	#category : #'PersistenceQuery-EJDB'
}

{ #category : #accessing }
PQEJDBQueryVisitor class >> label [

	^ #ejdb
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitComparisonCondition: aCondition [

	^ String streamContents: [ :stream |
		stream 
			<< (self visit: aCondition left)
			<< aCondition ejdbLabel
			<< (self visit: aCondition right) ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitField: aField [

	^ aField ejdbLabel
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitLogicalCondition: aCondition [

	^ String streamContents: [ :stream |
		stream 
			<< '(' << (self visit: aCondition conditions first) << ')'
			<< aCondition ejdbLabel
			<< '(' << (self visit: aCondition conditions second) << ')' ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitObject: anObject [

	^ anObject printString
]
