!classDefinition: #FintechTest category: 'ALGO3-2020-2C-2doParcial'!
TestCase subclass: #FintechTest
	instanceVariableNames: 'clock aFintech'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:43:02'!
test01WhenCreatingAWalletItsBalanceIsZeroFiubaCoin

	| fintech walletId |
	
	fintech := Fintech new.
	
	walletId := fintech createWallet.
	
	self assert: 0*fintech coin equals: (fintech balanceOf: walletId)! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:41:49'!
test02CanNotGetBalanceOfInvalidWalletId

	| fintech |
	
	fintech := Fintech new.
	
	self 
		should: [ fintech balanceOf: Object new ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: fintech invalidWalletIdErrorMessage ]
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:41:59'!
test03CreateWalletUsesDifferentIds

	| fintech sourceWalletId targetWalletId |
	
	fintech := Fintech new.
	sourceWalletId := fintech createWallet.
	targetWalletId := fintech createWallet.
	
	self deny: sourceWalletId = targetWalletId 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:44:07'!
test04WhenCreatingAPromotionalWalletItsBalanceIsOneFiubaCoin

	| fintech aWalletId |
	
	fintech := Fintech new.
	aWalletId := fintech createPromotionalWallet.
	
	self assert: 1* fintech coin equals: (fintech balanceOf: aWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JT 3/1/2021 19:35:24'!
test05
	"No puedo hacer una transferencia porque es menor a 0.000001* FiubaCOIN"
	
	| fintech aWalletId aWalletId2 |
	
	fintech := Fintech new.
	aWalletId := fintech createWallet .
	aWalletId2 := fintech createPromotionalWallet.
	
	self 
		should: [ fintech transfer: (0.0000001* fintech coin) from: aWalletId to: aWalletId2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: fintech cannotTransferErrorMessage.
			self assert: 0* fintech coin equals: (fintech balanceOf: aWalletId).
			self assert: 1* fintech coin equals: (fintech balanceOf: aWalletId2).]
	
	
	! !

!FintechTest methodsFor: 'tests' stamp: 'JT 3/1/2021 22:23:50'!
test06
	"Hago una transferencia y deberia tener menos en el balance desde el origen y solo pasa media hora"
	
	| fintech aWalletId aWalletId2 |
	
	fintech := Fintech initializeWithAClock: clock.
	aWalletId := fintech createPromotionalWallet.
	aWalletId2 := fintech createWallet.
	
	fintech transfer: (0.1* fintech coin) from: aWalletId to: aWalletId2.
	
	self assert: 0.898* fintech coin equals: (fintech balanceOf: aWalletId).
	"self assert: 0* fintech coin equals: (fintech balanceOf: aWalletId2)."! !

!FintechTest methodsFor: 'tests' stamp: 'JT 3/1/2021 22:20:52'!
test07
	"Hago una transferencia y deberia tener menos en el balance desde el origen y mas en la cuenta destino"
	
	| fintech aWalletId aWalletId2 |
	
	fintech := Fintech initializeWithAClock: clock.
	aWalletId := fintech createPromotionalWallet.
	aWalletId2 := fintech createWallet.
	
	fintech transfer: (0.1* fintech coin) from: aWalletId to: aWalletId2.
	
	clock advanceTime: (2 * hour).
	
	self assert: 0.898* fintech coin equals: (fintech balanceOf: aWalletId).
	self assert: 0.1* fintech coin equals: (fintech balanceOf: aWalletId2).! !

!FintechTest methodsFor: 'tests' stamp: 'JT 3/1/2021 22:24:09'!
test08
	"Obtengo todas las transacciones"
	
	| fintech aWalletId aWalletId2 aTransaction |
	
	fintech := Fintech initializeWithAClock: clock.
	aWalletId := fintech createPromotionalWallet.
	aWalletId2 := fintech createWallet.
	
	aTransaction _ fintech transfer: (0.1* fintech coin) from: aWalletId to: aWalletId2.
	
	self assert: (0.10200000000000001 * fintech coin) equals: (aTransaction withdrawLeg) amount.
	self assert: (0.1 * fintech coin) equals: (aTransaction depositLeg ) amount.! !


!FintechTest methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:51:52'!
createFintechWithClock: aClock
	
	aFintech _ Fintech initializeWithAClock: aClock.! !

!FintechTest methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:48:46'!
setUp

	clock _ ManualClock new.! !


!classDefinition: #Fintech category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #Fintech
	instanceVariableNames: 'wallets coin lastWalletId clock transferTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!Fintech methodsFor: 'coin' stamp: 'JMB 2/6/2021 09:06:45'!
coin
	
	coin isNil ifTrue: [ coin := BaseUnit named: 'FiubaCoin' ].
	
	^coin! !


!Fintech methodsFor: 'services' stamp: 'JT 3/1/2021 21:14:01'!
allTransactionsOf: aWalletId
	^(self walletIdentifiedAs: aWalletId) transactions.
	! !

!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:15:19'!
balanceOf: aWalletId
	^(self walletIdentifiedAs: aWalletId) balance
	! !

!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:44:19'!
createPromotionalWallet
	^ self createWalletWithBalance: 1*self coin! !

!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:43:26'!
createWallet
	^ self createWalletWithBalance: 0*self coin! !

!Fintech methodsFor: 'services' stamp: 'JT 3/1/2021 22:23:41'!
transfer: anAmount from: aSourceWalletId to: aTargetWalletId

	| anAmountRecharged transNegative transPositive |
	
	self assertCanTransferWithAmount: anAmount.
	
	anAmountRecharged _ anAmount + ((anAmount * 2)/100).
	
	transNegative _ TransferWithdrawLeg of: anAmountRecharged on: clock now.
	(self walletIdentifiedAs: aSourceWalletId) register: transNegative.
	
	"(clock now distanceTo: (self transferTimeOf: transNegative)) > 60 * minute ifTrue: ["
	transPositive _ TransferDepositLeg of: anAmount on: clock now.
	
	(self walletIdentifiedAs: aTargetWalletId) register: transPositive.
	
	^Transaction withWithdraw: transNegative andDeposit: transPositive
	
	! !


!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JT 3/1/2021 19:35:02'!
cannotTransferErrorMessage
	
	^'Cannot transfer'! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:09:36'!
invalidWalletIdErrorMessage
	
	^'Invalid wallet id'! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JT 3/1/2021 19:35:11'!
signalCannotTransfer
	
	^self error: self cannotTransferErrorMessage.! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:20:27'!
signalInvalidWalletId
	
	^self error: self invalidWalletIdErrorMessage ! !


!Fintech methodsFor: 'initialization' stamp: 'JMB 2/6/2021 09:27:15'!
initialize
	super initialize.
	wallets := Dictionary new.
	lastWalletId := 0 ! !

!Fintech methodsFor: 'initialization' stamp: 'JT 3/1/2021 22:11:59'!
initializeWithClock: aClock

	wallets _ Dictionary new.
	lastWalletId _ 0.
	clock _ aClock.
	transferTime _ Dictionary new.! !


!Fintech methodsFor: 'private' stamp: 'JMB 2/6/2021 11:37:41'!
createWalletWithBalance: anInitialBalance
	| wallet |
	wallet := Wallet with: anInitialBalance.
	lastWalletId := lastWalletId + 1.
	wallets at: lastWalletId put: wallet.
	
	^lastWalletId! !

!Fintech methodsFor: 'private' stamp: 'JMB 2/6/2021 09:29:38'!
walletIdentifiedAs: aWalletId

	^wallets at: aWalletId ifAbsent: [ self signalInvalidWalletId ]! !


!Fintech methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:57:31'!
advanceTime: aSpan

	clock advanceTime: aSpan! !

!Fintech methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:15:09'!
assertCanTransferWithAmount: anAmount

	anAmount < (0.000001 * self coin) ifTrue: [self signalCannotTransfer.].! !

!Fintech methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:15:53'!
transferTimeOf: aTransfer

	^aTransfer timeOfExecution.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fintech class' category: 'ALGO3-2020-2C-2doParcial'!
Fintech class
	instanceVariableNames: ''!

!Fintech class methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:55:24'!
initializeWithAClock: aClock
	^self new initializeWithClock: aClock.! !


!classDefinition: #ManualClock category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!ManualClock methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:16:04'!
advanceTime: aTimeMeasure

	now _ now next: aTimeMeasure! !

!ManualClock methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:15:59'!
initialize

	now _ GregorianDateTime now.! !

!ManualClock methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:05:52'!
now
	^now! !


!classDefinition: #Transaction category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #Transaction
	instanceVariableNames: 'amount withdrawLeg depositLeg timeOfExecution'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:40:12'!
affectBalance: aBalance

	self subclassResponsibility ! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:38:40'!
amount 

	^amount ! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:59:59'!
depositLeg
	^depositLeg! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 20:38:10'!
initializeWith: anAmout

	amount _ anAmout! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:16:20'!
initializeWith: anAmout on: aDateTime

	amount _ anAmout.
	timeOfExecution _ aDateTime.! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:54:38'!
initializeWithWithdrawLeg: aWithdrawLeg depositLeg: aDepositLeg
	
	withdrawLeg _ aWithdrawLeg.
	depositLeg _ aDepositLeg.! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:17:07'!
timeOfExecution
	
	^timeOfExecution! !

!Transaction methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:59:51'!
withdrawLeg
 	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transaction class' category: 'ALGO3-2020-2C-2doParcial'!
Transaction class
	instanceVariableNames: ''!

!Transaction class methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:55:58'!
of: anAmount
	^self new initializeWith: anAmount.! !

!Transaction class methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 22:18:20'!
of: anAmount on: aDateTime
	^self new initializeWith: anAmount on: aDateTime .! !

!Transaction class methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:54:12'!
withWithdraw: withdrawLeg andDeposit: depositLeg

	^self new initializeWithWithdrawLeg: withdrawLeg depositLeg: depositLeg.! !


!classDefinition: #TransferDepositLeg category: 'ALGO3-2020-2C-2doParcial'!
Transaction subclass: #TransferDepositLeg
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:34:58'!
affectBalance: aBalance

	^aBalance + self amount! !


!classDefinition: #TransferWithdrawLeg category: 'ALGO3-2020-2C-2doParcial'!
Transaction subclass: #TransferWithdrawLeg
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 21:36:42'!
affectBalance: aBalance

	^aBalance - self amount.! !


!classDefinition: #Wallet category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #Wallet
	instanceVariableNames: 'initialBalance transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!Wallet methodsFor: 'initialization' stamp: 'JT 3/1/2021 19:51:38'!
initializeWith: anInitialBalance

	initialBalance _ anInitialBalance.
	transactions _ OrderedCollection new.! !


!Wallet methodsFor: 'balance' stamp: 'JT 3/1/2021 20:42:56'!
balance
":currentBalance :transaction | transaction affectBalance: currentBalance "
	^transactions 
		inject: initialBalance
		into: [ :currentBalance :transaction | ^transaction affectBalance: initialBalance].
		! !

!Wallet methodsFor: 'balance' stamp: 'JT 3/1/2021 21:22:13'!
transactions
	^transactions.
		! !


!Wallet methodsFor: 'as yet unclassified' stamp: 'JT 3/1/2021 19:52:13'!
register: aTransaction

	transactions add: aTransaction 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wallet class' category: 'ALGO3-2020-2C-2doParcial'!
Wallet class
	instanceVariableNames: ''!

!Wallet class methodsFor: 'instance creation' stamp: 'JMB 2/6/2021 09:15:31'!
with: anInitialBalance
	^self new initializeWith: anInitialBalance! !
