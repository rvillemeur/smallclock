Class {
	#name : #ClockNeedle,
	#superclass : #ClockElement,
	#instVars : [
		'time'
	],
	#category : #SmallClock
}

{ #category : #initialization }
ClockNeedle >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedle >> position: aPoint [
	time := DateAndTime now.
	self elementsPositions: aPoint
]

{ #category : #accessing }
ClockNeedle >> radius [ 
	^ 10

]

{ #category : #accessing }
ClockNeedle >> updatePositionOf: anElement atIndex: elementIndex to: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	anElement position: xPosition @ yPosition + aPoint.
]
