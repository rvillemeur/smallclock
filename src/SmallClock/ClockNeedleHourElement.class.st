Class {
	#name : #ClockNeedleHourElement,
	#superclass : #ClockNeedleElement,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleHourElement class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleHourElement >> arcRadians: index [
	| minuteOffset |
	minuteOffset := Float pi * time minute / 360.
	^ Float pi * time hour / 6 + minuteOffset + self radianOffset 
]

{ #category : #accessing }
ClockNeedleHourElement >> label [
	^ '...' asOrderedCollection 

]
