extends Node2D
var lastValue = 0
var woodShotCount = 0
var blackShotCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var disc = $Discs/disc
	disc.discShot.connect(on_disc_shot)
	disc.endShot.connect(on_disc_stop)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

# Function to change the score box
# func _setScore(blackShotCount, whiteShotCount):
	#if (blackShotCount && whiteShotCount) == 12:
		#$Score.set_text = ("  Player 1: " + Global.woodPoints + "\n  Player 2: " + Global.blackPoints)
	#pass

# Checks if disc is on board still
func _boardCheck():
	if !$disc.is_in_node($board):
		queue_free()
	pass
	
func on_disc_shot():
	print("signaled")

func on_disc_stop():
	print("signaled uwu")
