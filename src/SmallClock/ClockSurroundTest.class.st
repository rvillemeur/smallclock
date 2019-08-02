Class {
	#name : #ClockSurroundTest,
	#superclass : #TestCase,
	#instVars : [
		'elements'
	],
	#category : #'SmallClock-Tests'
}

{ #category : #tests }
ClockSurroundTest >> testArcRadians [
	|surround|
	surround := ClockSurround new.
	self assert: (surround arcRadians: 0) equals: Float halfPi * -1.
	self assert: (surround arcRadians: 3) equals: 0 .
	self assert: (surround arcRadians: 6) equals: Float halfPi .
	self assert: (surround arcRadians: 9) equals: Float pi.
	self assert: (surround arcRadians: 12) equals: Float pi + Float halfPi.
]

{ #category : #tests }
ClockSurroundTest >> testCircleSplit [
	|surround|
	surround := ClockSurround new.
	self assert: surround circleSplit closeTo: 0.523599.
]

{ #category : #tests }
ClockSurroundTest >> testCircleX [
	| surround |
	surround := ClockSurround new.
	self assert: (surround circleX: 0) equals: surround radius.
	self assert: (surround circleX: Float halfPi) closeTo: 0.
	self assert: (surround circleX: Float pi) equals: surround radius * -1.
	self assert: (surround circleX: Float pi + Float halfPi) closeTo: 0
]

{ #category : #tests }
ClockSurroundTest >> testCircleY [
	| surround |
	surround := ClockSurround new.
	self assert: (surround circleY: 0) closeTo: 0.
	self assert: (surround circleY: Float halfPi) equals: surround radius.
	self assert: (surround circleY: Float pi) closeTo: 0.
	self assert: (surround circleY: Float pi + Float halfPi) equals: surround radius * -1
]

{ #category : #tests }
ClockSurroundTest >> testNewPositions [
	|surround|
	surround := ClockSurround new.
	surround position: 100@100.
	self assert: (surround elements at:3) position equals: 140@100.
	self assert: (surround elements at:3) contents equals: '3'.
	self assert: (surround elements at:6) position equals: 100@140.
	self assert: (surround elements at:6) contents equals: '6'.
	self assert: (surround elements at:9) position equals: 60@100.
	self assert: (surround elements at:9) contents equals: '9'.
	self assert: (surround elements at:12) position x closeTo: 100.
	self assert: (surround elements at:12) position y closeTo: 60.
	self assert: (surround elements at:12) contents equals: '12'.
]

{ #category : #tests }
ClockSurroundTest >> testPositions [
	|surround|
	surround := ClockSurround new.
	self assert: (surround elements at:1) position equals: 0@0.
	self assert: (surround elements at:1) contents equals: '1'.
	self assert: (surround elements at:12) position equals: 0@0.
	self assert: (surround elements at:12) contents equals: '12'.
]

{ #category : #tests }
ClockSurroundTest >> testUpdatePoint [
	|surround point|
	surround := ClockSurround new.
	point := #+ asStringMorph position: 0@0.
	surround updatePoint:  point index: 3 to: 100@100.
	self assert: point position equals: 140@100.
	surround updatePoint:  point index: 6 to: 100@100.
	self assert: point position equals: 100@140.
	surround updatePoint:  point index: 9 to: 100@100.
	self assert: point position equals: 60@100.
	surround updatePoint:  point index: 12 to: 100@100.
	self assert: point position x closeTo: 100.
]
