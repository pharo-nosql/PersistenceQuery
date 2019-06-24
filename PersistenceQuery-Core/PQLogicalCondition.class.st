"
A logical condition

Instance Variables
	conditions:		<Object>

conditions
	- xxxxx

"
Class {
	#name : #PQLogicalCondition,
	#superclass : #PQCondition,
	#instVars : [
		'conditions'
	],
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'instance creation' }
PQLogicalCondition class >> condition: aCondition [
	^ self new
		condition: aCondition;
		yourself
]

{ #category : #'instance creation' }
PQLogicalCondition class >> conditions: aCollection [
	^ self new
		conditions: aCollection;
		yourself
]

{ #category : #accessing }
PQLogicalCondition >> conditions [
	^ conditions
]

{ #category : #accessing }
PQLogicalCondition >> conditions: aCollection [
	conditions := aCollection
]

{ #category : #visiting }
PQLogicalCondition >> pqAccept: aVisitor [
	^ aVisitor visitLogicalCondition: self
]
