Class {
	#name : #ClockNeedle,
	#superclass : #ClockElement,
	#instVars : [
		'time'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedle >> arcRadians: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #initialization }
ClockNeedle >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedle >> label [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClockNeedle >> position: aPoint [
	time := DateAndTime now.
	self updateElementsPositions: aPoint
]

{ #category : #accessing }
ClockNeedle >> radius [ 
	^ 10

]

{ #category : #accessing }
ClockNeedle >> updateElementPosition: aStringMorph atIndex: elementIndex to: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	aStringMorph position: xPosition @ yPosition + aPoint.
]
