"
SUnit test for MQQuery

Instance Variables
	collection:		<Object>
	database:		<Object>
	root:		<Object>

collection
	- xxxxx

database
	- xxxxx

root
	- xxxxx

"
Class {
	#name : #PQQueryTest,
	#superclass : #TestCase,
	#instVars : [
		'collection',
		'root',
		'database'
	],
	#category : #'PersistenceQuery-Tests'
}

{ #category : #running }
PQQueryTest >> setUp [
	root := Mongo default.
	root open.
	database := root databaseNamed: 'test'.
	collection := database addCollection: 'testCollection'
]

{ #category : #running }
PQQueryTest >> tearDown [
	collection drop.
	root close
]

{ #category : #tests }
PQQueryTest >> testAnd [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; at: 'key2' put: 2; yourself).
	collection add: (Dictionary new at: 'key1' put: '1'; at: 'key2' put: 3; yourself).
	selected := collection select: [ :each | (each key1 = 1) & (each key2 = 2)] .
	self assert: selected size equals: 1
]

{ #category : #tests }
PQQueryTest >> testAndNot [
	| selected block |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 2;  yourself).
	collection add: (Dictionary new at: 'key1' put: 3; at: 'key2' put: 2; yourself).
	collection add: (Dictionary new at: 'key1' put: 4;  yourself).
	collection add: (Dictionary new at: 'key1' put: 5;  yourself).
	collection add: (Dictionary new at: 'key1' put: 6;  yourself).
	
	block := [ :each | ((each key1 = 3) & (each key2 = 2) & (each key1 = 5)) not ].
	
	self assert: (collection select: block) size equals: 4
]

{ #category : #tests }
PQQueryTest >> testAt [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 'value1'; yourself).
	collection add: (Dictionary new at: 'key2' put: 'value2'; yourself).
	
	selected := collection detect: [ :each | (each at: #key1) = 'value1'].
	self assert: (selected at: 'key1') equals: 'value1'.
	
	selected := collection detect: [ :each | (each at: 'key1') = 'value1'].
	self assert: (selected at: 'key1') equals: 'value1'
]

{ #category : #tests }
PQQueryTest >> testComparison [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 2;  yourself).
	collection add: (Dictionary new at: 'key1' put: 3;  yourself).
	collection add: (Dictionary new at: 'key1' put: 4;  yourself).
	collection add: (Dictionary new at: 'key1' put: 5;  yourself).
	collection add: (Dictionary new at: 'key1' put: 6;  yourself).
	
	selected := collection select: [ :each | each key1 = 2 ] .
	self assert: selected size equals: 1.
	
	selected := collection select: [ :each | each key1 > 2 ] .
	self assert: selected size equals: 4.
	
	selected := collection select: [ :each | each key1 >= 2 ] .
	self assert: selected size equals: 5.
	
	selected := collection select: [ :each | each key1 < 2 ] .
	self assert: selected size equals: 1.
	
	selected := collection select: [ :each | each key1 <= 2 ] .
	self assert: selected size equals: 2.
	
	selected := collection select: [ :each | each key1 ~= 2 ] .
	self assert: selected size equals: 5.
]

{ #category : #tests }
PQQueryTest >> testDetect [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 'value1'; yourself).
	collection add: (Dictionary new at: 'key2' put: 'value2'; yourself).
	selected := collection detect: [ :each | each key1 = 'value1'].
	self assert: (selected at: 'key1') equals: 'value1'
]

{ #category : #tests }
PQQueryTest >> testMatchesRegex [
	collection add: (Dictionary new at: 'key1' put: 'hello';  yourself).
	
	self assert: (collection select: [ :each | each key1 matchesRegex: '^hel']) size equals: 1.
	self assert: (collection select: [ :each | each key1 matchesRegex: '^hel$']) size equals: 0. 
]

{ #category : #tests }
PQQueryTest >> testNestedQueries [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 2;  yourself).
	collection add: (Dictionary new at: 'key1' put: 3; at: 'key2' put: 2; yourself).
	collection add: (Dictionary new at: 'key1' put: 4;  yourself).
	collection add: (Dictionary new at: 'key1' put: 5;  yourself).
	collection add: (Dictionary new at: 'key1' put: 6;  yourself).
	self halt.
	selected := collection select: [ :each | 
		(each key1 = 1) | (each key1 = 3) | (each key1 = 5)] .
	self assert: selected size equals: 3.
	
	selected := collection select: [ :each | 
		(each key1 = 1) | (each key1 = 3) & (each key2 = 2)] .
	self assert: selected size equals: 1
]

{ #category : #tests }
PQQueryTest >> testNor [
	| selected block |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 2;  yourself).
	collection add: (Dictionary new at: 'key1' put: 3; at: 'key2' put: 2; yourself).
	collection add: (Dictionary new at: 'key1' put: 4;  yourself).
	collection add: (Dictionary new at: 'key1' put: 5;  yourself).
	collection add: (Dictionary new at: 'key1' put: 6;  yourself).
	
	block := [ :each | ((each key1 = 1) | (each key1 = 3) | (each key1 = 5)) not ].
	self assert: block asPersistenceQuery keys first equals: PQNorCondition new label.
	
	self assert: (collection select: block) size equals: 3
]

{ #category : #tests }
PQQueryTest >> testNot [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 2;  yourself).
	collection add: (Dictionary new at: 'key1' put: 3;  yourself).
	
	self flag: #todo. "error: not yet implemented?"
"	selected := collection select: [ :each | (each key1 > 1) not ].
	self assert: selected size equals: 1."
	
	selected := collection select: [ :each | (each key1 = 1) not ].
	self assert: selected size equals: 2.
]

{ #category : #tests }
PQQueryTest >> testOr [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; at: 'key2' put: 2; yourself).
	collection add: (Dictionary new at: 'key1' put: '1'; at: 'key2' put: 3; yourself).
	selected := collection select: [ :each | (each key1 = 1) | (each key2 = 3)] .
	self assert: selected size equals: 2
]

{ #category : #tests }
PQQueryTest >> testSelect [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 'value1'; yourself).
	collection add: (Dictionary new at: 'key2' put: 'value2'; yourself).
	selected := collection select: [ :each | each key1 = 'value1'].
	self assert: selected size equals: 1
]

{ #category : #tests }
PQQueryTest >> testSize [
	| selected |
	collection add: (Dictionary new at: 'key1' put: #(1 2 3 4 5); yourself).
	collection add: (Dictionary new at: 'key1' put: 'hello';  yourself).
	
	self assert: (collection select: [ :each | each key1 size = 5 ]) size equals: 1.
	self should: [ collection select: [ :each | each key1 size =  'string' ] ] raise: PQQueryError 
]

{ #category : #tests }
PQQueryTest >> testType [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 1; yourself).
	collection add: (Dictionary new at: 'key1' put: 'hello';  yourself).
	
	self assert: (collection select: [ :each | each key1 type = 16 ]) size equals: 1.
	self should: [ collection select: [ :each | each key1 type =  'string' ] ] raise: PQQueryError 
]

{ #category : #tests }
PQQueryTest >> testWhere [
	| selected |
	collection add: (Dictionary new at: 'key1' put: 'value1'; yourself).
	collection add: (Dictionary new at: 'key2' put: 'value2'; yourself).
	selected := collection detect: [ :each | each where: 'this.key1 = "value1"'].
	self assert: (selected at: 'key1') equals: 'value1'
]
