Class {
	#name : #PQEJDBQueryVisitor,
	#superclass : #PQVisitor,
	#category : #'PersistenceQuery-EJDB'
}

{ #category : #accessing }
PQEJDBQueryVisitor class >> label [

	^ #ejdb
]

{ #category : #convenience }
PQEJDBQueryVisitor >> encodeCharacter: char on: writeStream [

	char = $" ifTrue: [ writeStream nextPut: $\ ].
	writeStream nextPut: char
]

{ #category : #convenience }
PQEJDBQueryVisitor >> encodeString: aString [

	^ String streamContents: [ :stream |
		stream nextPut: $".
		aString do: [ :each |
			self encodeCharacter: each on: stream ].
		stream nextPut: $". ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitComparisonCondition: aCondition [

	^ String streamContents: [ :stream |
		stream 
			<< (self visit: aCondition left)
			<< aCondition ejdbLabel
			<< (self visit: aCondition right) ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitField: aField [

	^ aField ejdbLabel
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitLogicalCondition: aCondition [

	^ String streamContents: [ :stream |
		stream 
			<< '(' << (self visit: aCondition conditions first) << ')'
			<< ' ' << aCondition ejdbLabel << ' '
			<< '(' << (self visit: aCondition conditions second) << ')' ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitObject: anObject [

	^ anObject isString
		ifTrue: [ self encodeString: anObject ]
		ifFalse: [ anObject printString ]
]

{ #category : #visiting }
PQEJDBQueryVisitor >> visitQuery: aQuery [

	^ String streamContents: [ :stream |
		stream 
			<< '/['
			<< (super visitQuery: aQuery)
			<< ']' ]
]
