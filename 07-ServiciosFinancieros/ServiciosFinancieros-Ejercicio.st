!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 14:56:42'!
test01BalanceIsEqualToTotalAccountsBalance
	| account1 account2 accountsOC portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	accountsOC add: account2.
	
	portfolio := Portfolio with: accountsOC.
	
	self assert: 300 * peso equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 14:56:19'!
test02BalanceIsEqualToTotalAccountsBalanceWhenTheyAreDifferent
	| account1 account2 accountsOC portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 200 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	accountsOC add: account2.
	
	portfolio := Portfolio with: accountsOC.
	
	self assert: 400 * peso equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 14:57:51'!
test03BalanceIsEqualToContainingPortfolioBalance
	| account1 account2 accountsOC1 accountsOC2 portfolio1 portfolio2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 200 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	accountsOC1 := OrderedCollection new.
	accountsOC1 add: account1.
	accountsOC1 add: account2.
	
	portfolio1 := Portfolio with: accountsOC1.
	
	accountsOC2 := OrderedCollection new.
	accountsOC2 add: portfolio1. 
	
	portfolio2 := Portfolio with: accountsOC2.
	
	self assert: 400 * peso equals: portfolio2 balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:01:59'!
test04TransactionInAnAccountThatHasNotBeenIncludedIsNotRegistered
	| account1 account2 accountsOC portfolio transaction |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	transaction := Deposit register: 100 * peso on: account2.
	
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	
	portfolio := Portfolio with: accountsOC.

	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:04:19'!
test05TransactionInAnAccountThatHasBeenIncludedIsRegistered
	| account1 account2 accountsOC portfolio transaction |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	transaction := Deposit register: 100 * peso on: account2.
	
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	accountsOC add: account2.
	
	portfolio := Portfolio with: accountsOC.

	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:07:15'!
test06TransactionInAContainingPortfolioIsRegistered
	| account1 account2 accountsOC1 accountsOC2 portfolio1 portfolio2 transaction |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 200 * peso on: account1.
	Deposit register: 200 * peso on: account2.
	
	accountsOC1 := OrderedCollection new.
	accountsOC1 add: account1.
	accountsOC1 add: account2.
	
	portfolio1 := Portfolio with: accountsOC1.
	
	accountsOC2 := OrderedCollection new.
	accountsOC2 add: portfolio1. 
	
	portfolio2 := Portfolio with: accountsOC2.
	
	self assert: (portfolio2 hasRegistered: transaction )! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:09:29'!
test07PortfolioContainingOneAccountProvidesItTransactions
	| account1 accountsOC portfolio transaction totalTransactions |
	account1 := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account1.

	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	totalTransactions := OrderedCollection new.
	totalTransactions add: transaction.
	
	portfolio := Portfolio with: accountsOC.
	
	self assert: totalTransactions equals: portfolio transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:18:55'!
test08PortfolioContainingMultipleAccountsProvidesTheirTransactions
	| account1 account2 accountsOC portfolio transaction1 transaction2 totalTransactions |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 * peso on: account1.
	transaction2 := Deposit register: 200 * peso on: account2.

	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	accountsOC add: account2.
	totalTransactions := OrderedCollection new.
	totalTransactions add: transaction1.
	totalTransactions add: transaction2.
	
	
	portfolio := Portfolio with: accountsOC.
	
	self assert: totalTransactions equals: portfolio transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:19:54'!
test09PortfolioContainingAnEmptyPortfolioProvidesItTransactions
	| portfolio1 portfolio2 portfolioContainer emptyOC|
	
	emptyOC := OrderedCollection new.
	portfolio1 := Portfolio with: emptyOC.
	portfolioContainer := OrderedCollection new.
	portfolioContainer add: portfolio1.
	portfolio2 := Portfolio with: portfolioContainer.

	self assert: emptyOC equals: portfolio2 transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:20:54'!
test10PortfolioContainingAPortfolioWithMultipleAccountsProvidesTheirTransactions
	| account1 account2 accountsOC portfolio1 portfolio2 transaction1 transaction2 totalTransactions containerPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction1 := Deposit register: 100 * peso on: account1.
	transaction2 := Deposit register: 200 * peso on: account2.

	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	accountsOC add: account2.
	totalTransactions := OrderedCollection new.
	totalTransactions add: transaction1.
	totalTransactions add: transaction2.
	
	
	portfolio1 := Portfolio with: accountsOC.
	
	containerPortfolio := OrderedCollection new.
	containerPortfolio add: portfolio1.
	
	portfolio2:= Portfolio with: containerPortfolio.
	
	self assert: totalTransactions equals: portfolio2 transactions! !


!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:07:18'!
test11AnAccountCanBeAddedAfterCreation
	| account1 allTransactions transactions portfolio | 
	account1 := ReceptiveAccount new.
	transactions := Deposit register: 100 * peso on: account1.
	allTransactions := OrderedCollection new.
	allTransactions add: transactions .
	portfolio := Portfolio with: OrderedCollection new.
	portfolio addAccount: account1.
	
	self assert: allTransactions equals: portfolio transactions.! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:08:08'!
test12CanNotAddAnAccountThatIsAlreadyInPortfolio
	| account1 accountsOC portfolio | 
	account1 := ReceptiveAccount new.
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	portfolio := Portfolio with: accountsOC.
	
	self should:[portfolio addAccount: account1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:08:49'!
test13CanNotAddAPortfolioToItself
	| portfolio |
	portfolio := Portfolio with: OrderedCollection new.
	
	self should:[portfolio addAccount: portfolio.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:10:11'!
test14CanNotAddAnAccountThatIsAlreadyInAChildPortfolio
	| account1 accountsOC1 accountsOC2 portfolio1 portfolio2 | 
	account1 := ReceptiveAccount new.
	accountsOC1 := OrderedCollection new.
	accountsOC1 add: account1.
	portfolio1 := Portfolio with: accountsOC1.
	
	accountsOC2 := OrderedCollection new.
	accountsOC2 add: portfolio1. 
	portfolio2 := Portfolio with: accountsOC2.
	
	self should:[portfolio2 addAccount: account1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:11:29'!
test15CanNotAddAPortfolioThatIsAlreadyIn
	| accountsOC1 portfolio1 portfolio2 | 
	accountsOC1 := OrderedCollection new.
	portfolio1 := Portfolio with: OrderedCollection new.
	accountsOC1 add: portfolio1.
	portfolio2 := Portfolio with: accountsOC1.
	
	self should:[portfolio2 addAccount: portfolio1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:13:17'!
test16CanNotAddAnAccountThatIsAlreadyInAParent
	| account1 portfolio1 portfolio2 | 
	account1 := ReceptiveAccount new.
	portfolio1 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: account1.
	portfolio2 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: portfolio2.
	
	self should:[portfolio2 addAccount: account1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:16:48'!
test17CanNotAddAnAccountThatIsAlreadyInAParentOfItsParent
	| account1 portfolio1 portfolio2 portfolio3 | 
	account1 := ReceptiveAccount new.
	portfolio1 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: account1.
	portfolio2 := Portfolio with: OrderedCollection new.
	portfolio3 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: portfolio3.
	portfolio3 addAccount: portfolio2.
	
	
	self should:[portfolio2 addAccount: account1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:21:54'!
test18CanNotAddAnAccountThatIsAlreadyInAPortfolioThatCointainsThePortfolio
	| account1 portfolio1 portfolio2 portfolio3 portfolio4 | 
	account1 := ReceptiveAccount new.
	portfolio1 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: account1.
	portfolio2 := Portfolio with: OrderedCollection new.
	portfolio3 := Portfolio with: OrderedCollection new.
	portfolio4 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: portfolio3.
	portfolio3 addAccount: portfolio4.
	portfolio4 addAccount: portfolio2.
	
	
	self should:[portfolio2 addAccount: account1.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 20:24:15'!
test19CanNotAddAPortfolioThatContainsAnAccountThatIsAlreadyInThePortfolio
	| account1 portfolio1 portfolio2 portfolio3 portfolio4 | 
	account1 := ReceptiveAccount new.
	portfolio1 := Portfolio with: OrderedCollection new.
	portfolio2 := Portfolio with: OrderedCollection new.
	portfolio1 addAccount: account1.
	portfolio2 addAccount: account1.
	portfolio3 := Portfolio with: OrderedCollection new.
	portfolio4 := Portfolio with: OrderedCollection new.
	portfolio3 addAccount: portfolio4.
	portfolio1 addAccount: portfolio3.
	
	self should:[portfolio4 addAccount: portfolio2.]
	raise: Error
	withExceptionDo: [:anError | self assert: (Portfolio canNotAddAccount = anError messageText).]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:26:41'!
test01BalanceInTheDepositedAccountIncreasesConsideringTheTransferenceValue
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso equals: account2 balance.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:26:49'!
test02BalanceInTheWithdrawnAccountDecreasesConsideringTheTransferenceValue
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: (100 * peso ) negated equals: account1 balance.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:26:22'!
test03TransferenceValueIsEqualToEnteredValue
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:29:56'!
test04DifferentTransferenceValueIsEqualToDifferentEnteredValue
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 125 * peso from: account1 to: account2.
	self assert: 125 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 17:23:59'!
test05CanNotTransferANegativeAmount
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should:[Transference value: (100 * peso) negated from: account1 to: account2.]
	raise: Error
	withExceptionDo: [:anError | self assert: Transference transferenceValueIsInvalid equals: anError messageText.]! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:31:14'!
test06TransferenceProvidesAWithdrawLeg
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference withdrawLeg class equals: WithdrawLeg.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:31:29'!
test07TransferenceProvidesADepositLeg
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference depositLeg class equals: DepositLeg.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:33:03'!
test08TransferenceAlwaysProvidesTheSameWithdrawLeg
	| account1 account2 transference previousWithdrawLeg |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousWithdrawLeg := transference withdrawLeg.

	self assert: previousWithdrawLeg equals: transference withdrawLeg.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:33:29'!
test09TransferenceAlwaysProvidesTheSameDepositLeg
	| account1 account2 transference previousDepositLeg |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousDepositLeg := transference depositLeg.

	self assert: previousDepositLeg equals: transference depositLeg.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:34:06'!
test10WithdrawLegProvidesItsCounterPart
	| account1 account2 transference withdrawLeg |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	withdrawLeg := transference withdrawLeg .
	
	self assert: transference depositLeg equals: withdrawLeg counterpart.! !

!TransferenceTest methodsFor: 'tests' stamp: 'gmcb 6/9/2022 15:34:33'!
test11DepositLegProvidesItsCounterPart
	| account1 account2 transference depositLeg |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	depositLeg := transference depositLeg .
	
	self assert: transference withdrawLeg equals: depositLeg counterpart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'gmcb 6/7/2022 19:18:46'!
affectBalance
	^value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'gmcb 6/7/2022 19:19:01'!
affectBalance
	^value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main-protocol' stamp: 'gmcb 6/9/2022 19:59:34'!
addAccount: anAccount
	(self searchCoincidenceFromTop: anAccount)  ifTrue:[self error: Portfolio canNotAddAccount].
	(anAccount isKindOf: Portfolio) ifTrue: [ self validatePortfolioInternalAccounts: anAccount].
	accounts add: anAccount.
	self updateChild: anAccount.! !

!Portfolio methodsFor: 'main-protocol' stamp: 'gmcb 6/8/2022 18:32:30'!
balance
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main-protocol' stamp: 'gmcb 6/9/2022 00:13:21'!
hasRegistered: aTransaction
	^accounts anySatisfy: [:anAccount | (anAccount hasRegistered: aTransaction)].
	! !

!Portfolio methodsFor: 'main-protocol' stamp: 'gmcb 6/8/2022 23:09:35'!
transactions
	| totalTransactions |
	totalTransactions := OrderedCollection new.
	accounts do:[:anAccount | totalTransactions addAllLast: anAccount transactions].
	^totalTransactions! !


!Portfolio methodsFor: 'initialization' stamp: 'gmcb 6/9/2022 18:11:18'!
initialize
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'gmcb 6/9/2022 18:19:35'!
initializeWith: anAccountsOC
	accounts := anAccountsOC.
	self updateChilds: anAccountsOC! !


!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 19:29:16'!
accounts
	^accounts! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 18:30:37'!
coincidence: anAccount
	(self = anAccount) ifTrue: [^true].
	^accounts anySatisfy: [:anotherAccount |	 anotherAccount coincidence: anAccount ].! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 19:17:18'!
searchCoincidenceFromTop: anAccount
	(parents isEmpty) ifTrue: [^self coincidence: anAccount].
	^parents anySatisfy: [:aPortfolio | aPortfolio searchCoincidenceFromTop: anAccount]! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 18:45:14'!
updateChild: anAccount
	(anAccount isKindOf: Portfolio) ifTrue: [anAccount updateParents: self]! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 18:46:49'!
updateChilds: anAccountsOC
	anAccountsOC do:[:anAccount | self updateChild: anAccount].! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 18:14:25'!
updateParents: anAccount
	parents add: anAccount! !

!Portfolio methodsFor: 'private' stamp: 'gmcb 6/9/2022 19:58:58'!
validatePortfolioInternalAccounts: anAccount
	(anAccount accounts anySatisfy: [:innerAccount | self searchCoincidenceFromTop: innerAccount])	 ifTrue:[self error: Portfolio canNotAddAccount]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 17:28:48'!
canNotAddAccount
	^'Received account is already in the portfolio or in a related portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 17:37:04'!
canNotAddItself
	^'Portfolio can not be added itself'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 18:21:44'!
with: aReceptiveAccountsOC
	| portfolio |
	portfolio := self new.
	portfolio initializeWith: aReceptiveAccountsOC.
	^portfolio ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'gmcb 6/7/2022 19:19:23'!
balance

	^transactions sum: [ :aTransaction | aTransaction affectBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'gmcb 6/9/2022 18:02:01'!
coincidence: anAccount
	^self = anAccount! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'gmcb 6/9/2022 00:35:49'!
isEqualTo: anAccount
	^self = anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'main-protocol' stamp: 'gmcb 6/9/2022 15:35:40'!
depositLeg
	^depositLeg.! !

!Transference methodsFor: 'main-protocol' stamp: 'gmcb 6/7/2022 19:40:20'!
value
	^value.! !

!Transference methodsFor: 'main-protocol' stamp: 'gmcb 6/9/2022 15:35:30'!
withdrawLeg
	^withdrawLeg.! !


!Transference methodsFor: 'initialization' stamp: 'gmcb 6/9/2022 15:35:40'!
initializeFor: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount
	value := aValueToTransfer.
	withdrawLeg := WithdrawLeg registerOn: aReceptiveAccount in: self.
	depositLeg := DepositLeg registerOn: anotherReceptiveAccount in: self.
	withdrawLeg initializeWithCounterPart: depositLeg.
	depositLeg initializeWithCounterPart: withdrawLeg.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'initialization' stamp: 'gmcb 6/8/2022 16:17:38'!
value: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount
	| transference |
	(aValueToTransfer positive) ifFalse: [
		self error: Transference transferenceValueIsInvalid.	
	].
	transference := self new.
	transference initializeFor: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount.
	
	^transference.! !


!Transference class methodsFor: 'errors' stamp: 'gmcb 6/7/2022 19:47:10'!
transferenceValueIsInvalid
	^'The value to transfer must be positive'! !


!classDefinition: #TransferenceLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 15:37:08'!
affectBalance
	self subclassResponsibility! !

!TransferenceLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 15:37:29'!
counterpart
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg class
	instanceVariableNames: ''!

!TransferenceLeg class methodsFor: 'initialization' stamp: 'gmcb 6/8/2022 16:22:54'!
registerOn: aReceptiveAccount in: aTransference
	| transferenceLeg |
	transferenceLeg := self new.
	transferenceLeg initializeWithTransference: aTransference.
	aReceptiveAccount register: transferenceLeg.
	^transferenceLeg ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #DepositLeg
	instanceVariableNames: 'counterpart transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:24:21'!
affectBalance
	^transference value! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:31:32'!
counterpart
	^counterpart! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 15:27:05'!
initializeWithCounterPart: aCounterpart
	counterpart := aCounterpart.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:21:33'!
initializeWithTransference: aTransference
	transference := aTransference.! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #WithdrawLeg
	instanceVariableNames: 'counterpart transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'main-protocol' stamp: 'gmcb 6/8/2022 16:24:47'!
affectBalance
	^transference value negated! !

!WithdrawLeg methodsFor: 'main-protocol' stamp: 'gmcb 6/7/2022 22:26:42'!
counterpart
	^counterpart! !


!WithdrawLeg methodsFor: 'initialization' stamp: 'gmcb 6/8/2022 15:27:05'!
initializeWithCounterPart: aCounterpart
	counterpart := aCounterpart.! !

!WithdrawLeg methodsFor: 'initialization' stamp: 'gmcb 6/8/2022 16:21:56'!
initializeWithTransference: aTransference
	transference := aTransference.! !
