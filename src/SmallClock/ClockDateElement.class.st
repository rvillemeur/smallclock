Class {
	#name : #ClockDateElement,
	#superclass : #Object,
	#instVars : [
		'center',
		'index',
		'radius',
		'label',
		'rotation',
		'circleSplit'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockDateElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element circleSplit: numberOfElement.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockDateElement >> arcRadians [
	^ circleSplit * index + self radianOffset
]

{ #category : #accessing }
ClockDateElement >> center [
	^ center
]

{ #category : #accessing }
ClockDateElement >> center: anObject [
	center := anObject
]

{ #category : #positioning }
ClockDateElement >> circleSplit: numberOfElement [
	circleSplit := Float twoPi / numberOfElement.
	^ self
]

{ #category : #accessing }
ClockDateElement >> index [
	^ index
]

{ #category : #accessing }
ClockDateElement >> index: anObject [
	index := anObject
]

{ #category : #creation }
ClockDateElement >> initialize [
	rotation := 0.
	^ self
]

{ #category : #accessing }
ClockDateElement >> label [
	^ label
]

{ #category : #accessing }
ClockDateElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockDateElement >> position: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians.
	xPosition := self xCartesianCoordinateFrom: radius and: (radian - rotation) .
	yPosition := self yCartesianCoordinateFrom: radius and: (radian - rotation).
	rotation := rotation + self speed.
	label position: xPosition @ yPosition + aPoint
]

{ #category : #positioning }
ClockDateElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockDateElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockDateElement >> radius: anObject [
	radius := anObject
]

{ #category : #accessing }
ClockDateElement >> rotation [
	^ rotation
]

{ #category : #accessing }
ClockDateElement >> rotation: anObject [
	rotation := anObject
]

{ #category : #creation }
ClockDateElement >> speed [
	^ 0.06


]

{ #category : #creation }
ClockDateElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockDateElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockDateElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockDateElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
