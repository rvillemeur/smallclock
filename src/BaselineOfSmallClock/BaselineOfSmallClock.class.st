Class {
	#name : #BaselineOfSmallClock,
	#superclass : #Object,
	#category : #BaselineOfSmallClock
}

{ #category : #baselines }
BaselineOfSmallClock >> baseline: spec [ 
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'SmallClock';
				package: 'SmallClock-Tests' with: [ spec requires: 'SmallClock' ]  ]


]