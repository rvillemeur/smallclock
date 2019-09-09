"
I'm the surround of clock, composed of multiple clock surround element.

"
Class {
	#name : #ClockSurround,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockSurround class >> start [
	^self new start
]

{ #category : #accessing }
ClockSurround >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockSurroundElement
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
	^ self
]

{ #category : #accessing }
ClockSurround >> label [
	^ '1 2 3 4 5 6 7 8 9 10 11 12' findTokens: ' '

]

{ #category : #accessing }
ClockSurround >> position: aCircleCenter [
	elements
		do:
			[ :element | element position: aCircleCenter ]
]

{ #category : #accessing }
ClockSurround >> radius [ 
	^ 48

]
