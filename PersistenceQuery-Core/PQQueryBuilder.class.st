"
Used to build a mongo query

Instance Variables
	label:		<Object>

label
	- xxxxx

"
Class {
	#name : #PQQueryBuilder,
	#superclass : #Object,
	#instVars : [
		'label',
		'generatorClass'
	],
	#classInstVars : [
		'generatorClass'
	],
	#category : #'PersistenceQuery-Core-Building'
}

{ #category : #accessing }
PQQueryBuilder class >> generatorClass [
	^ generatorClass
]

{ #category : #accessing }
PQQueryBuilder class >> generatorClass: anObject [
	generatorClass := anObject
]

{ #category : #'instance creation' }
PQQueryBuilder class >> queryFor: aBlock [
	^ self new buildQueryFor: aBlock
]

{ #category : #building }
PQQueryBuilder >> buildQueryFor: aBlock [
	^ self newGenerator visit: (aBlock value: self newQuery)
]

{ #category : #accessing }
PQQueryBuilder >> generatorClass [
	^ generatorClass ifNil: [ 
		generatorClass := self class generatorClass ]
]

{ #category : #accessing }
PQQueryBuilder >> generatorClass: anObject [
	generatorClass := anObject
]

{ #category : #factory }
PQQueryBuilder >> newGenerator [
	^ self generatorClass new
]

{ #category : #factory }
PQQueryBuilder >> newQuery [
	^ PQQuery new
]
