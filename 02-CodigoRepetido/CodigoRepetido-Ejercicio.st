!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:13:52'!
codigorep2:param1 p:param2 r:param3
"
	self assert: param1 equals: customerBook numberOfActiveCustomers.
	self assert: param2 equals: customerBook numberOfSuspendedCustomers.
	self assert: param3 equals: customerBook numberOfCustomers."! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:02:55'!
hacer: unBloque antesDe: milisegundosACumplir
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	[unBloque value].
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milisegundosACumplir * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:17:59'!
hayActivos:hayActivos haySuspendidos:haySuspendidos hayTotales:hayTotales en:unCustomerBook

	self assert: hayActivos equals: unCustomerBook numberOfActiveCustomers.
	self assert: haySuspendidos equals: unCustomerBook numberOfSuspendedCustomers.
	self assert: hayTotales equals: unCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:28:53'!
suspenderA: unCustomer enElBook: unCustomerBook

	[ unCustomerBook suspendCustomerNamed: unCustomer .
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: unCustomerBook numberOfCustomers = 1.
			self assert: (unCustomerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:02:55'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self hacer: [customerBook addCustomerNamed: 'John Lennon'.] antesDe: 50.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:02:55'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	 
	self hacer: [	customerBook removeCustomerNamed: paulMcCartney.] antesDe: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:36:58'!
test04CanNotRemoveAnInvalidCustomer
	"Se parece a test 8 y 7"
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:18:41'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self hayActivos:0  haySuspendidos:1  hayTotales:1  en:customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:19:10'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self hayActivos: 0  haySuspendidos: 0  hayTotales: 0  en: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:29:29'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self suspenderA:'Ringo Starr'  enElBook: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 10:30:00'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self suspenderA: johnLennon enElBook: customerBook.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 4/29/2022 11:07:08'!
test09
	| customerBook p1 p2 |
	customerBook  := CustomerBook new.
	customerBook addCustomerNamed: 'p'.
	customerBook addCustomerNamed: 'x'.
	customerBook suspendCustomerNamed: 'x'.
	p1:= customerBook removeCustomerNamed: 'p'.
	p2:= customerBook removeCustomerNamed: 'x'.
	 
	self assert: 'p' equals: p1.
	self assert: p2 equals: 'x'.
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'gmcb 4/29/2022 10:04:57'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'gmcb 4/29/2022 11:10:40'!
removeCustomerNamed: aName 

	^ active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^ NotFound signal.]].
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
