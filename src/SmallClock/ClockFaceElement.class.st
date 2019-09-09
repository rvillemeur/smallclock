Class {
	#name : #ClockFaceElement,
	#superclass : #ClockElement,
	#instVars : [
		'circleSplit'
	],
	#category : #'SmallClock-core'
}

{ #category : #positioning }
ClockFaceElement >> arcRadians [
	^ circleSplit * index + self radianOffset
]

{ #category : #accessing }
ClockFaceElement >> circleSplit [
	^ circleSplit
]

{ #category : #positioning }
ClockFaceElement >> circleSplit: numberOfElement [
	circleSplit := Float twoPi / numberOfElement.
	^ self
]
