"
A NOT condition

Instance Variables
	condition:		<Object>

condition
	- xxxxx

"
Class {
	#name : #PQNotCondition,
	#superclass : #PQCondition,
	#instVars : [
		'condition'
	],
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'instance creation' }
PQNotCondition class >> condition: aCondition [
	^ self new
		condition: aCondition;
		yourself
]

{ #category : #accessing }
PQNotCondition >> condition [
	^ condition
]

{ #category : #accessing }
PQNotCondition >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
PQNotCondition >> label [
	^ '$not'
]

{ #category : #visiting }
PQNotCondition >> pqAccept: aVisitor [
	^ aVisitor visitNotCondition: self
]
