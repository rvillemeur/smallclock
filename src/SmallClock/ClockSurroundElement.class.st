Class {
	#name : #ClockSurroundElement,
	#superclass : #ClockFaceElement,
	#category : #'SmallClock-core'
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
ClockSurroundElement >> position: aCircleCenter [
	|xPosition yPosition radian|
	radian := self arcRadians.
	xPosition := self xCartesianCoordinateFrom: radius and: radian .
	yPosition := self yCartesianCoordinateFrom: radius and: radian.
	label position: xPosition @ yPosition + aCircleCenter
	
]
