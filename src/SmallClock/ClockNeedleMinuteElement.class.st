Class {
	#name : #ClockNeedleMinuteElement,
	#superclass : #ClockNeedleElement,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleMinuteElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleMinuteElement >> arcRadiansOn: time [
	^ Float pi * time minute / 30 + self radianOffset 
]
