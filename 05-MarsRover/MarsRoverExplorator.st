!classDefinition: #MarsRoverTest category: 'MarsRoverExplorator'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRoverTest methodsFor: 'tests - private' stamp: 'smb 6/2/2022 01:03:33'!
commands: aStringOfCommands toMarsRover: aMarsRover assertDirection: aSpectedMarsRoverDirection
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aSpectedMarsRoverDirection equals: aMarsRover direction.! !

!MarsRoverTest methodsFor: 'tests - private' stamp: 'smb 6/2/2022 01:06:19'!
commands: aStringOfCommands toMarsRover: aMarsRover assertDirection: aSpectedMarsRoverDirection assertPosition: aSpectedPositionPoint
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aSpectedMarsRoverDirection equals: aMarsRover direction.
	self assert: aSpectedPositionPoint equals: aMarsRover position.! !

!MarsRoverTest methodsFor: 'tests - private' stamp: 'smb 6/2/2022 01:01:06'!
commands: aStringOfCommands toMarsRover: aMarsRover assertPosition: aSpectedPositionPoint
	aMarsRover executeCommands: aStringOfCommands .
	self assert: aSpectedPositionPoint equals: aMarsRover position.! !

!MarsRoverTest methodsFor: 'tests - private' stamp: 'smb 6/2/2022 01:15:16'!
setUp
	marsRover := MarsRover new.! !


!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test01WhenIsCreatedItsPositionIsInitialPosition
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test02SendingAMovementCommandChangesItsInitialPosition
	marsRover executeCommands: 'f'.
	self deny: (0@0 = (marsRover  position))! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test03WhenIsCreatedItsDirectionIsInitialDirection
	self assert: EastDirection equals: marsRover  direction.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test04ReceivingABackwardCommandMoveBackItsPosition
	self commands: 'b' toMarsRover: marsRover  assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test05ReceivingMultipleMovementsCommdansMovesItsPositionToRightPosition
	self commands: 'ffb' toMarsRover: marsRover   assertPosition: 1@0.
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test06ReceivingALeftRotateCommandRotatesItsDirectionOnePlaceToLeft
	self commands: 'l' toMarsRover: marsRover   assertDirection: NorthDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test07ReceivingVariousLeftRotateCommandsRotatesItsDirectionToTheCorrectDirection
	self commands: 'll' toMarsRover: marsRover  assertDirection: WestDirection.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test08ReceivingARightRotateCommandRotatesItsDirectionOnePlaceToRight
	self commands: 'r' toMarsRover: marsRover  assertDirection: SouthDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test09ReceivingVariousRightRotateCommandsRotatesItsDirectionToTheCorrectDirection
	self commands: 'rr' toMarsRover: marsRover  assertDirection: WestDirection .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test10ReceivingARightRotatingAndAForwardCommandMovesItsPositionOnePlaceToSouthDirection
	self commands: 'rf' toMarsRover: marsRover  assertDirection: SouthDirection assertPosition:  0@-1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test11ReceivingTwoRightRotatingAndAForwardCommandMovesItsPositionOnePlaceToWestDirection
	self commands: 'rrf' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test12ReceivingThreeRightRotatingAndAForwardCommandMovesItsPositionOnePlaceToNorthDirection
	self commands: 'rrrf' toMarsRover: marsRover  assertDirection: NorthDirection assertPosition: 0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test13ReceivingThreeRightRotatingALeftRotationAndAForwardCommandMovesItsPositionOnePlaceToWestDirection
	self commands: 'rrrlf' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: -1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test14ReceivingALeftRotatingAndABackwardsCommandMovesBackItsPositionOnePlaceToNorthDirection
	self commands: 'lb' toMarsRover: marsRover   assertDirection: NorthDirection  assertPosition:  0@-1 .! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test15ReceivingTwoLetftRotatingAndABackwardCommandMovesBackItsPositionOnePlaceToWestDirection
	self commands: 'llb' toMarsRover: marsRover  assertDirection: WestDirection assertPosition: 1@0.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test16ReceivingThreeLeftRotatingAndABackwardCommandMovesBackItsPositionOnePlaceToSouthDirection
	self commands: 'lllb' toMarsRover: marsRover  assertDirection: SouthDirection assertPosition:  0@1.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'smb 6/2/2022 01:15:16'!
test17ReceivingAInvalidCommandStopsCommandsExecution
	self should:[marsRover  executeCommands: 'ffxbbbb']
	raise: Error
	withExceptionDo: [:anError |
	self assert: MarsRover commandIsInvalid equals: anError messageText.
	self assert: 2@0 equals: marsRover  position.
	]
	! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction nextDirections commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'placement' stamp: 'gmcb 6/1/2022 21:23:40'!
direction
	^direction class! !

!MarsRover methodsFor: 'placement' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !


!MarsRover methodsFor: 'initialization' stamp: 'gmcb 6/1/2022 22:10:43'!
initialize
	position := 0@0.
	direction := EastDirection new.
	commands :=  Dictionary newFromPairs: {$f . [position := direction moveForward: position] . $b . [position := direction moveBackward: position] . $l . [direction := direction nextLeftDirection] . $r . [direction := direction nextRightDirection]}! !


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
