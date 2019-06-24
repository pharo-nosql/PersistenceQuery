"
A where condition

Instance Variables
	javascript:		<Object>

javascript
	- xxxxx

"
Class {
	#name : #PQWhereCondition,
	#superclass : #PQCondition,
	#instVars : [
		'javascript'
	],
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'instance creation' }
PQWhereCondition class >> javascript: aString [
	^ self new
		javascript: aString;
		yourself
]

{ #category : #accessing }
PQWhereCondition >> javascript [
	^ javascript
]

{ #category : #accessing }
PQWhereCondition >> javascript: anObject [
	javascript := anObject
]

{ #category : #accessing }
PQWhereCondition >> label [
	^ '$where'
]

{ #category : #visiting }
PQWhereCondition >> pqAccept: aVisitor [
	^ aVisitor visitWhereCondition: self
]
