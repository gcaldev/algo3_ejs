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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:27:55'!
test01
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso equals: account2 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:32:00'!
test02
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference value: 100 * peso from: account1 to: account2.
	self assert: (100 * peso ) negated equals: account1 balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:34:36'!
test03
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 100 * peso from: account1 to: account2.
	self assert: 100 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:38:31'!
test04
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: 125 * peso from: account1 to: account2.
	self assert: 125 * peso  equals: transference value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 19:44:17'!
test05
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should:[Transference value: (100 * peso) negated from: account1 to: account2.]
	raise: Error
	withExceptionDo: [:anError | self assert: Transference transferenceValueIsInvalid equals: anError messageText.]! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:34:28'!
test06
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference legWithdraw class equals: WithdrawLeg.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:34:14'!
test07
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	
	self assert: transference legDeposit class equals: DepositLeg.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:16:25'!
test08
	| account1 account2 transference previousLegWithdraw |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousLegWithdraw := transference legWithdraw.

	self assert: previousLegWithdraw equals: transference legWithdraw.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:20:12'!
test09
	| account1 account2 transference previousLegDeposit |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	previousLegDeposit := transference legDeposit.

	self assert: previousLegDeposit equals: transference legDeposit.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:23:30'!
test10
	| account1 account2 transference legWithdraw |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference value: (100 * peso) from: account1 to: account2.
	legWithdraw := transference legWithdraw .
	
	self assert: transference legDeposit equals: legWithdraw counterpart.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:31:01'!
test11
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

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:34:28'!
initialize
	legWithdraw := WithdrawLeg new.
	legDeposit := DepositLeg new.
	legWithdraw initializeWith: legDeposit.
	legDeposit initializeWith: legWithdraw.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 20:31:58'!
initializeFor: aValueToTransfer
	value := aValueToTransfer.! !

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

!Transference class methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 23:19:47'!
value: aValueToTransfer from: aReceptiveAccount to: anotherReceptiveAccount
	| transference |
	Withdraw register: aValueToTransfer on: aReceptiveAccount.
	(aValueToTransfer positive) ifFalse: [
		self error: Transference transferenceValueIsInvalid.	
	].
	transference := self new.
	transference initializeFor: aValueToTransfer.
	
	^transference.! !


!classDefinition: #TransferenceLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #DepositLeg
	instanceVariableNames: 'counterpart transference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 23:18:54'!
affectBalance
	^transference value.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:31:32'!
counterpart
	^counterpart! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 23:16:11'!
initializeFor: aTransference with: aCounterpart
	transference := aTransference.
	counterpart := aCounterpart.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:31:20'!
initializeWith: aCounterpart
	counterpart := aCounterpart.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 23:17:50'!
registerOn: anAccount with: aCounterpart for: aTransference
	transference := aTransference.
	counterpart := aCounterpart.
	anAccount register: self.! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLeg subclass: #WithdrawLeg
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:26:42'!
counterpart
	^counterpart! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'gmcb 6/7/2022 22:26:28'!
initializeWith: aCounterpart
	counterpart := aCounterpart.! !
