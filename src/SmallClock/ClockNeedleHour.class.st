Class {
	#name : #ClockNeedleHour,
	#superclass : #Object,
	#instVars : [
		'elements',
		'time'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleHour class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleHour >> arcRadians: index [
	"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"

	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset - Float halfPi
]

{ #category : #accessing }
ClockNeedleHour >> elements [
	^ elements
]

{ #category : #accessing }
ClockNeedleHour >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #initialization }
ClockNeedleHour >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedleHour >> label [
	^ '...' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleHour >> position: aPoint [
	time := DateAndTime now.
	elements
		withIndexDo:
			[ :element :index | self updateElementPosition: element atIndex: index to: aPoint ].
]

{ #category : #accessing }
ClockNeedleHour >> radius [ 
	^ 10

]

{ #category : #accessing }
ClockNeedleHour >> start [
	self elements do: [ :element | element comeToFront openInWorld ].
]

{ #category : #accessing }
ClockNeedleHour >> stop [
	elements do: [ :element | element delete ]
]

{ #category : #'as yet unclassified' }
ClockNeedleHour >> updateElementPosition: aStringMorph atIndex: elementIndex to: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * (elementIndex - 1).
	aStringMorph position: xPosition @ yPosition + aPoint.
]

{ #category : #accessing }
ClockNeedleHour >> xCartesianCoordinateFrom: aRadius and:  aRadians [
	^ aRadius * (aRadians cos).
]

{ #category : #accessing }
ClockNeedleHour >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
