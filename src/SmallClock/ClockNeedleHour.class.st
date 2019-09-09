Class {
	#name : #ClockNeedleHour,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleHour class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleHour >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleHourElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : #accessing }
ClockNeedleHour >> label [
	^ '...' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleHour >> position: aCircleCenter on: time [
	elements
		do:
			[ :element | element position: aCircleCenter on: time ]
]

{ #category : #accessing }
ClockNeedleHour >> radius [ 
	^ 10

]
