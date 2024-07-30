Class {
	#name : 'ClockNeedleSecondElement',
	#superclass : 'ClockNeedleElement',
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'positioning' }
ClockNeedleSecondElement >> arcRadiansOn: time [
	^ Float pi * time second / 30 + self radianOffset 
]
