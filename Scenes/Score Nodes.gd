extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_area_2d_body_entered(body):
	if body.is_in_group("woodDisk") :
		Global.woodPoints = 5 + Global.woodPoints
		print(Global.woodPoints)
	else :
		if body.is_in_group("blackDisk") :
			Global.blackPoints = 5 + Global.blackPoints


func _on_area_2d_body_exited(body):
	if body.is_in_group("woodDisk") :
		Global.woodPoints =  Global.woodPoints - 5
		print(Global.woodPoints)
	else :
		if body.is_in_group("blackDisk") :
			Global.blackPoints = Global.blackPoints - 5


func _on__point_body_entered(body):
	if body.is_in_group("woodDisk") and body.linear_velocity.length() <= 75:
		Global.woodPoints =  Global.woodPoints +20
		print(Global.woodPoints)
		
		body.queue_free()
	else :
		if body.is_in_group("blackDisk") and body.linear_velocity.length() <= 75:
			
			Global.blackPoints = Global.blackPoints +20
			body.queue_free()


func _on_play_area_body_exited(body):
	
	if body.is_in_group("woodDisk") :
		Global.woodPoints =  Global.woodPoints - 5
		print(Global.woodPoints)
		body.queue_free()
	else :
		if body.is_in_group("blackDisk") :
			
			Global.blackPoints = Global.blackPoints - 5
			
			body.queue_free()
