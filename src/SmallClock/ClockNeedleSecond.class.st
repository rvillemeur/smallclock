Class {
	#name : #ClockNeedleSecond,
	#superclass : #Object,
	#instVars : [
		'elements',
		'time'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleSecond >> arcRadians: index [
"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"
	^ ((Float pi * time) / 30) - Float halfPi  
]

{ #category : #accessing }
ClockNeedleSecond >> elements [
	^ elements
]

{ #category : #accessing }
ClockNeedleSecond >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
]

{ #category : #initialization }
ClockNeedleSecond >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockNeedleSecond >> label [
	^ '.....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleSecond >> position: aPoint [
time := DateAndTime now second.
1 to: (elements size) do: [ :index | self updatePoint: (elements at: index) index: index to: aPoint ].

]

{ #category : #accessing }
ClockNeedleSecond >> radius [ 
	^ 6

]

{ #category : #accessing }
ClockNeedleSecond >> start [
	self elements do: [ :element | element comeToFront openInWorld ].
]

{ #category : #accessing }
ClockNeedleSecond >> stop [
	elements do: [ :element | element delete ]
]

{ #category : #'as yet unclassified' }
ClockNeedleSecond >> updatePoint: aStringMorph index: elementIndex to: aPoint [
	|xPosition yPosition radian|
	radian := self arcRadians: elementIndex.
	xPosition := (self xCartesianCoordinateFrom: self radius and: radian) * elementIndex.
	yPosition := (self yCartesianCoordinateFrom: self radius and: radian) * elementIndex.
	aStringMorph position: xPosition @ yPosition + aPoint.
]

{ #category : #accessing }
ClockNeedleSecond >> xCartesianCoordinateFrom: aRadius and:  aRadians [
	^ aRadius * (aRadians cos).
]

{ #category : #accessing }
ClockNeedleSecond >> yCartesianCoordinateFrom: aRadius and: aRadians [
	^ aRadius * (aRadians sin).
]
