Class {
	#name : #ClockNeedleMinute,
	#superclass : #Object,
	#instVars : [
		'elements',
		'time'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleMinute class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleMinute >> arcRadians: index [
	"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"

	^ Float pi * time minute / 30 - Float halfPi
]

{ #category : #accessing }
ClockNeedleMinute >> elements [
	^ elements
]

{ #category : #accessing }
ClockNeedleMinute >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #initialization }
ClockNeedleMinute >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedleMinute >> label [
	^ '.....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleMinute >> position: aPoint [
	time := DateAndTime now.
	elements
		withIndexDo:
			[ :element :index | self updateElementPosition: element atIndex: index to: aPoint ].
]

{ #category : #accessing }
ClockNeedleMinute >> radius [ 
	^ 6

]

{ #category : #accessing }
ClockNeedleMinute >> start [
	self elements do: [ :element | element comeToFront openInWorld ].
]

{ #category : #accessing }
ClockNeedleMinute >> stop [
	elements do: [ :element | element delete ]
]

{ #category : #'as yet unclassified' }
ClockNeedleMinute >> updateElementPosition: aStringMorph atIndex: elementIndex to: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * elementIndex.
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * elementIndex.
	aStringMorph position: xPosition @ yPosition + aPoint.
]

{ #category : #accessing }
ClockNeedleMinute >> xCartesianCoordinateFrom: aRadius and:  aRadians [
	^ aRadius * (aRadians cos).
]

{ #category : #accessing }
ClockNeedleMinute >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * aRadians sin
]
