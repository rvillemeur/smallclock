Class {
	#name : #SmallClock,
	#superclass : #Object,
	#instVars : [
		'center',
		'surround',
		'date',
		'process'
	],
	#classVars : [
		'instance'
	],
	#category : #SmallClock
}

{ #category : #'class initialization' }
SmallClock class >> initialize [
	WorldState desktopMenuPragmaKeyword: 'worldMenu'.
	instance isNil
		ifTrue: [ instance := self basicNew ].

]

{ #category : #'class initialization' }
SmallClock class >> start [
	^ instance start


]

{ #category : #'class initialization' }
SmallClock class >> stop [
	^ instance stop

]

{ #category : #'class initialization' }
SmallClock class >> worldMenu: aBuilder [
	<worldMenu>
	(aBuilder item: #SmallClock)
		order: 4.0;
		with: [ (aBuilder item: 'Start')
				action: [ SmallClock start ];
				parent: #SmallClock;
				icon: ThemeIcons current smallAddIcon;
				order: 0;
				help: 'start clock animation'.
			(aBuilder item: 'stop')
				action: [ SmallClock stop ];
				parent: #SmallClock;
				icon: ThemeIcons current smallCancelIcon;
				order: 999;
				help: 'stop clock animation' ]

]

{ #category : #accessing }
SmallClock >> center [ 
^ center ifNil: [center := (#+ asStringMorph backgroundColor: Color red)]
]

{ #category : #accessing }
SmallClock >> mouseOffset [
	^ 75 @ 75
]

{ #category : #accessing }
SmallClock >> position: aPoint [
	self center position: aPoint.
	surround position: aPoint.
	date position: aPoint.
	^self.
]

{ #category : #accessing }
SmallClock >> start [
	self center comeToFront openInWorld.
	surround := ClockSurround new start.
	date := ClockDate new start.
	process := [ [ true ]
		whileTrue: [ self position: Smalltalk currentWorld activeHand position + self mouseOffset.
			(1 / 60) seconds asDelay wait ] ] forkAt: Processor lowestPriority.
	^ self
]

{ #category : #accessing }
SmallClock >> stop [
	center delete.
	surround stop.
	date stop.
	process terminate.
	^ self
]
