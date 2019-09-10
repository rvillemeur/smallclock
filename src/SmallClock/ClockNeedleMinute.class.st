Class {
	#name : #ClockNeedleMinute,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleMinute class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleMinute >> animate: elementCollection index: index from: aCenter on: aTime [
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

{ #category : #accessing }
ClockNeedleMinute >> label [
	^ '....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleMinute >> position: aCircleCenter on: time [
	self
		animate: elements
		index: 1
		from: aCircleCenter
		on: time
]

{ #category : #accessing }
ClockNeedleMinute >> radius [ 
	^ 10

]
