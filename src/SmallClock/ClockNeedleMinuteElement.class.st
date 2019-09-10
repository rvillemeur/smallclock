Class {
	#name : #ClockNeedleMinuteElement,
	#superclass : #ClockNeedleElement,
	#category : #'SmallClock-core'
}

{ #category : #positioning }
ClockNeedleMinuteElement >> arcRadiansOn: time [
	^ Float pi * time minute / 30 + self radianOffset 
]
