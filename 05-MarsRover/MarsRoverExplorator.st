!classDefinition: #MarsRoverTest category: 'MarsRoverExplorator'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRoverTest methodsFor: 'tests - private' stamp: 'gmcb 6/2/2022 10:48:26'!
commands: aStringOfCommands toMarsRover: aMarsRover assertDirection: aDirection
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aDirection equals: aMarsRover direction.! !

!MarsRoverTest methodsFor: 'tests - private' stamp: 'gmcb 6/2/2022 10:49:03'!
commands: aStringOfCommands toMarsRover: aMarsRover assertDirection: aDirection assertPosition: aPosition
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aDirection equals: aMarsRover direction.
	self assert: aPosition equals: aMarsRover position.! !

!MarsRoverTest methodsFor: 'tests - private' stamp: 'gmcb 6/2/2022 10:49:14'!
commands: aStringOfCommands toMarsRover: aMarsRover assertPosition: aPosition
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aPosition equals: aMarsRover position.! !


!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test01WhenIsCreatedItsPositionIsInitialPosition
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 10:55:18'!
test02WhenIsCreatedItsDirectionIsInitialDirection
	self assert: EastDirection equals: marsRover  direction.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 10:55:25'!
test03SendingAMovementCommandChangesItsInitialPosition
	marsRover executeCommands: 'f'.
	self deny: (0@0 = (marsRover  position))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 10:56:32'!
test04SendingABackwardCommandMovesBackItsPosition
	self commands: 'b' toMarsRover: marsRover  assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 10:57:50'!
test05SendingMultipleMovementCommandsMovesItsPositionToRightPosition
	self commands: 'ffb' toMarsRover: marsRover   assertPosition: 1@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:00:38'!
test06SendingALeftRotateCommandRotatesItsDirectionToLeft
	self commands: 'l' toMarsRover: marsRover   assertDirection: NorthDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:01:50'!
test07SendingMultipleLeftRotateCommandsRotatesItsDirectionCorrectly
	self commands: 'll' toMarsRover: marsRover  assertDirection: WestDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:02:21'!
test08SendingARightRotateCommandRotatesItsDirectionToRight
	self commands: 'r' toMarsRover: marsRover  assertDirection: SouthDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:02:51'!
test09SendingMultipleRightRotateCommandsRotatesItsDirectionCorrectly
	self commands: 'rr' toMarsRover: marsRover  assertDirection: WestDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:07:53'!
test10SendingARightRotateAndAForwardCommandMovesItForwardInSouthDirection
	self commands: 'rf' toMarsRover: marsRover  assertDirection: SouthDirection assertPosition:  0@-1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:06:23'!
test11SendingTwoRightRotateAndAForwardCommandMovesItForwardInWestDirection
	self commands: 'rrf' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:08:42'!
test12SendingThreeRightRotateAndAForwardCommandMovesItForwardInNorthDirection
	self commands: 'rrrf' toMarsRover: marsRover  assertDirection: NorthDirection assertPosition: 0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:10:38'!
test13SendingThreeRightRotateALeftRotateAndAForwardCommandMovesItForwardInWestDirection
	self commands: 'rrrlf' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:11:38'!
test14SendingALeftRotateAndABackwardCommandMovesItBackwardsInNorthDirection
	self commands: 'lb' toMarsRover: marsRover   assertDirection: NorthDirection  assertPosition:  0@-1 .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:14:51'!
test15SendingTwoLeftRotateAndABackwardCommandMovesItBackwardInWestDirection
	self commands: 'llb' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: 1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:15:33'!
test16SendingThreeLeftRotateAndABackwardCommandMovesItBackwardInSouthDirection
	self commands: 'lllb' toMarsRover: marsRover  assertDirection: SouthDirection assertPosition:  0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'gmcb 6/2/2022 11:16:41'!
test17SendingAnInvalidCommandStopsCommandsExecution
	self should:[marsRover  executeCommands: 'ffxbbbb']
	raise: Error
	withExceptionDo: [:anError |
	self assert: MarsRover commandIsInvalid equals: anError messageText.
	self assert: 2@0 equals: marsRover  position.
	]
	! !


!MarsRoverTest methodsFor: 'setup' stamp: 'smb 6/2/2022 01:15:16'!
setUp
	marsRover := MarsRover new.! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'initialization' stamp: 'gmcb 6/1/2022 22:10:43'!
initialize
	position := 0@0.
	direction := EastDirection new.
	commands :=  Dictionary newFromPairs: {$f . [position := direction moveForward: position] . $b . [position := direction moveBackward: position] . $l . [direction := direction nextLeftDirection] . $r . [direction := direction nextRightDirection]}! !


!MarsRover methodsFor: 'placement' stamp: 'gmcb 6/1/2022 21:23:40'!
direction
	^direction class! !

!MarsRover methodsFor: 'placement' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !


!MarsRover methodsFor: 'commands' stamp: 'gmcb 6/1/2022 22:14:01'!
executeCommands: aStringOfCommands

	aStringOfCommands do: [:aCommand | 	self processCommand: aCommand.].! !

!MarsRover methodsFor: 'commands' stamp: 'gmcb 6/1/2022 22:04:18'!
processCommand: aCommand
	| commandToExecute |
	commandToExecute := commands at: aCommand ifAbsent: [self error: MarsRover commandIsInvalid].
	commandToExecute value.! !

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

!MarsRoverDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 21:39:52'!
nextLeftDirection
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 21:39:56'!
nextRightDirection
	self subclassResponsibility ! !


!MarsRoverDirection methodsFor: 'movements' stamp: 'gmcb 6/1/2022 21:39:23'!
moveBackward: aPosition
	self subclassResponsibility! !

!MarsRoverDirection methodsFor: 'movements' stamp: 'gmcb 6/1/2022 21:39:36'!
moveForward: aPosition
	self subclassResponsibility ! !


!classDefinition: #EastDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #EastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!EastDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:10:55'!
nextLeftDirection
	^NorthDirection new! !

!EastDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:11:03'!
nextRightDirection
	^SouthDirection new! !


!EastDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:29:23'!
moveBackward: aPosition
	^aPosition + (-1@0)! !

!EastDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (1@0)! !


!classDefinition: #NorthDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #NorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!NorthDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:11:11'!
nextLeftDirection
	^WestDirection new! !

!NorthDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:10:43'!
nextRightDirection
	^EastDirection new! !


!NorthDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:29:46'!
moveBackward: aPosition
	^aPosition + (0@-1)! !

!NorthDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (0@1)! !


!classDefinition: #SouthDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #SouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!SouthDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:10:43'!
nextLeftDirection
	^EastDirection new! !

!SouthDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:11:11'!
nextRightDirection
	^WestDirection new! !


!SouthDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:29:01'!
moveBackward: aPosition
	^aPosition + (0@1)! !

!SouthDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (0@-1)! !


!classDefinition: #WestDirection category: 'MarsRoverExplorator'!
MarsRoverDirection subclass: #WestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!WestDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:11:03'!
nextLeftDirection
	^SouthDirection new! !

!WestDirection methodsFor: 'rotations' stamp: 'gmcb 6/1/2022 22:10:55'!
nextRightDirection
	^NorthDirection new! !


!WestDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:29:12'!
moveBackward: aPosition
	^aPosition + (1@0)! !

!WestDirection methodsFor: 'movements' stamp: 'gmcb 5/31/2022 22:28:42'!
moveForward: aPosition
	^aPosition + (-1@0)! !
