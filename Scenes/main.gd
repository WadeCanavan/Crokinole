extends Node2D
var lastValue = 0

var woodCount = 0
var blackCount = 0
var shotCount = 0
var curDisc
signal slider
# Called when the node enters the scene tree for the first time.
func _ready():
	new_disc()
	curDisc.discShot.connect(on_disc_shot)
	curDisc.endShot.connect(on_disc_stop)
	$"Score Nodes".twenty.connect(new_disc) #triggers when we score 20
	$"Score Nodes/20 point/RichTextLabel".visible = false
	$"Score Nodes/20 point/TextureRect".visible = false


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
	print(shotCount)
	if shotCount == 12:
		get_tree().change_scene_to_file("res://Scenes/winner.tscn")
	new_disc()
	curDisc.discShot.connect(on_disc_shot)
	curDisc.endShot.connect(on_disc_stop)

func new_disc():
	print("new disc")
	shotCount = shotCount + 1
	curDisc = load("res://Scenes/disc.tscn").instantiate()
	#discInst.get_parent().remove_child(discInst)
	$Discs.add_child(curDisc)
	if (shotCount % 2):
		curDisc.position = Vector2(768, 472)
		curDisc.add_to_group("wood")
	else:
		curDisc.position = Vector2(384, 160.078)
		curDisc.add_to_group("black")
		curDisc.get_child(0,false).texture = load("res://Assets/materials/black.tres")

func _on_h_slider_value_changed(value):
	slider.emit(value)
