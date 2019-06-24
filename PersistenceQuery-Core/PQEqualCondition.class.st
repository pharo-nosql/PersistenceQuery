"
Check for equal
"
Class {
	#name : #PQEqualCondition,
	#superclass : #PQComparisonCondition,
	#category : #'PersistenceQuery-Core-Nodes-Conditions'
}

{ #category : #accessing }
PQEqualCondition >> label [
	^ '='
]

{ #category : #'logical operation' }
PQEqualCondition >> not [
	"see http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-Metaoperator%3A{{%24not}}"
	
	^ PQNotEqualCondition left: self left right: self right
]

{ #category : #visiting }
PQEqualCondition >> pqAccept: aVisitor [
	^ aVisitor visitEqualCondition: self
]
