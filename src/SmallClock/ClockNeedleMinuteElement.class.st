Class {
	#name : #ClockNeedleMinuteElement,
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
ClockNeedleMinuteElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleMinuteElement >> arcRadiansOn: time [
	^ Float pi * time minute / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleMinuteElement >> center [
	^ center
]

{ #category : #accessing }
ClockNeedleMinuteElement >> center: anObject [
	center := anObject
]

{ #category : #accessing }
ClockNeedleMinuteElement >> index [
	^ index
]

{ #category : #accessing }
ClockNeedleMinuteElement >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClockNeedleMinuteElement >> label [
	^ 	label

]

{ #category : #accessing }
ClockNeedleMinuteElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockNeedleMinuteElement >> position: aCircleCenter on: time [
	|xPosition yPosition radian|
	radian := self arcRadiansOn: time .
	xPosition := (self xCartesianCoordinateFrom: radius and: radian) * (index - 1).
	yPosition := (self yCartesianCoordinateFrom: radius and: radian) * (index - 1).
	label position: xPosition @ yPosition + aCircleCenter
]

{ #category : #positioning }
ClockNeedleMinuteElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockNeedleMinuteElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockNeedleMinuteElement >> radius: anObject [
	radius := anObject
]

{ #category : #creation }
ClockNeedleMinuteElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockNeedleMinuteElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockNeedleMinuteElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockNeedleMinuteElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
