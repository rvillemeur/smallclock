"
I'm a clock where each component is displayed as String morph, and the entry point of the small program.
There is a menu added to the world so user can start and stop me.




"
Class {
	#name : 'SmallClock',
	#superclass : 'Object',
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
	#category : 'SmallClock-core',
	#package : 'SmallClock',
	#tag : 'core'
}

{ #category : 'class initialization' }
SmallClock class >> initialize [
	WorldState desktopMenuPragmaKeyword: 'worldMenu'.
	instance isNil
		ifTrue: [ instance := self basicNew ].

]

{ #category : 'class initialization' }
SmallClock class >> start [
	^ instance start


]

{ #category : 'class initialization' }
SmallClock class >> stop [
	^ instance stop

]

{ #category : 'class initialization' }
SmallClock class >> worldMenu: aBuilder [
	<worldMenu>
	(aBuilder item: #SmallClock)
		order: 4.0;
		with: [ (aBuilder item: 'Start')
				action: [ self start ];
				parent: #SmallClock;
				icon: (self iconNamed: #smallAddIcon);
				order: 0;
				help: 'start clock animation'.
			(aBuilder item: 'stop')
				action: [ self stop ];
				parent: #SmallClock;
				icon: (self iconNamed: #smallCancelIcon);
				order: 999;
				help: 'stop clock animation' ]
]

{ #category : 'initialization' }
SmallClock >> initialize [

	super initialize.

	surround := ClockSurround.
	date := ClockDate.
	second := ClockNeedleSecond.
	minute := ClockNeedleMinute.
	hour := ClockNeedleHour
]

{ #category : 'accessing' }
SmallClock >> mouseOffset [
	^ 75 @ 75
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
SmallClock >> start [

	{
		surround.
		date.
		second.
		minute.
		hour } do: [ :elt | elt start ].

	process := [
	           [ true ] whileTrue: [
		           self position:
			           Smalltalk currentWorld activeHand position
			           + self mouseOffset.
		           (1 / 60) seconds asDelay wait ] ] forkAt:
		           Processor lowestPriority.
	^ self
]

{ #category : 'accessing' }
SmallClock >> stop [
	{
		surround.
		date.
		second.
		minute.
		hour } do: [ :elt | elt stop ].
	process terminate.
	^ self
]
