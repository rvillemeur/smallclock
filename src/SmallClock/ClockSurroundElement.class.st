Class {
	#name : #ClockSurroundElement,
	#superclass : #Object,
	#instVars : [
		'center',
		'radian',
		'radius',
		'label'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockSurroundElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element split |
	element := self new.
	split := element circleSplit: numberOfElement.
	element
		label: aLetter;
		radius: circleRadius;
		radian: (element arcRadians: elementPosition on: split).
	^ element
]

{ #category : #positioning }
ClockSurroundElement >> arcRadians: index on: circleSplit [
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

{ #category : #positioning }
ClockSurroundElement >> circleSplit: numberOfElement [
	^ Float twoPi / numberOfElement
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
ClockSurroundElement >> position: aPoint [
	|xPosition yPosition|
	xPosition := self xCartesianCoordinateFrom: radius and: radian .
	yPosition := self yCartesianCoordinateFrom: radius and: radian.
	label position: xPosition @ yPosition + aPoint
	
]

{ #category : #accessing }
ClockSurroundElement >> radian [
	^ radian
]

{ #category : #accessing }
ClockSurroundElement >> radian: anObject [
	radian := anObject
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
