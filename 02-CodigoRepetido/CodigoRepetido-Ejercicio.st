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

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:53:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self verificarQueSeHace: [customerBook addCustomerNamed: 'John Lennon'.] antesDeMilisegundos: 50.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:53:16'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	 
	self verificarQueSeHace: [	customerBook removeCustomerNamed: paulMcCartney.] antesDeMilisegundos: 100.
	
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

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 22:06:57'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verificarEnUnBook: customerBook QueAlIntentarHacer:#removeCustomerNamed: juntoCon: 'Paul McCartney' generaElError: NotFound.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:45:54'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verificarEnUnBook: customerBook CantidadDeActivos: 0 CantidadDeSuspendidos: 1 CantidadTotal: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:45:34'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verificarEnUnBook: customerBook CantidadDeActivos: 0 CantidadDeSuspendidos: 0 CantidadTotal: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 22:04:23'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.

	customerBook addCustomerNamed: johnLennon.

	self verificarEnUnBook: customerBook QueAlIntentarHacer:#suspendCustomerNamed: juntoCon:'Ringo Starr' generaElError: CantSuspend.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 22:02:48'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self verificarEnUnBook: customerBook QueAlIntentarHacer:#suspendCustomerNamed: juntoCon:johnLennon generaElError: CantSuspend.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:44:02'!
verificarEnUnBook:unCustomerBook CantidadDeActivos: CantidadDeActivosEsperada CantidadDeSuspendidos: CantidadDeSuspendidosEsperada CantidadTotal: CantidadDeTotalEsperada

	self assert: CantidadDeActivosEsperada equals: unCustomerBook numberOfActiveCustomers.
	self assert: CantidadDeSuspendidosEsperada equals: unCustomerBook numberOfSuspendedCustomers.
	self assert: CantidadDeTotalEsperada equals: unCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 22:00:38'!
verificarEnUnBook: unCustomerBook QueAlIntentarHacer:unMensaje juntoCon:unColaborador generaElError: unErrorEsperado

	[ unMensaje sendTo:unCustomerBook with: unColaborador.
	self fail ]
		on: unErrorEsperado 
		do: [ :anError | 
			self assert: unCustomerBook numberOfCustomers = 1.
			self assert: (unCustomerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'gmcb 5/1/2022 21:53:16'!
verificarQueSeHace: unaAccion antesDeMilisegundos: milisegundosACumplir
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	[unaAccion value].
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milisegundosACumplir * millisecond)
	
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

!CustomerBook methodsFor: 'customer management' stamp: 'gmcb 5/1/2022 18:47:58'!
removeCustomerNamed: aName 

	^ active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal.]].
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'gmcb 5/1/2022 18:49:23'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal.].
	
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
