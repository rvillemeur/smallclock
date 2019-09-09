Class {
	#name : #ClockNeedleHourElement,
	#superclass : #ClockNeedleElement,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleHourElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleHourElement >> arcRadiansOn: time [
	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset + self radianOffset 
]
