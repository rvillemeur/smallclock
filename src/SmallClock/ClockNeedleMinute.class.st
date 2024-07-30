Class {
	#name : 'ClockNeedleMinute',
	#superclass : 'ClockPart',
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'accessing' }
ClockNeedleMinute class >> start [
	^self new start
]

{ #category : 'accessing' }
ClockNeedleMinute >> animate: elementCollection from: aCenter on: aTime [
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
ClockNeedleMinute >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleMinuteElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : 'accessing' }
ClockNeedleMinute >> label [
	^ '....' asOrderedCollection 

]

{ #category : 'accessing' }
ClockNeedleMinute >> position: aCircleCenter on: time [
	self
		animate: elements
		from: aCircleCenter
		on: time
]

{ #category : 'accessing' }
ClockNeedleMinute >> radius [ 
	^ 10

]
