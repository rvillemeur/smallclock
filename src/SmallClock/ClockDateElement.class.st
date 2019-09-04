Class {
	#name : #ClockDateElement,
	#superclass : #ClockElement,
	#instVars : [
		'rotation'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockDateElement class >> start [
	^self new start
]

{ #category : #accessing }
ClockDateElement >> arcRadians: index [
	^ rotation + (self circleSplit * index) + self radianOffset 
]

{ #category : #accessing }
ClockDateElement >> dateLabelAt: aDate [
	| dayName monthName yearName today |
	dayName := self dayNameAt: aDate.
	monthName := self monthNameAt: aDate.
	yearName := aDate year asString.
	today := aDate dayOfMonth asString.
	^ ' ' , dayName , ' ' , today , ' ' , monthName , ' ' , yearName
]

{ #category : #accessing }
ClockDateElement >> dayNameAt: aDate [
	^ #('Dimanche' 'Lundi' 'Mardi' 'Mercredi' 'Jeudi' 'Vendredi' 'Samedi') at: aDate  weekdayIndex.
]

{ #category : #accessing }
ClockDateElement >> initialize [
	self elements: self label.
	rotation := 0.
	^ self
]

{ #category : #accessing }
ClockDateElement >> label [
	^ (self dateLabelAt: Date today) asOrderedCollection 
]

{ #category : #accessing }
ClockDateElement >> monthNameAt: aDate [
	^ #('Janvier' 'Février' 'Mars' 'Avril' 'Mai' 'Juin' 'Juillet' 'Août' 'Septembre' 'Octobre' 'Novembre' 'Décembre') at: aDate monthIndex.


]

{ #category : #accessing }
ClockDateElement >> position: aPoint [
	rotation := rotation - self speed.
	self elementsPositions: aPoint
]

{ #category : #accessing }
ClockDateElement >> radius [
	^ 60


]

{ #category : #accessing }
ClockDateElement >> speed [
	^ 0.06


]
