Class {
	#name : #ClockNeedleMinute,
	#superclass : #ClockNeedle,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleMinute class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleMinute >> arcRadians: index [
	^ Float pi * time minute / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleMinute >> label [
	^ '....' asOrderedCollection 

]
