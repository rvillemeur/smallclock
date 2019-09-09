Class {
	#name : #ClockNeedleSecond,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleSecond class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleSecond >> elements [
	^ elements
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

{ #category : #initialization }
ClockNeedleSecond >> initialize [
	self elements: self label.
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

{ #category : #accessing }
ClockNeedleSecond >> start [
	self elements do: [ :element | element start ].


]

{ #category : #accessing }
ClockNeedleSecond >> stop [
	elements do: [ :element | element stop ]


]
