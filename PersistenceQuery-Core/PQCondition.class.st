"
A mongo query condition
"
Class {
	#name : #PQCondition,
	#superclass : #PQNode,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #'logical operation' }
PQCondition >> & aCondition [
	^ PQAndCondition 
		conditions: (Array with: self with: aCondition)
]

{ #category : #'logical operation' }
PQCondition >> not [
	^ PQNotCondition condition: self
]

{ #category : #visiting }
PQCondition >> pqAccept: aVisitor [
	^ aVisitor visitCondition: self
]

{ #category : #'logical operation' }
PQCondition >> | aCondition [
	^ PQOrCondition 
		conditions: (Array with: self with: aCondition)
]
