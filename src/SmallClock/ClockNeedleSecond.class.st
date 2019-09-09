Class {
	#name : #ClockNeedleSecond,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleSecond >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockNeedleSecondElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : #accessing }
ClockNeedleSecond >> label [
	^ '.....' asOrderedCollection 

]

{ #category : #accessing }
ClockNeedleSecond >> position: aCircleCenter on: time [
	elements
		do:
			[ :element | element position: aCircleCenter on: time ]
]

{ #category : #accessing }
ClockNeedleSecond >> radius [ 
	^ 10

]
