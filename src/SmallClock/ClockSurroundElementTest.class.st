"
I'm testing the position of clock surround. The code is pretty similar for the other part of the clock
"
Class {
	#name : 'ClockSurroundElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'elements'
	],
	#category : 'SmallClock-Tests',
	#package : 'SmallClock',
	#tag : 'Tests'
}

{ #category : 'tests' }
ClockSurroundElementTest >> testArcRadiansOn [
	| surround |
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 1
		on: 12.
	self
		assert: surround arcRadians
		equals: Float twoPi / 12 - Float halfPi.
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 6
		on: 12.
	self assert: surround arcRadians equals: Float pi / 2.
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 3
		on: 12.
	self assert: surround arcRadians equals: 0.
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 9
		on: 12.
	self assert: surround arcRadians equals: Float pi
]

{ #category : 'tests' }
ClockSurroundElementTest >> testCircleSplit [
	| surround |
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 1
		on: 12.
	self assert: (surround circleSplit) closeTo: Float twoPi / 12.
		surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 1
		on: 6.
	self assert: (surround circleSplit) closeTo: Float twoPi / 6
]

{ #category : 'tests' }
ClockSurroundElementTest >> testNewPositions [
	| surround |
	surround := ClockSurroundElement
		label: '+' asStringMorph
		radius: 40
		index: 3
		on: 12.
	surround position: 100 @ 100.
	self assert: (surround label position) closeTo: 140 @ 100.
	self assert: (surround label contents) equals: '+'.
	surround := ClockSurroundElement
		label: '-' asStringMorph
		radius: 40
		index: 9
		on: 12.
	surround position: 100 @ 100.
	self assert: (surround label position) closeTo: 60 @ 100.
	self assert: (surround label contents) equals: '-'.
	surround := ClockSurroundElement
		label: '*' asStringMorph
		radius: 40
		index: 12
		on: 12.
	surround position: 100 @ 100.
	self assert: (surround label position) closeTo: 100 @ 60.
	self assert: (surround label contents) equals: '*'.
	surround := ClockSurroundElement
		label: '/' asStringMorph
		radius: 40
		index: 6
		on: 12.
	surround position: 100 @ 100.
	self assert: (surround label position) closeTo: 100 @ 140.
	self assert: (surround label contents) equals: '/'.
]

{ #category : 'tests' }
ClockSurroundElementTest >> testXCartesianCoordinateFromand [
	| surround|
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 1
		on: 12.
	
	self
		assert: (surround xCartesianCoordinateFrom: surround radius and: 0)
		equals: surround radius.
	self
		assert: (surround xCartesianCoordinateFrom: surround radius and: Float halfPi)
		closeTo: 0.
	self
		assert: (surround xCartesianCoordinateFrom: surround radius and: Float pi)
		equals: surround radius * -1.
	self
		assert:
			(surround
				xCartesianCoordinateFrom: surround radius
				and: Float pi + Float halfPi)
		closeTo: 0
]

{ #category : 'tests' }
ClockSurroundElementTest >> testYCartesianCoordinateFromand [
	| surround |
	surround := ClockSurroundElement
		label: '+'
		radius: 40
		index: 1
		on: 12.
	self
		assert: (surround yCartesianCoordinateFrom: surround radius and: 0)
		closeTo: 0.
	self
		assert: (surround yCartesianCoordinateFrom: surround radius and: Float halfPi)
		equals: surround radius.
	self
		assert: (surround yCartesianCoordinateFrom: surround radius and: Float pi)
		closeTo: 0.
	self
		assert:
			(surround
				yCartesianCoordinateFrom: surround radius
				and: Float pi + Float halfPi)
		equals: surround radius * -1
]
