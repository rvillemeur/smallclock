Class {
	#name : #ClockNeedleHourElement,
	#superclass : #ClockNeedleElement,
	#category : #'SmallClock-core'
}

{ #category : #positioning }
ClockNeedleHourElement >> arcRadiansOn: time [
	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset + self radianOffset 
]
