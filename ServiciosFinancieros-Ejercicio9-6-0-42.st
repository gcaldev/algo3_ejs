!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 18:32:30'!
test01
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 18:32:30'!
test02
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 18:32:30'!
test03
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 19:10:55'!
test04
	| account1 account2 accountsOC portfolio transaction |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	transaction := Deposit register: 100 * peso on: account2.
	
	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	
	portfolio := Portfolio with: accountsOC.

	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 19:10:56'!
test05
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 19:10:55'!
test06
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 23:08:56'!
test07
	| account1 accountsOC portfolio transaction totalTransactions |
	account1 := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account1.

	accountsOC := OrderedCollection new.
	accountsOC add: account1.
	totalTransactions := OrderedCollection new.
	totalTransactions add: transaction.
	
	portfolio := Portfolio with: accountsOC.
	
	self assert: totalTransactions equals: portfolio transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 23:08:56'!
test08
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

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 23:08:56'!
test09
	| portfolio1 portfolio2 portfolioContainer emptyOC|
	
	emptyOC := OrderedCollection new.
	portfolio1 := Portfolio with: emptyOC.
	portfolioContainer := OrderedCollection new.
	portfolioContainer add: portfolio1.
	portfolio2 := Portfolio with: portfolioContainer.

	self assert: emptyOC equals: portfolio2 transactions! !

!PortfolioTest methodsFor: 'tests' stamp: 'gmcb 6/8/2022 23:08:56'!
test10
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


!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 00:23:57'!
test11
	| account1 account2 accountsOC portfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	accountsOC := OrderedCollection new.
	accountsOC add: account1.

	portfolio := Portfolio with: accountsOC.
	portfolio addAccount: account2.

	self assert: (portfolio contains: account2).
! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 00:38:59'!
test12
	| account1 account2 account3 accountsOC1 accountsOC2 portfolio1 portfolio2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	accountsOC1 := OrderedCollection new.
	accountsOC1 add: account1.
	accountsOC2 := OrderedCollection new.
	accountsOC2 add: account3.

	portfolio1 := Portfolio with: accountsOC1.
	portfolio1 addAccount: account2.
	portfolio2 := Portfolio with: accountsOC2.
	portfolio1 addAccount: portfolio2.


	self assert: (portfolio1 contains: account3 ).
! !

!PortfolioTest methodsFor: 'tests-extra' stamp: 'gmcb 6/9/2022 00:39:23'!
test13
	| account1 account2 account3 accountsOC1 accountsOC2 portfolio1 portfolio2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	accountsOC1 := OrderedCollection new.
	accountsOC1 add: account1.
	accountsOC2 := OrderedCollection new.

	portfolio1 := Portfolio with: accountsOC1.
	portfolio1 addAccount: account2.
	portfolio2 := Portfolio with: accountsOC2.
	portfolio1 addAccount: portfolio2.


	self deny: (portfolio1 contains: account3 ).
! !


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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:17:12'!
test01TheBalanceInTheDepositedAccountIncreasesConsideringTheTransferenceValue
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso equals: account2 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:18:05'!
test02TheBalanceInTheWithdrawnAccountDecreasesConsideringTheTransferenceValue
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: (100 * peso ) negated equals: account1 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:21:23'!
test03TheTransferenceValueIsEqualToTheEnteredPreviously
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:22:52'!
test04ACHECKEAR
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 125 * peso from: account1 to: account2.
	self assert: 125 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:23:59'!
test05CanNotTransferANegativeAmount
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should:[Transference value: (100 * peso) negated from: account1 to: account2.]
	raise: Error
	withExceptionDo: [:anError | self assert: Transference transferenceValueIsInvalid equals: anError messageText.]! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:26:53'!
test06TransferenceCanProvideTheWithdrawLeg
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference legWithdraw class equals: WithdrawLeg.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:27:22'!
test07TransferenceCanProvideTheDepositLeg
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference legDeposit class equals: DepositLeg.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:28:39'!
test08TransferenceAlwaysProvideTheSameWithdrawLeg
	| account1 account2 transference previousLegWithdraw |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousLegWithdraw := transference legWithdraw.

	self assert: previousLegWithdraw equals: transference legWithdraw.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:29:15'!
test09TransferenceAlwaysProvideTheSameDepositLeg
	| account1 account2 transference previousLegDeposit |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousLegDeposit := transference legDeposit.

	self assert: previousLegDeposit equals: transference legDeposit.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:33:16'!
test10WithdrawLegKnowsItsCounterPart
	| account1 account2 transference legWithdraw |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	legWithdraw := transference legWithdraw .
	
	self assert: transference legDeposit equals: legWithdraw counterpart.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 17:33:45'!
test11DepositLegKnowsItsCounterPart
	| account1 account2 transference legDeposit |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	legDeposit := transference legDeposit .
	
	self assert: transference legWithdraw equals: legDeposit counterpart.! !


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
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 00:23:02'!
addAccount: anAccount
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 18:32:30'!
balance
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 00:34:55'!
contains: anAccount
	^accounts anySatisfy: [:anotherAccount | anotherAccount isEqualTo: anAccount ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 00:13:21'!
hasRegistered: aTransaction
	^accounts anySatisfy: [:anAccount | (anAccount hasRegistered: aTransaction)].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 18:22:17'!
initializeWith: aReceptiveAccountsOC
	accounts := aReceptiveAccountsOC! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/9/2022 00:41:45'!
isEqualTo: anAccount
	(self = anAccount) ifTrue: [^true] ifFalse:[^self contains: anAccount.	].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 23:09:35'!
transactions
	| totalTransactions |
	totalTransactions := OrderedCollection new.
	accounts do:[:anAccount | totalTransactions addAllLast: anAccount transactions].
	^totalTransactions! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

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
	instanceVariableNames: 'value legWithdraw legDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:16:50'!
initializeFor: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount
	value := aValueToTransfer.
	legWithdraw := WithdrawLeg registerOn: aReceptiveAccount in: self.
	legDeposit := DepositLeg registerOn: anotherReceptiveAccount in: self.
	legWithdraw initializeWithCounterPart: legDeposit.
	legDeposit initializeWithCounterPart: legWithdraw.
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:20:49'!
legDeposit
	^legDeposit.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:19:32'!
legWithdraw
	^legWithdraw.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:40:20'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:47:10'!
transferenceValueIsInvalid
	^'The value to transfer must be positive'! !

!Transference class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:17:38'!
value: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount
	| transference |
	(aValueToTransfer positive) ifFalse: [
		self error: Transference transferenceValueIsInvalid.	
	].
	transference := self new.
	transference initializeFor: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount.
	
	^transference.! !


!classDefinition: #TransferenceLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg class
	instanceVariableNames: ''!

!TransferenceLeg class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:22:54'!
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

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:26:09'!
value
	^transference value.! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #WithdrawLeg
	instanceVariableNames: 'counterpart transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:24:47'!
affectBalance
	^transference value negated! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:26:42'!
counterpart
	^counterpart! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 15:27:05'!
initializeWithCounterPart: aCounterpart
	counterpart := aCounterpart.! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:21:56'!
initializeWithTransference: aTransference
	transference := aTransference.! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/8/2022 16:26:20'!
value
	^transference value! !
