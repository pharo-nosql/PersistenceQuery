"
A visitor to build queries
"
Class {
	#name : #PQVisitor,
	#superclass : #Object,
	#category : #'PersistenceQuery-Core-Utilities'
}

{ #category : #'instance creation' }
PQVisitor class >> withName: aString [ 
	^ self subclasses detect: [ :each | each label = aString ]
]

{ #category : #visiting }
PQVisitor >> visit: anObject [
	^ anObject pqAccept: self
]

{ #category : #visiting }
PQVisitor >> visitComparisonCondition: aMQCondition [
	^ self visitCondition: aMQCondition
]

{ #category : #visiting }
PQVisitor >> visitCondition: aMQCondition [
	^ self visitNode: aMQCondition
]

{ #category : #visiting }
PQVisitor >> visitEqualCondition: aMQCondition [
	^ self visitComparisonCondition: aMQCondition
]

{ #category : #visiting }
PQVisitor >> visitField: aField [
	^ self visitNode: aField
]

{ #category : #visiting }
PQVisitor >> visitLogicalCondition: aLogicalCondition [
	^ self visitCondition: aLogicalCondition 
]

{ #category : #visiting }
PQVisitor >> visitNode: aMQNode [
	^ self visitObject: aMQNode
]

{ #category : #visiting }
PQVisitor >> visitNotCondition: aMQNotCondition [
	^ self visitCondition: aMQNotCondition
]

{ #category : #visiting }
PQVisitor >> visitObject: anObject [
]

{ #category : #visiting }
PQVisitor >> visitWhereCondition: aWhereCondition [
	^ self visitCondition: aWhereCondition 
]
