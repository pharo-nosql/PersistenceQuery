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
	#category : #'PersistenceQuery-Core-Building'
}

{ #category : #'instance creation' }
PQQueryBuilder class >> queryFor: aBlock [
	^ self new buildQueryFor: aBlock
]

{ #category : #building }
PQQueryBuilder >> buildQueryFor: aBlock [
	^ self newGenerator visit: (aBlock value: self newQuery)
]

{ #category : #accessing }
PQQueryBuilder >> generator: aClass [ 
	generatorClass := aClass
]

{ #category : #factory }
PQQueryBuilder >> newGenerator [
	^ generatorClass new
]

{ #category : #factory }
PQQueryBuilder >> newQuery [
	^ PQQuery new
]
