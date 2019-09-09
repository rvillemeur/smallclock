Class {
	#name : #ClockNeedleHour,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockNeedleHour class >> start [
	^self new start
]

{ #category : #accessing }
ClockNeedleHour >> elements [
	^ elements
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

{ #category : #initialization }
ClockNeedleHour >> initialize [
	self elements: self label.
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

{ #category : #accessing }
ClockNeedleHour >> start [
	self elements do: [ :element | element start ].


]

{ #category : #accessing }
ClockNeedleHour >> stop [
	elements do: [ :element | element stop ]


]
