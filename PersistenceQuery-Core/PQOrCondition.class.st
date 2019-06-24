"
An OR condition
"
Class {
	#name : #PQOrCondition,
	#superclass : #PQLogicalCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #accessing }
PQOrCondition >> label [
	^ '$or'
]

{ #category : #'logical operation' }
PQOrCondition >> not [
	^ PQNorCondition conditions: self conditions
]

{ #category : #'logical operation' }
PQOrCondition >> | aCondition [
	^ PQOrCondition conditions: self conditions, { aCondition }
]
