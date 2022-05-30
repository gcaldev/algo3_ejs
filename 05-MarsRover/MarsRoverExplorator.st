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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:54:54'!
test10
	| marsRover |
	marsRover := MarsRover new.
	marsRover command: 'rf'.
	self assert: #S equals: marsRover direction.
	
! !


!classDefinition: #MarsRover category: 'MarsRoverExplorator'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction nextDirections'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverExplorator'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:45:33'!
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
		(actualChar = $r) ifTrue: [
			self rotateRight.
			].
		index := index + 1.
		].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 19:22:20'!
direction
	^direction! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'gmcb 5/29/2022 18:48:00'!
position
	^position! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'smb 5/29/2022 19:41:52'!
rotateLeft
	nextDirections addLast: direction.
	direction := nextDirections first.
	nextDirections removeFirst.
	
	
	
	"
	actual ->			E
	    		   N W S
	
				N
			    W S E			
	"! !

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
