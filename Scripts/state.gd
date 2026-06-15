extends Node
	# Used for storing anything that needs to be held across screens, psuedo-inventory.

	# Engine states.
var enginePartsPurchased:= false
var yellowGoal:= false
var greenGoal:= false
var redGoal:= false
var engineFixed:= false
var cardCollected:= false

	# Hull states.
var bassCollected:= false

	# Radio states.
var coinCollected:= false

	# Cabin states.
var ukuleleCollected:= false
var wheelPurchased:= false

	# Shop states.
# Total money should only ever get to 50.
var money: int = 0

var cardSold:= false
var bassSold:= false
var ukuleleSold:= false
var coinSold:= false
