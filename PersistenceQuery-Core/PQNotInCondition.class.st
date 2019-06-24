"
Check for not in (excluded)
"
Class {
	#name : #PQNotInCondition,
	#superclass : #PQComparisonCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #accessing }
PQNotInCondition >> label [
	^ '$nin'
]
