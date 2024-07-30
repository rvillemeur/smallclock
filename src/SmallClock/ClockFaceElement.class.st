Class {
	#name : 'ClockFaceElement',
	#superclass : 'ClockElement',
	#instVars : [
		'circleSplit'
	],
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'accessing' }
ClockFaceElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element circleSplit: numberOfElement.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition;
		center: 0@0.
	^ element
]

{ #category : 'positioning' }
ClockFaceElement >> arcRadians [
	^ circleSplit * index + self radianOffset
]

{ #category : 'accessing' }
ClockFaceElement >> circleSplit [
	^ circleSplit
]

{ #category : 'positioning' }
ClockFaceElement >> circleSplit: numberOfElement [
	circleSplit := Float twoPi / numberOfElement.
	^ self
]
