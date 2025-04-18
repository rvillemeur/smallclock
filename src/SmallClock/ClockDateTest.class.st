"
I'm testing Clock date label construction
"
Class {
	#name : 'ClockDateTest',
	#superclass : 'TestCase',
	#category : 'SmallClock-Tests',
	#package : 'SmallClock',
	#tag : 'Tests'
}

{ #category : 'tests' }
ClockDateTest >> testDateLabelAt [
	| label date |
	date := Date readFrom: '06/13/2019' pattern: 'mm/dd/yyyy' .
	label := ClockDate new dateLabelAt: date.
	self assert: label equals: ' Jeudi 13 Juin 2019'
]

{ #category : 'tests' }
ClockDateTest >> testDayNameAt [
|weekday date|
date := Date readFrom: '06/13/2019' pattern: 'mm/dd/yyyy'.
weekday :=  ClockDate new dayNameAt: date.
self assert: weekday equals: 'Jeudi'
]

{ #category : 'tests' }
ClockDateTest >> testMonthNameAt [
|monthName date|
date := Date readFrom: '06/13/2019' pattern: 'mm/dd/yyyy'.
monthName :=  ClockDate new monthNameAt: date.
self assert: monthName equals: 'Juin'
]
