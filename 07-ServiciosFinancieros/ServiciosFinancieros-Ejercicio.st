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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 20:33:46'!
test01
	| transference account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference from: account1 to: account2 value: 100 *peso.
	self assert: 100 * peso equals: transference value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 20:34:30'!
test02
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference from: account1 to: account2 value: 100 *peso.
	self assert: 100 * peso equals: account2 balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 20:38:19'!
test03
	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transference from: account1 to: account2 value: 100 *peso.
	self assert: (100 * peso) negated equals: account1 balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:09:27'!
test04
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference from: account1 to: account2 value: 100 *peso.
	self assert: account2 equals: transference pataExtractora.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:09:35'!
test05
	| account1 account2 transference |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference from: account1 to: account2 value: 100 *peso.
	self assert: account1 equals: transference pataDepositante.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:09:41'!
test06
	| account1 account2 transference depositante |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transference := Transference from: account1 to: account2 value: 100 *peso.
	depositante := transference pataDepositante.
	
	self assert: account2 equals: depositante contraparte.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'smb 6/6/2022 20:41:38'!
affectBalance
	self subclassResponsibility ! !

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


!Deposit methodsFor: 'value' stamp: 'smb 6/6/2022 20:42:18'!
affectBalance
	^self value! !

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


!Withdraw methodsFor: 'value' stamp: 'smb 6/6/2022 20:42:33'!
affectBalance
	^self value negated! !

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


!classDefinition: #PataDepositante category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PataDepositante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PataDepositante class' category: 'ServiciosFinancieros-Ejercicio'!
PataDepositante class
	instanceVariableNames: ''!

!PataDepositante class methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:15:32'!
account: aReceptiveAccount 
	| pata |
	pata _ self new.
	pata setAccount: aReceptiveAccount .
	^pata
	! !


!classDefinition: #PataExtraccion category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PataExtraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'smb 6/6/2022 20:43:06'!
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
	instanceVariableNames: 'depositante pataExtractora pataDepositante'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:04:53'!
pataDepositante
	^pataDepositante.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:01:09'!
pataExtractora
	^pataExtractora.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:11:30'!
setPataDepositante: aReceptiveAccount
	pataDepositante := PataDepositante account: aReceptiveAccount.
	
! !

!Transference methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:03:11'!
setPataExtractora: aReceptiveAccount
	pataExtractora := aReceptiveAccount.
	
! !

!Transference methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 20:32:48'!
value
	^100 * peso.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'as yet unclassified' stamp: 'smb 6/6/2022 21:09:15'!
from: aReceptiveAccount to: anotherReceptiveAccount value: aSimpleMeasure 
	| transference |
	Withdraw register: 100*peso on: aReceptiveAccount .
	Deposit register: 100*peso on: anotherReceptiveAccount.
	transference := self new.
	transference setPataExtractora: anotherReceptiveAccount .
	transference setPataDepositante: aReceptiveAccount.
	^transference ! !
