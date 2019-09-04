"
Each elements (date, surround, needles) are part of a circle, and know their specific radius, their center, as well as their position index inside their label. 

For exemple, in the surround, '3' has the 3rd index, associated with its circle center position, and its radius
"
Class {
	#name : #ClockElement,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #'as yet unclassified' }
ClockElement >> animate: elementCollection index: index from: aPoint [
	| currentPosition element newPosition |
	elementCollection isEmpty
		ifTrue: [ ^ nil ].
	element := elementCollection first.
	currentPosition := element position.
	newPosition := currentPosition
		+ ((aPoint - currentPosition) * self animationSpeed).
	self updatePositionOf: element atIndex: index to: aPoint.
	self
		animate: elementCollection allButFirst
		index: index + 1
		from: newPosition
]

{ #category : #accessing }
ClockElement >> animationSpeed [
	^ 0.6
]

{ #category : #accessing }
ClockElement >> arcRadians: index [ 
	^ self subclassResponsibility
]

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
ClockElement >> elementsPositions: aPoint [
	"self animate: elements index: 1 from: aPoint"
	elements
		withIndexDo:
			[ :element :index | self updatePositionOf: element atIndex: index to: aPoint ]
]

{ #category : #accessing }
ClockElement >> label [
	^ self subclassResponsibility
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
ClockElement >> updatePositionOf: anElement atIndex: elementIndex to: center [
	| xPosition yPosition radian |
	radian := self arcRadians: elementIndex.
	xPosition := self xCartesianCoordinateFrom: self radius and: radian .
	yPosition := self yCartesianCoordinateFrom: self radius and: radian.
	anElement position: xPosition @ yPosition + center
]

{ #category : #accessing }
ClockElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #accessing }
ClockElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
