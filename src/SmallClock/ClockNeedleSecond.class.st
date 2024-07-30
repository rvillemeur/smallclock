Class {
	#name : 'ClockNeedleSecond',
	#superclass : 'ClockPart',
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'accessing' }
ClockNeedleSecond class >> start [
	^self new start
]

{ #category : 'accessing' }
ClockNeedleSecond >> animate: elementCollection from: aCenter on: aTime [
	| currentPosition element newPosition |
	elementCollection isEmpty
		ifTrue: [ ^ nil ].
	element := elementCollection first.
	currentPosition := element center.
	newPosition := currentPosition
		+ ((aCenter - currentPosition) * self animationSpeed).
	element position: aCenter on: aTime .
	self
		animate: elementCollection allButFirst
		from: newPosition
		on: aTime.
]

{ #category : 'accessing' }
ClockNeedleSecond >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleSecondElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : 'accessing' }
ClockNeedleSecond >> label [
	^ '.....' asOrderedCollection 

]

{ #category : 'accessing' }
ClockNeedleSecond >> position: aCircleCenter on: time [
	self
		animate: elements
		from: aCircleCenter
		on: time
]

{ #category : 'accessing' }
ClockNeedleSecond >> radius [ 
	^ 10

]
