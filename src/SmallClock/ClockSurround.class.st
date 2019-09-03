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
	elements
		withIndexDo:
			[ :element :index | self updateElementPosition: element atIndex: index to: aPoint ]
]

{ #category : #accessing }
ClockSurround >> radius [ 
	^ 48

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
ClockSurround >> updateElementPosition: aStringMorph atIndex: elementIndex to: aPoint [
	| xPosition yPosition radian |
	radian := self arcRadians: elementIndex.
	xPosition := self xCartesianCoordinateFrom: self radius and: radian.
	yPosition := self yCartesianCoordinateFrom: self radius and: radian.
	aStringMorph position: xPosition @ yPosition + aPoint
]

{ #category : #accessing }
ClockSurround >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #accessing }
ClockSurround >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
