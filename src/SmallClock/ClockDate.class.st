Class {
	#name : #ClockDate,
	#superclass : #ClockElement,
	#instVars : [
		'rotation'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockDate class >> start [
	^self new start
]

{ #category : #accessing }
ClockDate >> arcRadians: index [
	^ rotation + (self circleSplit * index) + self radianOffset 
]

{ #category : #accessing }
ClockDate >> dateLabelAt: aDate [
	| dayName monthName yearName today |
	dayName := self dayNameAt: aDate.
	monthName := self monthNameAt: aDate.
	yearName := aDate year asString.
	today := aDate dayOfMonth asString.
	^ ' ' , dayName , ' ' , today , ' ' , monthName , ' ' , yearName
]

{ #category : #accessing }
ClockDate >> dayNameAt: aDate [
	^ #('Dimanche' 'Lundi' 'Mardi' 'Mercredi' 'Jeudi' 'Vendredi' 'Samedi') at: aDate  weekdayIndex.
]

{ #category : #accessing }
ClockDate >> initialize [
	self elements: self label.
	rotation := 0.
	^ self
]

{ #category : #accessing }
ClockDate >> label [
	^ (self dateLabelAt: Date today) asOrderedCollection 
]

{ #category : #accessing }
ClockDate >> monthNameAt: aDate [
	^ #('Janvier' 'Février' 'Mars' 'Avril' 'Mai' 'Juin' 'Juillet' 'Août' 'Septembre' 'Octobre' 'Novembre' 'Décembre') at: aDate monthIndex.


]

{ #category : #accessing }
ClockDate >> position: aPoint [
	rotation := rotation - self speed.
	self elementsPositions: aPoint
]

{ #category : #accessing }
ClockDate >> radius [
	^ 60


]

{ #category : #accessing }
ClockDate >> speed [
	^ 0.06


]
