!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack stackWithOneElement stackWithThereeElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'smb 5/15/2022 21:18:25'!
setUp
	
	emptyStack := OOStack new.
	
	stackWithOneElement := OOStack new.
	stackWithOneElement push: 'Please approve our exercise :)'.
	
	stackWithThereeElements := OOStack new.
	stackWithThereeElements push: 'please approve our exercise :)'.
	stackWithThereeElements push: 'Approve our exercise :)'.
	stackWithThereeElements push: 'our exercise :)'.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 21:16:39'!
test01SameSentenceWithDifferentCaseShouldNotMatch
	| string finder |
	
	string := 'please'.
	finder := SentenceFinderByPrefix initializeWith: stackWithOneElement.
	self assert: (finder find: string) isEmpty.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 00:38:21'!
test02TheWordShouldBeFindOnce
	| stack string sentence1 sentence2 sentence3 finder oc|
	stack := OOStack new.
	string := 'please'.
	sentence1 := 'please approve our exercise :)'.
	sentence2 := 'Approve our exercise :)'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	oc := finder find: string.
	self assert: oc size equals: 1.
	self assert: (oc at:1) = sentence1.	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 00:40:06'!
test03TheSentenceBeginsWithSpaces
	| stack string sentence1 sentence2 sentence3 finder oc|
	stack := OOStack new.
	string := 'please'.
	sentence1 := '   please approve our exercise :)'.
	sentence2 := 'Approve our exercise :)'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	oc := finder find: string.
	self assert: oc size equals: 0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 11:06:32'!
test04TheSentenceDoNotBeginsWithTheWord
	| stack string sentence1 sentence2 sentence3 finder oc|
	stack := OOStack new.
	string := 'exercise'.
	sentence1 := 'please approve our exercise :)'.
	sentence2 := 'Approve our exercise :)'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	oc := finder find: string.
	self assert: oc size equals: 0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 00:46:30'!
test05ThereIsTwoSentenceWithTheSearchedWord
	| stack string sentence1 sentence2 sentence3 finder oc assertOC |
	stack := OOStack new.
	string := 'please'.
	sentence1 := 'please approve our exercise :)'.
	sentence2 := 'please approve this exercise'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	oc := finder find: string.
	assertOC := OrderedCollection new.
	assertOC add: sentence2 .
	assertOC add: sentence1 .	
	self assert: oc size equals: 2.
	self assert: oc = oc.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 11:33:03'!
test06CrashesIfThePrefixBeginsWithASpace
	| stack string finder |
	stack := OOStack new.
	string := ' please'.
	finder := SentenceFinderByPrefix initializeWith: stack.	
	
	self 
		should: [ finder find: string.]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorPrefixCanNotContainSpaces equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 01:10:42'!
test07StacksElementStayInSameOrder
	| stack stack2 string sentence1 sentence2 sentence3 finder |
	stack := OOStack new.
	string := 'please'.
	sentence1 := 'please approve our exercise :)'.
	sentence2 := 'please approve this exercise'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	finder find: string.

	stack2 := OOStack new.
	stack2 push: sentence1 .
	stack2 push: sentence2 .
	stack2 push: sentence3.

	self assert: stack size equals: stack2 size	.
	[stack isEmpty] whileFalse: [		self assert: stack pop equals: stack2 pop.	].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 21:14:09'!
test08FindNothingWithAEmptyStack
	| string finder oc|
	string := 'please'.
	finder := SentenceFinderByPrefix initializeWith: emptyStack .
	oc := finder find: string.
	
	self assert: oc size equals: 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 11:38:31'!
test09CrashesSearchingAEmptyPrefix
	| stack string finder |
	stack := OOStack new.
	string := ''.
	finder := SentenceFinderByPrefix initializeWith: stack.	
	
	self 
		should: [ finder find: string.]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorEmptyPrefix equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'smb 5/15/2022 11:39:43'!
test10CrashesIfThePrefixContainsASpace
	| stack string finder |
	stack := OOStack new.
	string := 'plea se'.
	finder := SentenceFinderByPrefix initializeWith: stack.	
	
	self 
		should: [ finder find: string.]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorPrefixCanNotContainSpaces equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'gmcb 5/15/2022 15:55:06'!
test11WordSeparatedBySpacesIsNotConsidered
	| stack string finder sentence1 |
	stack := OOStack new.
	string := 'please'.
	sentence1 := 'p l e a s e approve our exercise :)'.
	stack push: sentence1.
	finder := SentenceFinderByPrefix initializeWith: stack.
	self assert: 0 equals: (finder find: string) size.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'gmcb 5/14/2022 21:32:59'!
initialize
	topNode := StackBase new.
	size := 0.! !


!OOStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/14/2022 21:35:27'!
isEmpty
	^topNode isEmpty.! !

!OOStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/14/2022 23:12:27'!
pop
	| element |.
	element := topNode value.
	topNode := topNode nextNode.
	size:=size-1.
	^element! !

!OOStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/14/2022 21:43:38'!
push: aStringToBeStored
	| newTop |
	newTop := StackElement initializeWith: aStringToBeStored.
	newTop beOver: topNode.
	topNode := newTop.	
	size := size + 1! !

!OOStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/12/2022 20:52:02'!
size
	^size.! !

!OOStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/14/2022 23:11:49'!
top
	| element |.
	element := topNode value.
	^element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'gmcb 5/14/2022 21:35:13'!
stackEmptyErrorDescription
	^'Stack is empty'.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack auxiliarStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 20:46:22'!
checkAPrefixIsValid: aPrefix
	(aPrefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix errorPrefixCanNotContainSpaces ].
	(aPrefix isEmpty) ifTrue: [self error: SentenceFinderByPrefix errorEmptyPrefix ].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 21:06:12'!
find: aString
	| foundStrings actualString |
	
	self checkAPrefixIsValid: aString.
	foundStrings := OrderedCollection new.
	[stack isEmpty] whileFalse: 		[
			actualString := stack pop.					
			(actualString beginsWith: aString) ifTrue: 		[foundStrings add: actualString].			
			auxiliarStack push: actualString.			
	].
	self takeOffAllElementsOfStack: auxiliarStack andPushThemInto: stack.
	^foundStrings.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 20:57:52'!
takeOffAllElementsOfStack: aOOStack andPushThemInto: anotherOOStack
	| actualString |
	[aOOStack isEmpty] whileFalse: [ 
		actualString := aOOStack pop.
		anotherOOStack push: actualString.
	].! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'gmcb 5/14/2022 20:27:42'!
setAuxiliarStack
	auxiliarStack := OOStack new.! !

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'gmcb 5/14/2022 20:23:58'!
setStack: aStack
	stack := aStack
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 01:02:39'!
erroPrefixCanNotBegginWithASpace
	^'A prefix can not beggin with a space'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 11:34:38'!
errorEmptyPrefix
	^'Prefix cant be a empty string'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'smb 5/15/2022 11:33:27'!
errorPrefixCanNotContainSpaces
	^'Prefixs can not contain empty spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'gmcb 5/14/2022 22:02:49'!
initializeWith: aStack
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder setStack: aStack.
	sentenceFinder setAuxiliarStack.
	^sentenceFinder.! !


!classDefinition: #StackNode category: 'Stack-Exercise'!
Object subclass: #StackNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackNode methodsFor: 'stack-node-behaviour' stamp: 'gmcb 5/14/2022 19:23:25'!
isEmpty
	self subclassResponsibility.! !

!StackNode methodsFor: 'stack-node-behaviour' stamp: 'gmcb 5/14/2022 23:11:19'!
value
	self subclassResponsibility.! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
StackNode subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'stack-base-behaviour' stamp: 'gmcb 5/14/2022 19:23:38'!
isEmpty
	^true! !

!StackBase methodsFor: 'stack-base-behaviour' stamp: 'gmcb 5/14/2022 23:11:19'!
value
	self error: 'Stack is empty'.! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
StackNode subclass: #StackElement
	instanceVariableNames: 'value over'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'stack-element-behaviour' stamp: 'gmcb 5/14/2022 21:40:30'!
beOver: aStackElement
	over:= aStackElement.! !

!StackElement methodsFor: 'stack-element-behaviour' stamp: 'gmcb 5/14/2022 19:38:42'!
isEmpty
	^false.! !

!StackElement methodsFor: 'stack-element-behaviour' stamp: 'gmcb 5/14/2022 23:12:46'!
nextNode
	^over.! !

!StackElement methodsFor: 'stack-element-behaviour' stamp: 'gmcb 5/14/2022 23:11:19'!
value
	^ value.! !


!StackElement methodsFor: 'initialization' stamp: 'gmcb 5/14/2022 21:48:16'!
store: aString
	value := aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'gmcb 5/14/2022 21:49:02'!
initializeWith: aString
	|newElement|
	newElement := StackElement new.
	newElement store: aString.
	^newElement .! !
