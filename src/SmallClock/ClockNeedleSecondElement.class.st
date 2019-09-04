Class {
	#name : #ClockNeedleSecondElement,
	#superclass : #ClockNeedleElement,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecondElement class >> start [
	^self new start

]

{ #category : #accessing }
ClockNeedleSecondElement >> arcRadians: index [
	^ Float pi * time second / 30 + self radianOffset 
]

{ #category : #accessing }
ClockNeedleSecondElement >> label [
	^ '.....' asOrderedCollection 

]
