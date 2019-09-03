Class {
	#name : #ClockElement,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockElement >> circleSplit [
	^ Float twoPi / (self label size) 
]

{ #category : #accessing }
ClockElement >> elements [
	^ elements
]

{ #category : #accessing }
ClockElement >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #accessing }
ClockElement >> position: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
ClockElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1


]

{ #category : #accessing }
ClockElement >> radius [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClockElement >> start [
	self elements do: [ :element | element comeToFront openInWorld ].


]

{ #category : #accessing }
ClockElement >> stop [
	elements do: [ :element | element delete ]


]

{ #category : #accessing }
ClockElement >> updateElementPosition: aStringMorph atIndex: elementIndex to: aPoint [
	| xPosition yPosition radian |
	radian := self arcRadians: elementIndex.
	xPosition := self xCartesianCoordinateFrom: self radius and: radian .
	yPosition := self yCartesianCoordinateFrom: self radius and: radian.
	aStringMorph position: xPosition @ yPosition + aPoint
]

{ #category : #accessing }
ClockElement >> updateElementsPositions: aPoint [
	elements
		withIndexDo:
			[ :element :index | self updateElementPosition: element atIndex: index to: aPoint ]
]

{ #category : #accessing }
ClockElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #accessing }
ClockElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
