"
I represent the clock surround of clock face, with number from 1 to 12.
With my latest incantation, I have switch to roman number representation.

"
Class {
	#name : #ClockSurround,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockSurround class >> start [
	^self new start
]

{ #category : #accessing }
ClockSurround >> animate: elementCollection index: index from: aCenter [
	| currentPosition element newPosition |
	elementCollection isEmpty
		ifTrue: [ ^ nil ].
	element := elementCollection first.
	currentPosition := element center.
	newPosition := currentPosition
		+ ((aCenter - currentPosition) * self animationSpeed).
	element position: aCenter.
	self
		animate: elementCollection allButFirst
		index: index + 1
		from: newPosition

]

{ #category : #accessing }
ClockSurround >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockSurroundElement
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : #accessing }
ClockSurround >> label [
	^ 'I II III IV V VI VII VIII IX X XI XII' findTokens: ' '

]

{ #category : #accessing }
ClockSurround >> position: aCircleCenter [
	self animate: elements index: 1 from: aCircleCenter
]

{ #category : #accessing }
ClockSurround >> radius [ 
	^ 48

]
