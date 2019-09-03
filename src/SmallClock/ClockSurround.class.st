Class {
	#name : #ClockSurround,
	#superclass : #ClockElement,
	#category : #SmallClock
}

{ #category : #accessing }
ClockSurround class >> start [
	^self new start

]

{ #category : #accessing }
ClockSurround >> arcRadians: index [
	^ self circleSplit * index + self radianOffset
]

{ #category : #initialization }
ClockSurround >> initialize [
	self elements: self label.
	^ self
]

{ #category : #accessing }
ClockSurround >> label [
	^ '1 2 3 4 5 6 7 8 9 10 11 12' findTokens: ' '

]

{ #category : #accessing }
ClockSurround >> position: aPoint [
	self elementsPositions: aPoint
]

{ #category : #accessing }
ClockSurround >> radius [ 
	^ 48

]
