Class {
	#name : #BaselineOfPersistenceQuery,
	#superclass : #BaselineOf,
	#category : #BaselineOfPersistenceQuery
}

{ #category : #baselines }
BaselineOfPersistenceQuery >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'PersistenceQuery-Core';
				package: 'PersistenceQuery-Tests' with: [ spec requires: #('PersistenceQuery-Core' 'Mocketry'). ].

			spec 
				baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x'. ].

			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('PersistenceQuery-Core');
				group: 'Tests' with: #('PersistenceQuery-Tests'). ]. 
]
