Class {
	#name : #ClockNeedleElement,
	#superclass : #ClockElement,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition;
		center: 0@0.
	^ element
]

{ #category : #positioning }
ClockNeedleElement >> arcRadiansOn: aTime [
	^ self subclassResponsibility
]

{ #category : #positioning }
ClockNeedleElement >> position: aCircleCenter on: time [
	|xPosition yPosition radian|
	center := aCircleCenter.
	radian := self arcRadiansOn: time .
	xPosition := (self xCartesianCoordinateFrom: radius and: radian) * (index - 1).
	yPosition := (self yCartesianCoordinateFrom: radius and: radian) * (index - 1).
	label position: xPosition @ yPosition + aCircleCenter
]
