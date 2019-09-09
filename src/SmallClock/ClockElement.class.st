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
