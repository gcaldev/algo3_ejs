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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'gmcb 5/15/2022 00:16:25'!
test01SameSentenceWithDifferentCaseShouldNotMatch
	| stack string stringWithUpperCase finder |
	stack := OOStack new.
	string := 'please'.
	stringWithUpperCase := 'Please approve our exercise :)'.
	stack push: stringWithUpperCase.
	finder := SentenceFinderByPrefix initializeWith: stack.
	self assert: (finder find: string) isEmpty.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'gmcb 5/15/2022 00:26:35'!
test02TheWordShouldBeFindOnce
	| stack string sentence1 sentence2 sentence3 finder |
	stack := OOStack new.
	string := 'please'.
	sentence1 := 'please approve our exercise :)'.
	sentence2 := 'Approve our exercise :)'.
	sentence3 := 'our exercise :)'.

	stack push: sentence1 .
	stack push: sentence2 .
	stack push: sentence3.

	finder := SentenceFinderByPrefix initializeWith: stack.
	self assert: (finder find: string) size = 1.
	self assert: ((finder find: string) at:1) = sentence1.	
	! !


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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'gmcb 5/15/2022 00:17:53'!
find: aString
	| foundStrings actualString |
	foundStrings := OrderedCollection new.
	[stack isEmpty] whileFalse: 		[
			actualString := stack pop.
			(self mmm: aString isPrefixOf: actualString) = 1 ifTrue: 		[foundStrings add: actualString].
			auxiliarStack push: actualString.			
	].
	[auxiliarStack isEmpty] whileFalse: [
		actualString := auxiliarStack pop.
		stack push: actualString.
	].
	^foundStrings.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'gmcb 5/14/2022 23:43:00'!
mmm: string
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'gmcb 5/15/2022 00:09:13'!
mmm: aString isPrefixOf: anotherString
	^(anotherString findString: aString)  = 1.

! !


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
