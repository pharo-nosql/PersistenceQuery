"
Selects the documents where the value of the field is an instance of the specified numeric BSON type
"
Class {
	#name : #PQTypeCondition,
	#superclass : #PQComparisonCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #comparing }
PQTypeCondition >> = anInteger [
	anInteger isInteger ifFalse: [ PQQueryError signal: 'BSON type must be an Integer'].
	
	self right: anInteger
]

{ #category : #accessing }
PQTypeCondition >> label [
	^ '$type'
]
