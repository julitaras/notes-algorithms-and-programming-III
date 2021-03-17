!classDefinition: #CoffeeShopTest category: 'AlgoIII-2020-2C-1Parcial'!
TestCase subclass: #CoffeeShopTest
	instanceVariableNames: 'billGates adaLovelace alanKay salesSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopTest methodsFor: 'setUp/tearDown' stamp: 'JT 11/23/2020 00:33:13'!
setUp

	adaLovelace := Gold named: 'Ada Lovelace'.
	alanKay := Silver named: 'Alan Kay'.
	billGates := Normal named: 'Bill Gates'.! !


!CoffeeShopTest methodsFor: 'test objects' stamp: 'JT 11/23/2020 16:51:23'!
combo1

	^Combo1 new.! !

!CoffeeShopTest methodsFor: 'test objects' stamp: 'JT 11/23/2020 16:51:29'!
combo2

	^Combo2 new.! !


!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'LL 9/22/2020 21:41:51'!
test01ThereAreNoSalesWhenSalesSystemIsCreated

	salesSystem := CoffeeShopSalesSystem new.

	self assert: (salesSystem salesMadeTo: adaLovelace) isEmpty! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'JT 11/23/2020 17:11:30'!
test02CanQuerySalesByCustomer

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	
	self assertSalesTo: adaLovelace withTotalSales: 1 andSales: 1 on: Combo1.! !

!CoffeeShopTest methodsFor: 'tests - sales' stamp: 'JT 11/23/2020 17:11:38'!
test03SalesAreDistinguishedByCustomer

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.
	
	self assertSalesTo:  adaLovelace withTotalSales: 2 andSales: 2 on: Combo1.
	
	self assertSalesTo:  alanKay withTotalSales: 1 andSales: 1 on: Combo2.! !


!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'JT 11/22/2020 13:31:13'!
test04VolumeSoldToCustomerIsZeroWhenCustomerHasNoSaleRegistered

	salesSystem := CoffeeShopSalesSystem new.
	
	self assertVolumeSoldTo: adaLovelace is: 0 in: milliliter.! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'JT 11/22/2020 13:31:47'!
test05VolumeIs_250_WhenOnlyCombo1WasSoldToCustomer

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	
	self assertVolumeSoldTo: adaLovelace is: 250 in: milliliter.! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'JT 11/22/2020 13:33:06'!
test06VolumeIs_100_WhenOnlyCombo2WasSoldToCustomer

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo2.

	self assertVolumeSoldTo: adaLovelace is: 100 in: milliliter. ! !

!CoffeeShopTest methodsFor: 'tests - volume sold' stamp: 'JT 11/22/2020 13:34:18'!
test07VolumeSoldToCustomerIsTheSumOfAllSoldProducts

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertVolumeSoldTo: adaLovelace is: 350 in: milliliter.! !


!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'LL 9/22/2020 21:48:39'!
test08NoRewardExpectedWhenCustomerHasNotBuyAnything

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem rewardOf: adaLovelace ifNone: [ ^self ].
	
	self failWith: 'No reward expected when customer has not buy anything'! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:24:16'!
test09GoldCustomerGetsRewardedWithOneCombo2With50PercentItsPriceWhenRule1Holds

	

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertRewardInCombo2Of: adaLovelace withQuantity: 1  paying: 60 in: peso.

! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:25:06'!
test10SilverCustomerGetsRewardedWithOneCombo2With75PercentItsPriceWhenRule1Holds

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.

	self assertRewardInCombo2Of: alanKay withQuantity: 1  paying: 120*3/4 in: peso.
	
! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:25:35'!
test11NormalCustomerGetsRewardedWithOneCombo2With90PercentItsPriceWhenRule1Holds

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo2.
	
	self assertRewardInCombo2Of: billGates withQuantity: 1  paying: 120*9/10 in: peso.

! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:26:11'!
test12GoldCustomerGetsRewardedWithOneCombo1At75PesosWhenRule2Holds

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo1.
	salesSystem registerSaleTo: adaLovelace of: self combo2.
	
	self assertRewardInCombo1Of: adaLovelace withQuantity: 2  paying: 75 in: peso.

! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:26:44'!
test13SilverCustomerGetsRewardedWithOneCombo1At83PesosWhenRule2Holds

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo1.
	salesSystem registerSaleTo: alanKay of: self combo2.
	
	self assertRewardInCombo1Of: alanKay withQuantity: 2  paying: 83 in: peso.
	! !

!CoffeeShopTest methodsFor: 'tests - rewards' stamp: 'JT 11/23/2020 16:27:17'!
test14NormalCustomerGetsRewardedWithOneCombo1At97PesosWhenRule2Holds

	salesSystem := CoffeeShopSalesSystem new.

	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo1.
	salesSystem registerSaleTo: billGates of: self combo2.
	
	self assertRewardInCombo1Of: billGates withQuantity: 2  paying: 97 in: peso.
	! !


!CoffeeShopTest methodsFor: 'private' stamp: 'JT 11/23/2020 16:17:42'!
assertRewardInCombo1Of: customer withQuantity: quantityExepcted paying: cost in: currency
	
	|customerReward|
	customerReward := salesSystem rewardOf: customer ifNone: [ self fail ].

	self assert: quantityExepcted equals: customerReward quantity.
	self assert: customerReward isForCombo1.
	self assert: cost*currency equals: customerReward price.! !

!CoffeeShopTest methodsFor: 'private' stamp: 'JT 11/23/2020 16:18:04'!
assertRewardInCombo2Of: customer withQuantity: quantityExepcted paying: cost in: currency
	
	|customerReward|
	customerReward := salesSystem rewardOf: customer ifNone: [ self fail ].

	self assert: quantityExepcted equals: customerReward quantity.
	self assert: customerReward isForCombo2.
	self assert: cost*currency equals: customerReward price.! !

!CoffeeShopTest methodsFor: 'private' stamp: 'JT 11/23/2020 17:12:47'!
assertSalesTo: customer withTotalSales: totalSizeExpected andSales: numberOfSalesOnProductExpected on: nameOfProduct
	
	| salesToCustomer |
	
	salesToCustomer := salesSystem salesMadeTo: customer.
	self assert: totalSizeExpected equals: salesToCustomer size.
	self assert: numberOfSalesOnProductExpected equals: (salesToCustomer count: [ :aProduct | aProduct class = nameOfProduct ]).! !

!CoffeeShopTest methodsFor: 'private' stamp: 'JT 11/22/2020 13:30:14'!
assertVolumeSoldTo: customer is: volumeSold in: measurementUnits

	| volumeSoldToCustomer |

	volumeSoldToCustomer := salesSystem volumeSoldTo: customer.

	self assert: volumeSold*measurementUnits equals: volumeSoldToCustomer.! !


!classDefinition: #CoffeeShopCustomer category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopCustomer
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!


!CoffeeShopCustomer methodsFor: 'initialization' stamp: 'JT 11/23/2020 00:26:03'!
initializeNamed: aName 
	
	self subclassResponsibility ! !


!CoffeeShopCustomer methodsFor: 'printing' stamp: 'LL 9/22/2020 18:57:07'!
printOn: aStream

	aStream
		nextPutAll: 'Customer named ';
		nextPutAll: name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopCustomer class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer class
	instanceVariableNames: ''!

!CoffeeShopCustomer class methodsFor: 'instance creation' stamp: 'JT 11/23/2020 00:32:25'!
named: aName 
	
	self subclassResponsibility 
! !


!classDefinition: #Gold category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Gold
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Gold methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:35:05'!
getPriceForCombo1

	^75*peso.! !

!Gold methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:38:25'!
getPriceForCombo2: price

	^price/2.! !

!Gold methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:26:26'!
initializeNamed: aName 
	name := aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Gold class' category: 'AlgoIII-2020-2C-1Parcial'!
Gold class
	instanceVariableNames: ''!

!Gold class methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:32:43'!
named: aName

	^self new initializeNamed: aName! !


!classDefinition: #Normal category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Normal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Normal methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:39:50'!
getPriceForCombo1

	^97*peso.! !

!Normal methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:41:02'!
getPriceForCombo2: price

	^price*9/10.! !

!Normal methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:26:39'!
initializeNamed: aName 
	name := aName! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Normal class' category: 'AlgoIII-2020-2C-1Parcial'!
Normal class
	instanceVariableNames: ''!

!Normal class methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:32:53'!
named: aName

	^self new initializeNamed: aName! !


!classDefinition: #Silver category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopCustomer subclass: #Silver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Silver methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:39:26'!
getPriceForCombo1

	^83*peso.! !

!Silver methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:40:55'!
getPriceForCombo2: price

	^price*3/4.! !

!Silver methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:26:47'!
initializeNamed: aName 
	name := aName! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Silver class' category: 'AlgoIII-2020-2C-1Parcial'!
Silver class
	instanceVariableNames: ''!

!Silver class methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 00:32:57'!
named: aName

	^self new initializeNamed: aName! !


!classDefinition: #CoffeeShopProduct category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopProduct
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!


!classDefinition: #Combo1 category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopProduct subclass: #Combo1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo1 methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:54:24'!
getVolume

	^250*milliliter! !


!classDefinition: #Combo2 category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopProduct subclass: #Combo2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo2 methodsFor: 'as yet unclassified' stamp: 'JT 11/23/2020 16:54:40'!
getVolume

	^100*milliliter! !


!classDefinition: #CoffeeShopReward category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopReward
	instanceVariableNames: 'price quantity product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/20/2020 17:54:42'!
price

	^price! !

!CoffeeShopReward methodsFor: 'accessing' stamp: 'LL 9/21/2020 16:31:13'!
quantity

	^quantity ! !


!CoffeeShopReward methodsFor: 'initialization' stamp: 'LL 9/22/2020 19:08:08'!
initializeOf: aProduct at: aPrice quantity: aQuantity

	product := aProduct.
	price := aPrice.
	quantity := aQuantity
	! !


!CoffeeShopReward methodsFor: 'testing' stamp: 'LL 9/22/2020 19:07:57'!
isForCombo1
	
	^product = #Combo1! !

!CoffeeShopReward methodsFor: 'testing' stamp: 'LL 9/22/2020 19:07:57'!
isForCombo2
	
	^product = #Combo2! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopReward class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopReward class
	instanceVariableNames: ''!

!CoffeeShopReward class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 17:53:14'!
of: aComboType at: aPrice quantity: aQuantity

	^self new initializeOf: aComboType at: aPrice quantity: aQuantity
! !


!classDefinition: #CoffeeShopSalesSystem category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #CoffeeShopSalesSystem
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!CoffeeShopSalesSystem methodsFor: 'product volume' stamp: 'JT 11/23/2020 17:05:45'!
volumeOf: aProduct

	"aProduct = #Combo1 ifTrue: [ ^250*milliliter ].
	aProduct = #Combo2 ifTrue: [ ^100*milliliter ]."
	
	^aProduct getVolume.
	! !


!CoffeeShopSalesSystem methodsFor: 'initialization' stamp: 'LL 9/20/2020 17:17:34'!
initialize

	sales := Dictionary new! !


!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'LL 9/22/2020 19:06:50'!
registerSaleTo: aCustomer of: aProduct

	| salesToCustomer |

	salesToCustomer := sales at: aCustomer ifAbsentPut: [ OrderedCollection new ].
	salesToCustomer add: aProduct ! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'LL 9/20/2020 17:24:49'!
salesMadeTo: aCustomer

	^sales at: aCustomer ifAbsent: [ #() ]! !

!CoffeeShopSalesSystem methodsFor: 'selling' stamp: 'LL 9/22/2020 19:51:19'!
volumeSoldTo: aCustomer

	 ^(self salesMadeTo: aCustomer) sum: [ :aProduct | self volumeOf: aProduct ] ifEmpty: [ 0*milliliter ]! !


!CoffeeShopSalesSystem methodsFor: 'rewarding' stamp: 'LL 9/22/2020 19:53:42'!
rewardOf: aCustomer ifNone: noneBlock 

	| salesToCustomer volumeSoldToCustomer rewardRule |

	salesToCustomer := self salesMadeTo: aCustomer.
	volumeSoldToCustomer := self volumeSoldTo: aCustomer.
	
	rewardRule := RewardRule for: volumeSoldToCustomer ifNone: [^noneBlock value].
	^rewardRule createRewardFor: aCustomer.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CoffeeShopSalesSystem class' category: 'AlgoIII-2020-2C-1Parcial'!
CoffeeShopSalesSystem class
	instanceVariableNames: ''!

!CoffeeShopSalesSystem class methodsFor: 'initialization' stamp: 'LL 9/23/2020 08:50:03'!
initialize

	Smalltalk at: #milliliter put: (BaseUnit named: 'milliliter')! !


!classDefinition: #RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
Object subclass: #RewardRule
	instanceVariableNames: 'product'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:03:50'!
createRewardFor: aCustomer 
	
	self subclassResponsibility ! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:26'!
productQuantity

	self subclassResponsibility ! !

!RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:51:33'!
rewardedProduct

	self subclassResponsibility ! !


!RewardRule methodsFor: 'product price' stamp: 'LL 9/22/2020 21:43:12'!
priceOf: aProduct

	aProduct = #Combo1 ifTrue: [ ^150*peso ].
	aProduct = #Combo2 ifTrue: [ ^120*peso ].

	self error: 'Invalid combo type'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule class
	instanceVariableNames: ''!

!RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 
		
	self subclassResponsibility ! !


!RewardRule class methodsFor: 'instance creation' stamp: 'LL 9/22/2020 19:53:42'!
for: volumeSoldToCustomer ifNone: aNoneBlock

	^self subclasses 
		detect: [ :aRuleClass | aRuleClass isFor: volumeSoldToCustomer ] 
		ifFound: [ :aRuleClass | aRuleClass new ]
		ifNone: aNoneBlock ! !


!classDefinition: #Combo1RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo1RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'JT 11/23/2020 16:35:39'!
createRewardFor: aCustomer 
	
	| price |
	
	product := self rewardedProduct.
	
	"aCustomer type = #Gold ifTrue: [ price := 75*peso ].
	aCustomer type = #Silver ifTrue: [ price := 83*peso ].
	aCustomer type = #Normal ifTrue: [ price := 97*peso ]."
	price := aCustomer getPriceForCombo1.
	
	^CoffeeShopReward of: product at: price quantity: self productQuantity! !

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:54:35'!
productQuantity
	
	^2! !

!Combo1RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:01:41'!
rewardedProduct
	
	^#Combo1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo1RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo1RewardRule class
	instanceVariableNames: ''!

!Combo1RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer > (500*milliliter)! !


!classDefinition: #Combo2RewardRule category: 'AlgoIII-2020-2C-1Parcial'!
RewardRule subclass: #Combo2RewardRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial'!

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'JT 11/23/2020 16:38:05'!
createRewardFor: aCustomer 
	
	| price |
	
	product := self rewardedProduct.
	
	"aCustomer class = Gold ifTrue: [ price := (self priceOf: product)/2 ].
	aCustomer class = Silver ifTrue: [ price := (self priceOf: product)*3/4 ].
	aCustomer class = Normal ifTrue: [ price := (self priceOf: product)*9/10 ]."
	
	price := aCustomer getPriceForCombo2: (self priceOf: product).
	
	^CoffeeShopReward of: product at: price quantity: self productQuantity! !

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 10:23:07'!
productQuantity

	^1! !

!Combo2RewardRule methodsFor: 'reward creation' stamp: 'LL 9/22/2020 19:00:28'!
rewardedProduct
	
	^#Combo2! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combo2RewardRule class' category: 'AlgoIII-2020-2C-1Parcial'!
Combo2RewardRule class
	instanceVariableNames: ''!

!Combo2RewardRule class methodsFor: 'testing' stamp: 'LL 9/22/2020 19:53:22'!
isFor: volumeSoldToCustomer 

	^volumeSoldToCustomer between: 300*milliliter and: 500*milliliter
	! !

CoffeeShopSalesSystem initialize!