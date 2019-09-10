"
I'm the base of each clock element: 
- a letter in clock date
- a number in clock surround
- a dot in one of the needles.
Each element is independantm and has its own radius.
When all element of the clock part are displayed at the same time, then the clock part will be displayed completely.

Each element is positioned on a circle, with its own radius.
The position of each element is calculated with basic trigonometry formulae (sin, cos), with radius, just like you would position an item on a circle.

The element are separated between clock face and clock needle. 
* Each element of the Clock face are displayed as a circle with a center.
* Each element of a clock needle are displayed as a line starting from the center.




"
Class {
	#name : #ClockElement,
	#superclass : #Object,
	#instVars : [
		'center',
		'index',
		'radius',
		'label'
	],
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockElement >> center [
	^ center
]

{ #category : #accessing }
ClockElement >> center: anObject [
	center := anObject
]

{ #category : #accessing }
ClockElement >> index [
	^ index
]

{ #category : #accessing }
ClockElement >> index: anObject [
	index := anObject
]

{ #category : #accessing }
ClockElement >> label [
	^ label
]

{ #category : #accessing }
ClockElement >> label: anObject [
	label := anObject
]

{ #category : #positioning }
ClockElement >> radianOffset [
"Clock surround start from the top, and not from the horizontal 0 of the circle, so remove Float halfPi"
	^ Float halfPi * -1
]

{ #category : #accessing }
ClockElement >> radius [
	^ radius
]

{ #category : #accessing }
ClockElement >> radius: anObject [
	radius := anObject
]

{ #category : #creation }
ClockElement >> start [
	self label comeToFront openInWorld
]

{ #category : #creation }
ClockElement >> stop [
	self label delete
]

{ #category : #positioning }
ClockElement >> xCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians cos
]

{ #category : #positioning }
ClockElement >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
