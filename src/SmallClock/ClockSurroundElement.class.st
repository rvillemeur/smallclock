Class {
	#name : #ClockSurroundElement,
	#superclass : #ClockFaceElement,
	#category : #'SmallClock-core'
}

{ #category : #positioning }
ClockSurroundElement >> position: aCircleCenter [
	|xPosition yPosition radian|
	center:= aCircleCenter.
	radian := self arcRadians.
	xPosition := self xCartesianCoordinateFrom: radius and: radian .
	yPosition := self yCartesianCoordinateFrom: radius and: radian.
	label position: xPosition @ yPosition + aCircleCenter
	
]
