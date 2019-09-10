Class {
	#name : #ClockNeedleSecond,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleSecond >> animate: elementCollection index: index from: aCenter on: aTime [
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
		index: index + 1
		from: newPosition
		on: aTime.
]

{ #category : #accessing }
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

{ #category : #accessing }
ClockNeedleSecond >> label [
	^ '.....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleSecond >> position: aCircleCenter on: time [
	self
		animate: elements
		index: 1
		from: aCircleCenter
		on: time
]

{ #category : #accessing }
ClockNeedleSecond >> radius [ 
	^ 10

]
