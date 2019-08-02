Class {
	#name : #ClockSurround,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockSurround class >> start [
	^self new start

]

{ #category : #accessing }
ClockSurround >> arcRadians: index [
"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"
	^ (self circleSplit) * index - Float halfPi  
]

{ #category : #accessing }
ClockSurround >> circleSplit [
	^ Float twoPi / (self label size) 
]

{ #category : #accessing }
ClockSurround >> circleX: radians [
	^ self radius * (radians cos).
]

{ #category : #accessing }
ClockSurround >> circleY: radians [
	^ self radius * (radians sin).
]

{ #category : #accessing }
ClockSurround >> elements [
	^ elements
]

{ #category : #accessing }
ClockSurround >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #initialization }
ClockSurround >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockSurround >> label [
	^ '1 2 3 4 5 6 7 8 9 10 11 12' findTokens: ' '

]

{ #category : #accessing }
ClockSurround >> position: aPoint [
1 to: (elements size) do: [ :index | self updatePoint: (elements at: index) index: index to: aPoint ].

]

{ #category : #accessing }
ClockSurround >> radius [ 
	^ 40

]

{ #category : #accessing }
ClockSurround >> start [
	self elements do: [ :element | element comeToFront openInWorld ].
]

{ #category : #accessing }
ClockSurround >> stop [
	elements do: [ :element | element delete ]
]

{ #category : #'as yet unclassified' }
ClockSurround >> updatePoint: aStringMorph index: elementIndex to: aPoint [
	|xPosition yPosition|
	xPosition := self circleX: (self arcRadians: elementIndex).
	yPosition := self circleY: (self arcRadians: elementIndex).
	aStringMorph position: xPosition @ yPosition + aPoint.
]
