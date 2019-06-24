"
Matches any array with the number of elements 
"
Class {
	#name : #PQSizeCondition,
	#superclass : #PQComparisonCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #comparing }
PQSizeCondition >> = anInteger [
	anInteger isInteger ifFalse: [ PQQueryError signal: 'Array size must be an Integer'].
	
	self right: anInteger
]

{ #category : #accessing }
PQSizeCondition >> label [
	^ '$size'
]
