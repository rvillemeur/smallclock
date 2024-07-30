"
I represent the different part of the clock:
- clock Face with 
	* clock surround
	* clock date, that rotate around clock surround.
- clock needle with 3 needles: hour, minute and second.
Each part has its own dedicated class.

When the user move the mouse, the center of each element are re-computed, so the clock looks scrambled.
If the user pause the mouse, then the clock come back to normal.
"
Class {
	#name : 'ClockPart',
	#superclass : 'Object',
	#instVars : [
		'elements'
	],
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'accessing' }
ClockPart >> animationSpeed [
	^ 0.06
]

{ #category : 'accessing' }
ClockPart >> elements [
	^ elements
]

{ #category : 'accessing' }
ClockPart >> elements: aLabel [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
ClockPart >> initialize [
	self elements: self label.
	^ self
]

{ #category : 'accessing' }
ClockPart >> label [
	^ self subclassResponsibility
]

{ #category : 'accessing' }
ClockPart >> start [
	self elements do: [ :element | element start ].


]

{ #category : 'accessing' }
ClockPart >> stop [
	elements do: [ :element | element stop ]

]
