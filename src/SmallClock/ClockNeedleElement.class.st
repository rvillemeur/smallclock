Class {
	#name : #ClockNeedleElement,
	#superclass : #ClockElement,
	#instVars : [
		'time'
	],
	#category : #SmallClock
}

{ #category : #initialization }
ClockNeedleElement >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedleElement >> position: aPoint [
	time := DateAndTime now.
	self elementsPositions: aPoint
]

{ #category : #accessing }
ClockNeedleElement >> radius [ 
	^ 10

]

{ #category : #accessing }
ClockNeedleElement >> updatePositionOf: anElement atIndex: elementIndex to: center [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	anElement position: xPosition @ yPosition + center.
]
