Class {
	#name : #ClockNeedleSecondElement,
	#superclass : #Object,
	#instVars : [
		'center',
		'index',
		'radius',
		'label'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecondElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleSecondElement >> arcRadiansOn: time [
	^ Float pi * time second / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleSecondElement >> center [
	^ center
]

{ #category : #accessing }
ClockNeedleSecondElement >> center: anObject [
	center := anObject
]

{ #category : #accessing }
ClockNeedleSecondElement >> index [
	^ index
]

{ #category : #accessing }
ClockNeedleSecondElement >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClockNeedleSecondElement >> label [
	^ 	label

]

{ #category : #accessing }
ClockNeedleSecondElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockNeedleSecondElement >> position: aCircleCenter on: time [
	|xPosition yPosition radian|
	radian := self arcRadiansOn: time .
	xPosition := (self xCartesianCoordinateFrom: radius and: radian) * (index - 1).
	yPosition := (self yCartesianCoordinateFrom: radius and: radian) * (index - 1).
	label position: xPosition @ yPosition + aCircleCenter
]

{ #category : #positioning }
ClockNeedleSecondElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockNeedleSecondElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockNeedleSecondElement >> radius: anObject [
	radius := anObject
]

{ #category : #creation }
ClockNeedleSecondElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockNeedleSecondElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockNeedleSecondElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockNeedleSecondElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
