"
I'm testing Clock date label construction
"
Class {
	#name : #ClockDateTest,
	#superclass : #TestCase,
	#category : #'SmallClock-Tests'
}

{ #category : #tests }
ClockDateTest >> testDateLabelAt [
	| label date |
	date := Date fromString: '06/13/2019'.
	label := ClockDateElement new dateLabelAt: date.
	self assert: label equals: ' Jeudi 13 Juin 2019'
]

{ #category : #tests }
ClockDateTest >> testDayNameAt [
|weekday date|
date := Date fromString: '06/13/2019'.
weekday :=  ClockDateElement new dayNameAt: date.
self assert: weekday equals: 'Jeudi'
]

{ #category : #tests }
ClockDateTest >> testMonthNameAt [
|monthName date|
date := Date fromString: '06/13/2019'.
monthName :=  ClockDateElement new monthNameAt: date.
self assert: monthName equals: 'Juin'
]
