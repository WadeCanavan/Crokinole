extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_game_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_help_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Help.tscn")

func _on_credits_button_pressed():
	$"Buttons".visible = false
	$"TitleText".visible = false
	$"Credits".visible = true
	
func _on_exit_button_pressed():
	$"Buttons".visible = true
	$"TitleText".visible = true
	$"Credits".visible = false

func _on_exit_game_button_pressed():
	get_tree().quit()


func _on_exit_help_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Title.tscn")
