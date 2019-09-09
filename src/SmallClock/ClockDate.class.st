Class {
	#name : #ClockDate,
	#superclass : #ClockPart,
	#category : #'SmallClock-core'
}

{ #category : #accessing }
ClockDate class >> start [
	^self new start
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
ClockDate >> elements: aCollection [
	elements := aCollection
		collectWithIndex: [ :string :index | 
			ClockDateElement 
				label: string asStringMorph
				radius: self radius
				index: index
				on: aCollection size ].
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
ClockDate >> position: aCircleCenter [
	elements
		do:
			[ :element | element position: aCircleCenter ]
]

{ #category : #accessing }
ClockDate >> radius [
	^ 60


]
