"
I'm testing the construction and accessibility of clock surround. The other part of the clock have been clone and adapted from me.
"
Class {
	#name : 'ClockSurroundTest',
	#superclass : 'TestCase',
	#instVars : [
		'elements'
	],
	#category : 'SmallClock-Tests',
	#package : 'SmallClock',
	#tag : 'Tests'
}

{ #category : 'tests' }
ClockSurroundTest >> testClockSurround [
	|surround|
	surround := ClockSurround new.
	self assert: ((surround elements at: 1) label) contents equals: '1'.
	self assert: ((surround elements at: 1) arcRadians)  equals: Float twoPi / 12 - Float halfPi .
	self assert: ((surround elements at: 1) radius)  equals: surround radius.
	self assert: ((surround elements at: 6) label) contents equals: '6'.
	self assert: ((surround elements at: 6) arcRadians)  equals: Float pi - Float halfPi.
	self assert: ((surround elements at: 6) radius)  equals: surround radius.
	self assert: ((surround elements at: 12) label) contents equals: '12'.
	self assert: ((surround elements at: 12) arcRadians)  equals: Float twoPi - Float halfPi.
	self assert: ((surround elements at: 12) radius)  equals: surround radius.
]
