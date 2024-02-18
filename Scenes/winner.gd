extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.woodTotalPoints > Global.blackTotalPoints :
		$BlackWinnerLabel.set_text("")
	else :
		$WoodWinnerLabel.set_text("")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
