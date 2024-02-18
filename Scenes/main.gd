extends Node2D
var lastValue = 0

var woodCount = 0
var blackCount = 0
var shotCount
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
	get_node("/root/Main/scoreBox/Score").text = str("  Player 1: ", Global.woodPoints, "\n  Player 2: ", Global.blackPoints)
	shotCount = shotCount + 1
	print(shotCount)
	if counter == 11:
		get_tree().change_scene_to_file("res://Scenes/winner.tscn")
	var discInst = load("res://Scenes/disc.tscn").instantiate()
	#discInst.get_parent().remove_child(discInst)
	$Discs.add_child(discInst)
