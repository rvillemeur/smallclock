Class {
	#name : #ClockNeedleSecond,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleSecond >> arcRadians: time [
"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"
	^ (Float pi * time second) / 30 - Float halfPi  
]

{ #category : #accessing }
ClockNeedleSecond >> circleX: radians [
	^ self radius * (radians cos).
]

{ #category : #accessing }
ClockNeedleSecond >> circleY: radians [
	^ self radius * (radians sin).
]

{ #category : #accessing }
ClockNeedleSecond >> elements [
	^ elements
]

{ #category : #accessing }
ClockNeedleSecond >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #initialization }
ClockNeedleSecond >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedleSecond >> label [
	^ '. . . . .' findTokens: ' '

]

{ #category : #accessing }
ClockNeedleSecond >> position: aPoint [
1 to: (elements size) do: [ :index | self updatePoint: (elements at: index) index: index to: aPoint ].

]

{ #category : #accessing }
ClockNeedleSecond >> radius [ 
	^ 1

]

{ #category : #accessing }
ClockNeedleSecond >> start [
	self elements do: [ :element | element comeToFront openInWorld ].
]

{ #category : #accessing }
ClockNeedleSecond >> stop [
	elements do: [ :element | element delete ]
]

{ #category : #'as yet unclassified' }
ClockNeedleSecond >> updatePoint: aStringMorph index: elementIndex to: aPoint [
	|xPosition yPosition time|
	time := DateAndTime now.
	xPosition := (self circleX: (self arcRadians: time)) - (2.7 * elementIndex).
	yPosition := (self circleY: (self arcRadians: time)) - (7 * elementIndex).
	aStringMorph position: xPosition @ yPosition + aPoint.
]
