"
An AND condition
"
Class {
	#name : #PQAndCondition,
	#superclass : #PQLogicalCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'logical operation' }
PQAndCondition >> & aCondition [
	^ PQAndCondition conditions: self conditions, { aCondition }
]

{ #category : #accessing }
PQAndCondition >> label [
	^ '$and'
]

{ #category : #'logical operation' }
PQAndCondition >> not [
	^ self copy 
		conditions: (self conditions collect: [ :each | each not ]);
		yourself
]
