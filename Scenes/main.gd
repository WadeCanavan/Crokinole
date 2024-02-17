extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Function to change the score box
func _setScore(blackShotCount, whiteShotCount):
	if (blackShotCount && whiteShotCount) == 12:
		$Score.set_text = ("Player 1: " + Global.woodPoints + "\nPlayer 2: " + Global.blackPoints)
	pass
