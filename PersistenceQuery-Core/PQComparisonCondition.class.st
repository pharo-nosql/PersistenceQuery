"
Comparision condition

Instance Variables
	left:		<Object>
	right:		<Object>

left
	- xxxxx

right
	- xxxxx

"
Class {
	#name : #PQComparisonCondition,
	#superclass : #PQCondition,
	#instVars : [
		'left',
		'right'
	],
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'instance creation' }
PQComparisonCondition class >> left: aField right: anotherField [
	^ self new
		left: aField;
		right: anotherField;
		yourself
]

{ #category : #accessing }
PQComparisonCondition >> left [
	^ left
]

{ #category : #accessing }
PQComparisonCondition >> left: anObject [
	left := anObject
]

{ #category : #visiting }
PQComparisonCondition >> pqAccept: aVisitor [
	^ aVisitor visitComparisonCondition: self
]

{ #category : #accessing }
PQComparisonCondition >> right [
	^ right
]

{ #category : #accessing }
PQComparisonCondition >> right: anObject [
	right := anObject
]
