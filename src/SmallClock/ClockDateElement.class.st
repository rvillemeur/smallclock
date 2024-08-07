"
I'm an element of clock date. In addition to the animation displayed when the user move the mouse, I also rotate around my center.


"
Class {
	#name : 'ClockDateElement',
	#superclass : 'ClockFaceElement',
	#instVars : [
		'rotation'
	],
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'creation' }
ClockDateElement >> initialize [
	rotation := 0.
	^ self
]

{ #category : 'positioning' }
ClockDateElement >> position: aCircleCenter [
	|xPosition yPosition radian|
	center:= aCircleCenter.
	radian := self arcRadians.
	xPosition := self xCartesianCoordinateFrom: radius and: (radian - rotation) .
	yPosition := self yCartesianCoordinateFrom: radius and: (radian - rotation).
	rotation := rotation + self speed.
	label position: xPosition @ yPosition + aCircleCenter
]

{ #category : 'accessing' }
ClockDateElement >> rotation [
	^ rotation
]

{ #category : 'accessing' }
ClockDateElement >> rotation: anObject [
	rotation := anObject
]

{ #category : 'creation' }
ClockDateElement >> speed [
	^ 0.06


]
