extends Node2D
var lastValue

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Function to change the score box
func _setScore(blackShotCount, whiteShotCount):
	if (blackShotCount && whiteShotCount) == 12:
		$Score.set_text = ("  Player 1: " + Global.woodPoints + "\n  Player 2: " + Global.blackPoints)
	pass

# Checks if disc is on board still
func _boardCheck():
	if !$disc.is_in_node($board):
		queue_free()
	pass

func _on_h_slider_value_changed(value):
	$"Discs/disc".value = value - lastValue
	var lastValue = value
