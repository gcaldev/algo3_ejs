!classDefinition: #MarsRoverTest category: 'MarsRoverExplorator'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:37:14'!
test01
	| marsRover |
	marsRover := MarsRover new.
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:47:28'!
test02
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'f'.
	self deny: (0@0 = (marsRover position))! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:51:52'!
test03
	| marsRover |
	marsRover := MarsRover new.
	self assert: #E equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:56:09'!
test04
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'b'.
	self assert: -1@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:18:22'!
test05
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'ffb'.
	self assert: 1@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:45:14'!
test06
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'l'.
	self assert: #N equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:25:12'!
test07
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'll'.
	self assert: #W equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:44:32'!
test08
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'r'.
	self assert: #S equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:51:06'!
test09
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rr'.
	self assert: #W equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:20:06'!
test10
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rf'.
	self assert: #S equals: marsRover direction.
	self assert: 0@-1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:36:07'!
test11
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rrf'.
	self assert: #W equals: marsRover direction.
	self assert: -1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:38:15'!
test12
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rrrf'.
	self assert: #N equals: marsRover direction.
	self assert: 0@1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:39:03'!
test13
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rrrlf'.
	self assert: #W equals: marsRover direction.
	self assert: -1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:44:21'!
test14
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'lb'.
	self assert: #N equals: marsRover direction.
	self assert: 0@-1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:48:20'!
test15
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'llb'.
	self assert: #W equals: marsRover direction.
	self assert: 1@0 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:53:27'!
test16
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'lllb'.
	self assert: #S equals: marsRover direction.
	self assert: 0@1 equals: marsRover position.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 11:27:22'!
test17
	| marsRover |
	marsRover := MarsRover new.
	self should:[marsRover command: 'ffxbbbb']
	raise: Error
	withExceptionDo: [:anError |
	self assert: MarsRover commandIsInvalid equals: anError messageText.
	self assert: 2@0 equals: marsRover position.
	]
	! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction nextDirections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 11:23:42'!
command: aString

	aString do: [:aChar | 	self processCommand: aChar.].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:22:20'!
direction
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 11:36:45'!
processCommand: aCommand
	(aCommand = $f) ifTrue: [		
		(direction = #E) ifTrue: [^position := position + (1@0)].
		(direction = #N) ifTrue: [^position := position + (0@1)].
		(direction = #W) ifTrue: [^position := position + (-1@0)].
		(direction = #S) ifTrue: [^position := position + (0@-1)].
	].
	(aCommand = $b) ifTrue: [
		(direction = #E) ifTrue: [^position := position + (-1@0)].
		(direction = #N) ifTrue: [^position := position + (0@-1)].
		(direction = #W) ifTrue: [^position := position + (1@0)].
		(direction = #S) ifTrue: [^position := position + (0@1)].
		].
	(aCommand = $l) ifTrue: [^self rotateLeft.].
	(aCommand = $r) ifTrue: [^self rotateRight.].
	self error: MarsRover commandIsInvalid.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 10:52:13'!
rotateLeft
	nextDirections addLast: direction.
	direction := nextDirections first.
	nextDirections removeFirst.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:48:05'!
rotateRight
	nextDirections addFirst: direction.
	direction := nextDirections last.
	nextDirections removeLast.! !


!MarsRover methodsFor: 'initialization' stamp: 'smb 5/29/2022 19:42:57'!
initialize
	position := 0@0.
	direction := #E.
	nextDirections := OrderedCollection new.
	nextDirections addFirst: #S.
	nextDirections addFirst: #W.
	nextDirections addFirst: #N.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverExplorator'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'gmcb 5/30/2022 11:26:50'!
commandIsInvalid
	^'There is an invalid command in the received command set.'! !
