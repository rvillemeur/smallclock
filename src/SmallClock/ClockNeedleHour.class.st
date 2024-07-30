Class {
	#name : 'ClockNeedleHour',
	#superclass : 'ClockPart',
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'accessing' }
ClockNeedleHour class >> start [
	^self new start
]

{ #category : 'accessing' }
ClockNeedleHour >> animate: elementCollection from: aCenter on: aTime [
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
ClockNeedleHour >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleHourElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : 'accessing' }
ClockNeedleHour >> label [
	^ '...' asOrderedCollection 

]

{ #category : 'accessing' }
ClockNeedleHour >> position: aCircleCenter on: time [
	self
		animate: elements
		from: aCircleCenter
		on: time
]

{ #category : 'accessing' }
ClockNeedleHour >> radius [ 
	^ 10

]
