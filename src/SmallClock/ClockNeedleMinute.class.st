Class {
	#name : #ClockNeedleMinute,
	#superclass : #ClockPart,
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleMinute class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleMinute >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleMinuteElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : #accessing }
ClockNeedleMinute >> label [
	^ '....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleMinute >> position: aCircleCenter on: time [
	elements
		do:
			[ :element | element position: aCircleCenter on: time ]
]

{ #category : #accessing }
ClockNeedleMinute >> radius [ 
	^ 10

]
