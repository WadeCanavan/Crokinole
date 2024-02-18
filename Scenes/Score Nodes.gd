extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_area_2d_body_entered(body):
	if body.is_in_group("woodDisk") :
		$"20 point/RichTextLabel".visible = false
		Global.woodPoints = 5 + Global.woodPoints
		print(Global.woodPoints)
	else :
		if body.is_in_group("blackDisk") :
			$"20 point/RichTextLabel".visible = false
			Global.blackPoints = 5 + Global.blackPoints


func _on_area_2d_body_exited(body):
	if body.is_in_group("woodDisk") :
		$"20 point/RichTextLabel".visible = false
		Global.woodPoints =  Global.woodPoints - 5
		print(Global.woodPoints)
		
	else :
		if body.is_in_group("blackDisk") :
			$"20 point/RichTextLabel".visible = false
			Global.blackPoints = Global.blackPoints - 5


func _on__point_body_entered(body):
	if body.is_in_group("woodDisk") and body.linear_velocity.length() <= 100:
		Global.woodPoints =  Global.woodPoints +20
		$"20 point/RichTextLabel".visible = true
		print(Global.woodPoints)
		
		body.queue_free()
	else :
		if body.is_in_group("blackDisk") and body.linear_velocity.length() <= 100:
			
			Global.blackPoints = Global.blackPoints +20
			$"20 point/RichTextLabel".visible = true
			body.queue_free()


func _on_play_area_body_exited(body):
	
	if body.is_in_group("woodDisk") :
		Global.woodPoints =  Global.woodPoints - 5
		$"20 point/RichTextLabel".visible = false
		
		print(Global.woodPoints)
		body.queue_free()
	else :
		if body.is_in_group("blackDisk") :
			
			Global.blackPoints = Global.blackPoints - 5
			$"20 point/RichTextLabel".visible = false
			
			body.queue_free()
