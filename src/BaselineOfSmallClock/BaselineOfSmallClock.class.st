Class {
	#name : #BaselineOfSmallClock,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallClock
}

{ #category : #baselines }
BaselineOfSmallClock >> baseline: spec [ 
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'SmallClock' ]


]
