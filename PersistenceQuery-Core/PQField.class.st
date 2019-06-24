"
A field 

Instance Variables
	label:		<Object>

label
	- xxxxx

"
Class {
	#name : #PQField,
	#superclass : #PQNode,
	#instVars : [
		'label'
	],
	#category : #'PersistenceQuery-Core-Nodes-Other'
}

{ #category : #'instance creation' }
PQField class >> labelled: aString [
	^ self new 
		initializeWithLabel: aString; 
		yourself
]

{ #category : #comparing }
PQField >> < anObject [
	^ PQLessThanCondition new
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
PQField >> <= anObject [
	^ PQLessThanEqualCondition new
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
PQField >> = anObject [
	^ PQEqualCondition new
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
PQField >> > anObject [
	^ PQGreaterThanCondition new
		left: self;
		right: anObject;
		yourself
]

{ #category : #comparing }
PQField >> >= anObject [
	^ PQGreaterThanEqualCondition new
		left: self;
		right: anObject;
		yourself
]

{ #category : #testing }
PQField >> in: aCollection [
	^ PQInCondition new
		left: self;
		right: aCollection;
		yourself
]

{ #category : #testing }
PQField >> includes: anObject [
	"Mongo doesn't use any special query for values in arrays"
	
	^ self = anObject
]

{ #category : #initialization }
PQField >> initializeWithLabel: aString [
	label := aString
]

{ #category : #accessing }
PQField >> label [
	^ label
]

{ #category : #comparing }
PQField >> matchesRegex: aRegExString [
	^ PQRegexCondition new
		left: self;
		right: aRegExString;
		yourself
]

{ #category : #testing }
PQField >> notIn: aCollection [
	^ PQNotInCondition new
		left: self;
		right: aCollection;
		yourself
]

{ #category : #visiting }
PQField >> pqAccept: aVisitor [
	^ aVisitor visitField: self
]

{ #category : #testing }
PQField >> size [
	^ PQSizeCondition
		new  left: self
]

{ #category : #testing }
PQField >> type [
	^ PQTypeCondition
		new  left: self
]

{ #category : #testing }
PQField >> where: aString [
	^ PQWhereCondition new
		javascript: aString;
		yourself
]

{ #category : #comparing }
PQField >> ~= anObject [
	^ PQNotEqualCondition new
		left: self;
		right: anObject;
		yourself
]
