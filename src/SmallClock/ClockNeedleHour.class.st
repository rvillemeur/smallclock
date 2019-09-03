Class {
	#name : #ClockNeedleHour,
	#superclass : #ClockNeedle,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleHour class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleHour >> arcRadians: index [
	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset + self radianOffset 
]

{ #category : #accessing }
ClockNeedleHour >> label [
	^ '...' asOrderedCollection 

]
