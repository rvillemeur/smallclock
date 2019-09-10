Class {
	#name : #ClockPart,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockPart >> animationSpeed [
	^ 0.06
]

{ #category : #accessing }
ClockPart >> elements [
	^ elements
]

{ #category : #accessing }
ClockPart >> elements: aLabel [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClockPart >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockPart >> label [
	^ self subclassResponsibility
]

{ #category : #accessing }
ClockPart >> start [
	self elements do: [ :element | element start ].


]

{ #category : #accessing }
ClockPart >> stop [
	elements do: [ :element | element stop ]

]
