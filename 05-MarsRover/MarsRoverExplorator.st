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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:21:37'!
test06
	| marsRover |
	marsRover := MarsRover new.
	marsRover command:'l'.
	self assert: #N equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:25:12'!
test07
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'll'.
	self assert: #W equals: marsRover direction.! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:23:03'!
command: aString
	| index actualChar |
	index := 1.
	[index <= aString size] whileTrue: [
		actualChar := aString at: index.
		(actualChar = $f) ifTrue: [
			position := position + (1@0).
			].
		(actualChar = $b) ifTrue: [
			position := position + (-1@0).
			].
		(actualChar = $l) ifTrue: [
			self rotateLeft.
			].
		
		index := index + 1.
		].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:22:20'!
direction
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:23:42'!
initialize
	position := 0@0.
	direction := #E! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:23:28'!
rotateLeft
	direction := #N! !
