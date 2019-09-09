Class {
	#name : #ClockNeedleHourElement,
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
ClockNeedleHourElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleHourElement >> arcRadiansOn: time [
	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset + self radianOffset 
]

{ #category : #accessing }
ClockNeedleHourElement >> center [
	^ center
]

{ #category : #accessing }
ClockNeedleHourElement >> center: anObject [
	center := anObject
]

{ #category : #accessing }
ClockNeedleHourElement >> index [
	^ index
]

{ #category : #accessing }
ClockNeedleHourElement >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClockNeedleHourElement >> label [
	^ 	label

]

{ #category : #accessing }
ClockNeedleHourElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockNeedleHourElement >> position: aCircleCenter on: time [
	|xPosition yPosition radian|
	radian := self arcRadiansOn: time .
	xPosition := (self xCartesianCoordinateFrom: radius and: radian) * (index - 1).
	yPosition := (self yCartesianCoordinateFrom: radius and: radian) * (index - 1).
	label position: xPosition @ yPosition + aCircleCenter
]

{ #category : #positioning }
ClockNeedleHourElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockNeedleHourElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockNeedleHourElement >> radius: anObject [
	radius := anObject
]

{ #category : #creation }
ClockNeedleHourElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockNeedleHourElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockNeedleHourElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockNeedleHourElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
