"
A mongo query node
"
Class {
	#name : #PQNode,
	#superclass : #Object,
	#category : #'PersistenceQuery-Core-Nodes-Other'
}

{ #category : #accessing }
PQNode >> label [
	self subclassResponsibility 
]

{ #category : #visiting }
PQNode >> pqAccept: aVisitor [
	^ aVisitor visitNode: self
]
