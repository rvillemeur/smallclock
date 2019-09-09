Class {
	#name : #ClockNeedleSecondElement,
	#superclass : #ClockNeedleElement,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleSecondElement class >> label: aLetter radius: circleRadius index: elementPosition on: numberOfElement [
	| element |
	element := self new.
	element
		label: aLetter;
		radius: circleRadius;
		index: elementPosition.
	^ element
]

{ #category : #positioning }
ClockNeedleSecondElement >> arcRadiansOn: time [
	^ Float pi * time second / 30 + self radianOffset 
]
