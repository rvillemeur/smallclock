"
I'm a clock where each component is displayed as String morph.

"
Class {
	#name : #SmallClock,
	#superclass : #Object,
	#instVars : [
		'surround',
		'date',
		'process',
		'second',
		'minute',
		'hour'
	],
	#classVars : [
		'instance'
	],
	#category : #'SmallClock-core'
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
SmallClock >> mouseOffset [
	^ 75 @ 75
]

{ #category : #accessing }
SmallClock >> position: aPoint [
|time|
	time := DateAndTime now.
	surround position: aPoint.
	date position: aPoint.
	second position: aPoint on: time.
	minute position: aPoint on: time.
	hour position: aPoint on: time.
	^self.
]

{ #category : #accessing }
SmallClock >> start [
	surround := ClockSurround start.
	date := ClockDate start.
	second := ClockNeedleSecond  start.
	minute := ClockNeedleMinute  start.
	hour := ClockNeedleHour start.
	process := [ [ true ]
		whileTrue: [ self position: Smalltalk currentWorld activeHand position + self mouseOffset.
			(1 / 60) seconds asDelay wait ] ] forkAt: Processor lowestPriority.
	^ self
]

{ #category : #accessing }
SmallClock >> stop [
	surround stop.
	date stop.
	second stop.
	minute stop.
	hour stop.
	process terminate.
	^ self
]
