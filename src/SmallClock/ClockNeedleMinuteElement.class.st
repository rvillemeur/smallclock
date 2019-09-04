Class {
	#name : #ClockNeedleMinuteElement,
	#superclass : #ClockNeedleElement,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleMinuteElement class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleMinuteElement >> arcRadians: index [
	^ Float pi * time minute / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleMinuteElement >> label [
	^ '....' asOrderedCollection 

]
