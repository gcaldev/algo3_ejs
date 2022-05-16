!classDefinition: #OOLimitedStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOLimitedStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStackTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 00:34:57'!
test01CanNotPushMoreElementsThanCapacity
	| limitedStack |
	limitedStack := OOLimitedStack initializeWith: 3.
	limitedStack push: 'please'.
	limitedStack push: 'approve'.
	limitedStack push: 'our'.

	self
		should: [ 	limitedStack push: 'exercise'.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackCanNotStoreMoreElements ].
		! !

!OOLimitedStackTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 00:35:10'!
test02ReachTheLimitPopAnElementAndPushMoreElements
	| limitedStack |
	limitedStack := OOLimitedStack initializeWith: 3.
	limitedStack push: 'please'.
	limitedStack push: 'approve'.
	limitedStack push: 'our'.

	limitedStack pop.
	limitedStack push: 'exercise'.

	self
		should: [ 	limitedStack push: ':)'.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackCanNotStoreMoreElements ].
		! !


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
	instanceVariableNames: 'emptyStack stackWithOneElement testSentence1 testSentence2 testSentence3 testSentence4 testSentence5 stackWithASentenceThatBeginsWithSpaces testSentence6 stackWithTwoMatchedPrefix stackWithTwoMatchedPrefixCopy prefixWithSpaceInTheMiddle emptyPrefix prefixWithAStartingSpace prefixInTheMiddleOfSentence testingPrefix stackWithThreeElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'gmcb 5/16/2022 11:38:49'!
setUp
	
	emptyStack := OOStack new.
	testingPrefix := 'plea'.
	prefixInTheMiddleOfSentence := 'exer'.
	prefixWithAStartingSpace := ' plea'.
	emptyPrefix := ''.
	prefixWithSpaceInTheMiddle := 'ple as'.
	
	testSentence1 := 'Please approve our exercise :)'.
	testSentence2 := 'please approve our exercise :)'.
	testSentence3 := 'Approve our exercise :)'.
	testSentence4 := 'our exercise :)'.
	testSentence5 := '   please approve our exercise :)'.
	testSentence6 := 'please approve this exercise'.

	stackWithOneElement := OOStack new.
	stackWithOneElement push: testSentence1.
	
	stackWithThreeElements := OOStack new.
	stackWithThreeElements push: testSentence2.
	stackWithThreeElements push: testSentence3.
	stackWithThreeElements push: testSentence4.
	
	stackWithASentenceThatBeginsWithSpaces := OOStack new.
	stackWithASentenceThatBeginsWithSpaces push: testSentence3.
	stackWithASentenceThatBeginsWithSpaces push: testSentence4.
	stackWithASentenceThatBeginsWithSpaces push: testSentence5.
	
	stackWithTwoMatchedPrefix := OOStack new.
	stackWithTwoMatchedPrefix push: testSentence2.
	stackWithTwoMatchedPrefix push: testSentence4.
	stackWithTwoMatchedPrefix push: testSentence6.
	
	stackWithTwoMatchedPrefixCopy := OOStack new.
	stackWithTwoMatchedPrefixCopy push: testSentence2.
	stackWithTwoMatchedPrefixCopy push: testSentence4.
	stackWithTwoMatchedPrefixCopy push: testSentence6.
	! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:21:50'!
test01SameSentenceWithDifferentTypecaseShouldNotMatch
	| finder |

	finder := SentenceFinderByPrefix initializeWith: stackWithOneElement.
	self assert: (finder find: testingPrefix) isEmpty.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:39:15'!
test02ThePrefixShouldBeFoundOnce
	| finder foundSentences |

	finder := SentenceFinderByPrefix initializeWith: stackWithThreeElements.
	foundSentences := finder find: testingPrefix .
	self assert: foundSentences size equals: 1.
	self assert: (foundSentences at:1) = testSentence2.	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 00:50:49'!
test03TheSentenceBeginsWithSpaces
	| finder foundSentences |

	
	finder := SentenceFinderByPrefix initializeWith: stackWithASentenceThatBeginsWithSpaces .
	foundSentences := finder find: testingPrefix.
	self assert: foundSentences size equals: 0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:39:21'!
test04TheSentenceDoesNotBeginWithThePrefix
	| finder foundSentences|

	finder := SentenceFinderByPrefix initializeWith: stackWithThreeElements.
	foundSentences := finder find: prefixInTheMiddleOfSentence.
	self assert: foundSentences size equals: 0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:22:32'!
test05TwoSentencesBeginsWithThePrefix
	| finder foundSentences expectedSentences |


	finder := SentenceFinderByPrefix initializeWith: stackWithTwoMatchedPrefix .
	foundSentences := finder find: testingPrefix.
	expectedSentences := OrderedCollection new.
	expectedSentences add: testSentence2.
	expectedSentences add: testSentence6.	
	self assert: foundSentences size equals: 2.
	self assert: foundSentences = foundSentences.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:26:08'!
test06NothingIsFoundInAnEmptyStack
	| finder foundSentences |
	finder := SentenceFinderByPrefix initializeWith: emptyStack .
	foundSentences := finder find: testingPrefix .
	
	self assert: foundSentences size equals: 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:26:15'!
test07CanNotUseAnEmptyPrefix
	| finder |
	finder := SentenceFinderByPrefix initializeWith: emptyStack.	
	
	self 
		should: [ finder find: emptyPrefix .]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorEmptyPrefix equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:26:22'!
test08CanNotUseAPrefixBeginingWithEmptySpace
	| finder |
	finder := SentenceFinderByPrefix initializeWith: stackWithOneElement.	
	
	self 
		should: [ finder find: prefixWithAStartingSpace.]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorPrefixCanNotContainSpaces equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:26:28'!
test09CanNotUseAPrefixThatContainsASpace
	| finder |
	
	finder := SentenceFinderByPrefix initializeWith: emptyStack .	
	
	self 
		should: [ finder find: prefixWithSpaceInTheMiddle .]
		raise: Error
		withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix errorPrefixCanNotContainSpaces equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gmcb 5/16/2022 11:25:24'!
test10StackElementsStaysInSameOrder
	| finder |

	finder := SentenceFinderByPrefix initializeWith: stackWithTwoMatchedPrefix .
	finder find: testingPrefix .

	self assert: stackWithTwoMatchedPrefix size equals: stackWithTwoMatchedPrefixCopy size	.
	[stackWithTwoMatchedPrefix isEmpty] whileFalse: [		self assert: stackWithTwoMatchedPrefix pop equals: stackWithTwoMatchedPrefixCopy pop.	].! !


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


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'initialization' stamp: 'gmcb 5/16/2022 00:10:41'!
setCapacity: maxNumberOfElements
	capacity := maxNumberOfElements.! !


!OOLimitedStack methodsFor: 'stack-behaviour' stamp: 'gmcb 5/16/2022 00:14:55'!
push: aStringToBeStored
	| newTop |
	(size = capacity)ifTrue: [self error: OOLimitedStack stackCanNotStoreMoreElements ].
	
	newTop := StackElement initializeWith: aStringToBeStored.
	newTop beOver: topNode.
	topNode := newTop.	
	size := size + 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'initialization' stamp: 'gmcb 5/16/2022 00:10:59'!
initializeWith: maxNumberOfElements
	| limitedStack |
	limitedStack := OOLimitedStack new.
	limitedStack setCapacity: maxNumberOfElements.
	^limitedStack.! !


!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'gmcb 5/16/2022 00:14:32'!
stackCanNotStoreMoreElements
	^ 'There is no more space to store an element.'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack auxiliarStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'smb 5/15/2022 20:46:22'!
checkAPrefixIsValid: aPrefix
	(aPrefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix errorPrefixCanNotContainSpaces ].
	(aPrefix isEmpty) ifTrue: [self error: SentenceFinderByPrefix errorEmptyPrefix ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'gmcb 5/15/2022 22:49:24'!
emptyAuxiliarStackAndFillStack
	| actualString |
	[auxiliarStack isEmpty] whileFalse: [ 
		actualString := auxiliarStack pop.
		stack push: actualString.
	].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'gmcb 5/15/2022 23:05:40'!
verifyThatSentencePrefixMatches: aPrefix AndAddItTo: anOrderCollection
	| actualString |
	
	actualString := stack pop.					
	(actualString beginsWith: aPrefix) ifTrue: 		[anOrderCollection add: actualString].			
	auxiliarStack push: actualString.			! !


!SentenceFinderByPrefix methodsFor: 'finder-behaviour' stamp: 'gmcb 5/15/2022 23:05:40'!
find: aString
	| foundStrings |
	
	self checkAPrefixIsValid: aString.
	foundStrings := OrderedCollection new.
	[stack isEmpty] whileFalse: 		[self verifyThatSentencePrefixMatches: aString AndAddItTo: foundStrings].
	
	self emptyAuxiliarStackAndFillStack.
	^foundStrings.! !


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
