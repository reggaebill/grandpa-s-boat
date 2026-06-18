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
var CB_Radio_complete = false

	# Cabin states.
var ukuleleCollected:= false
var wheelPurchased:= false
var wheelComplete:= false

	# Shop states.
# Total money should only ever get to 50.
var money: int = 0

var cardSold:= false
var bassSold:= false
var ukuleleSold:= false
var coinSold:= false

	# Journal states.
# Notes that are revealed as parts are visited.
var noteCheck1:= false
var noteCheck2:= false
var noteCheck3:= false
# Functions to make the above work, because we don't have a signals global.
func _noteCollect1():
	noteCheck1 = true
	sfx.play_sfx(sfx.journal_scribble)

func _noteCollect2():
	noteCheck2 = true
	sfx.play_sfx(sfx.journal_scribble)

func _noteCollect3():
	noteCheck3 = true
	sfx.play_sfx(sfx.journal_scribble)
