Class {
	#name : #ClockNeedleSecond,
	#superclass : #ClockNeedle,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleSecond >> arcRadians: index [
	^ Float pi * time second / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleSecond >> label [
	^ '.....' asOrderedCollection 

]
