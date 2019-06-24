"
A mongo query

Instance Variables
	label:		<Object>

label
	- xxxxx

"
Class {
	#name : #PQQuery,
	#superclass : #Object,
	#instVars : [
		'label'
	],
	#category : #'PersistenceQuery-Core-Base'
}

{ #category : #accessing }
PQQuery >> at: aString [
	^ self fieldNamed: aString asString
]

{ #category : #forwarding }
PQQuery >> doesNotUnderstand: aMessage [
	^ aMessage selector isUnary
		ifTrue: [ self at: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #accessing }
PQQuery >> fieldNamed: aString [
	^ PQField labelled: aString
]

{ #category : #forwarding }
PQQuery >> name [
	^ self at: 'name'
]

{ #category : #accessing }
PQQuery >> where: aString [
	^ PQWhereCondition javascript: aString
]
