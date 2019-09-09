Class {
	#name : #ClockNeedleElement,
	#superclass : #ClockElement,
	#category : #'SmallClock-core'
}

{ #category : #positioning }
ClockNeedleElement >> position: aCircleCenter on: time [
	|xPosition yPosition radian|
	radian := self arcRadiansOn: time .
	xPosition := (self xCartesianCoordinateFrom: radius and: radian) * (index - 1).
	yPosition := (self yCartesianCoordinateFrom: radius and: radian) * (index - 1).
	label position: xPosition @ yPosition + aCircleCenter
]
