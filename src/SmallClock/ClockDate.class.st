Class {
	#name : #ClockDate,
	#superclass : #Object,
	#instVars : [
		'rotation',
		'elements'
	],
	#category : #SmallClock
}

{ #category : #accessing }
ClockDate class >> start [
	^self new start
]

{ #category : #accessing }
ClockDate >> arcRadians: index [
"Clock surround start from the top, and not from the 0 of the circle, so remove Float halfPi"
	^ rotation + (self circleSplit * index) - Float halfPi  
]

{ #category : #accessing }
ClockDate >> circleSplit [
	^ Float twoPi / (self label size) 
]

{ #category : #accessing }
ClockDate >> circleX: radians [
	^ self radius * (radians cos).
]

{ #category : #accessing }
ClockDate >> circleY: radians [
	^ self radius * (radians sin).
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
ClockDate >> elements [
	^ elements
]

{ #category : #accessing }
ClockDate >> elements: aCollection [
	| elementDetail |
	elementDetail := Array new: aCollection size.
	aCollection
		collect: [ :string | string asStringMorph position: 0 @ 0 ]
		into: elementDetail.
	elements := elementDetail.
	^ self
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
1 to: (elements size) do: [ :index | self updatePoint: (elements at: index) index: index to: aPoint ].
rotation :=  rotation - self speed.


]

{ #category : #accessing }
ClockDate >> radius [
	^ 60


]

{ #category : #accessing }
ClockDate >> speed [
	^ 0.06


]

{ #category : #accessing }
ClockDate >> start [
	self elements do: [ :element | element comeToFront openInWorld ].


]

{ #category : #accessing }
ClockDate >> stop [
	elements do: [ :element | element delete ]


]

{ #category : #accessing }
ClockDate >> updatePoint: aStringMorph index: elementIndex to: aPoint [
	|xPosition yPosition|
	xPosition := self circleX: (self arcRadians: elementIndex).
	yPosition := self circleY: (self arcRadians: elementIndex).
	aStringMorph position: xPosition @ yPosition + aPoint.



]
