Class {
	#name : #ClockSurroundElement,
	#superclass : #Object,
	#instVars : [
		'center',
		'index',
		'radius',
		'label',
		'circleSplit'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockSurroundElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
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
ClockSurroundElement >> arcRadians [
	^ circleSplit * index + self radianOffset
]

{ #category : #accessing }
ClockSurroundElement >> center [
	^ center
]

{ #category : #accessing }
ClockSurroundElement >> center: anObject [
	center := anObject
]

{ #category : #accessing }
ClockSurroundElement >> circleSplit [
	^ circleSplit
]

{ #category : #positioning }
ClockSurroundElement >> circleSplit: numberOfElement [
	circleSplit := Float twoPi / numberOfElement.
	^ self
]

{ #category : #accessing }
ClockSurroundElement >> index [
	^ index
]

{ #category : #accessing }
ClockSurroundElement >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClockSurroundElement >> label [
	^ label
]

{ #category : #accessing }
ClockSurroundElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockSurroundElement >> position: aCircleCenter [
	|xPosition yPosition radian|
	radian := self arcRadians.
	xPosition := self xCartesianCoordinateFrom: radius and: radian .
	yPosition := self yCartesianCoordinateFrom: radius and: radian.
	label position: xPosition @ yPosition + aCircleCenter
	
]

{ #category : #positioning }
ClockSurroundElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockSurroundElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockSurroundElement >> radius: anObject [
	radius := anObject
]

{ #category : #creation }
ClockSurroundElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockSurroundElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockSurroundElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockSurroundElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
