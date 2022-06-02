!classDefinition: #MarsRoverTest category: 'MarsRoverExplorator'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:21:29'!
test01WhenIsCreatedItsPositionIsInitialPosition
	| marsRover |
	marsRover := MarsRover new.
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:25:13'!
test02SendingAMovementCommandChangesItsInitialPosition
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'f'.
	self deny: (0@0 = (marsRover position))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:25:45'!
test03WhenIsCreatedItsDirectionIsInitialDirection
	| marsRover |
	marsRover := MarsRover new.
	self assert: EastDirection equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test04
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'b'.
	self assert: -1@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test05
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'ffb'.
	self assert: 1@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test06
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'l'.
	self assert: NorthDirection equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test07
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'll'.
	self assert: WestDirection equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test08
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'r'.
	self assert: SouthDirection equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test09
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'rr'.
	self assert: WestDirection equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test10
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'rf'.
	self assert: SouthDirection equals: marsRover direction.
	self assert: 0@-1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test11
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'rrf'.
	self assert: WestDirection equals: marsRover direction.
	self assert: -1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test12
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'rrrf'.
	self assert: NorthDirection equals: marsRover direction.
	self assert: 0@1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test13
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'rrrlf'.
	self assert: WestDirection equals: marsRover direction.
	self assert: -1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test14
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'lb'.
	self assert: NorthDirection equals: marsRover direction.
	self assert: 0@-1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test15
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'llb'.
	self assert: WestDirection equals: marsRover direction.
	self assert: 1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test16
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeCommands: 'lllb'.
	self assert: SouthDirection equals: marsRover direction.
	self assert: 0@1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
test17
	| marsRover |
	marsRover := MarsRover new.
	self should:[marsRover executeCommands: 'ffxbbbb']
	raise: Error
	withExceptionDo: [:anError |
	self assert: MarsRover commandIsInvalid equals: anError messageText.
	self assert: 2@0 equals: marsRover position.
	]
	! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction nextDirections commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 21:23:40'!
direction
	^direction class! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:14:01'!
executeCommands: aStringOfCommands

	aStringOfCommands do: [:aCommand | 	self processCommand: aCommand.].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:04:18'!
processCommand: aCommand
	| commandToExecute |
	commandToExecute := commands at: aCommand ifAbsent: [self error: MarsRover commandIsInvalid].
	commandToExecute value.! !


!MarsRover methodsFor: 'initialization' stamp: 'gmcb 6/1/2022 22:10:43'!
initialize
	position := 0@0.
	direction := EastDirection new.
	commands :=  Dictionary newFromPairs: {$f . [position := direction moveForward: position] . $b . [position := direction moveBackward: position] . $l . [direction := direction nextLeftDirection] . $r . [direction := direction nextRightDirection]}! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExplorator'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 11:26:50'!
commandIsInvalid
	^'There is an invalid command in the received command set.'! !


!classDefinition: #MarsRoverDirection category: 'MarsRoverExplorator'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 21:39:23'!
moveBackward: aPosition
	self subclassResponsibility! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 21:39:36'!
moveForward: aPosition
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 21:39:52'!
nextLeftDirection
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 21:39:56'!
nextRightDirection
	self subclassResponsibility ! !


!classDefinition: #EastDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!EastDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:29:23'!
moveBackward: aPosition
	^aPosition + (-1@0)! !

!EastDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (1@0)! !

!EastDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:10:55'!
nextLeftDirection
	^NorthDirection new! !

!EastDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:11:03'!
nextRightDirection
	^SouthDirection new! !


!classDefinition: #NorthDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!NorthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:29:46'!
moveBackward: aPosition
	^aPosition + (0@-1)! !

!NorthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (0@1)! !

!NorthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:11:11'!
nextLeftDirection
	^WestDirection new! !

!NorthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:10:43'!
nextRightDirection
	^EastDirection new! !


!classDefinition: #SouthDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!SouthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:29:01'!
moveBackward: aPosition
	^aPosition + (0@1)! !

!SouthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (0@-1)! !

!SouthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:10:43'!
nextLeftDirection
	^EastDirection new! !

!SouthDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:11:11'!
nextRightDirection
	^WestDirection new! !


!classDefinition: #WestDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!WestDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:29:12'!
moveBackward: aPosition
	^aPosition + (1@0)! !

!WestDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (-1@0)! !

!WestDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:11:03'!
nextLeftDirection
	^SouthDirection new! !

!WestDirection methodsFor: 'as yet unclassified' stamp: 'gmcb 6/1/2022 22:10:55'!
nextRightDirection
	^NorthDirection new! !
