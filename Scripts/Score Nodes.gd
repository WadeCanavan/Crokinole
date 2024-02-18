extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("wood") :
	
		Global.woodPoints = 5 + Global.woodPoints
		print(Global.woodPoints)
	else :
		if body.is_in_group("black") :
			
			Global.blackPoints = 5 + Global.blackPoints


func _on_area_2d_body_exited(body):
	if body.is_in_group("wood") :
		#$"20 point/RichTextLabel".visible = false
		Global.woodPoints =  Global.woodPoints - 5
		print(Global.woodPoints)
		
	else :
		if body.is_in_group("black") :
			#$"20 point/RichTextLabel".visible = false
			Global.blackPoints = Global.blackPoints - 5


func _on__point_body_entered(body):
	var name = body.get_instance_id()
	var origin = Vector2( 576, 316.039 )
	if body.is_in_group("wood") and body.linear_velocity.length() <= 200:
		Global.woodPoints =  Global.woodPoints +20
		$"20 point/RichTextLabel".visible = true
		$"20 point/TextureRect".visible = true
		
		body.queue_free()
		await get_tree().create_timer(4.0).timeout
		$"20 point/RichTextLabel".visible = false
		$"20 point/TextureRect".visible = false

		#print(Global.woodPoints)
		
	else :
		if body.is_in_group("black") and body.linear_velocity.length() <= 200:
			
			Global.blackPoints = Global.blackPoints +20
			$"20 point/RichTextLabel".visible = true
			$"20 point/TextureRect2".visible = true
			
			body.queue_free()
			await get_tree().create_timer(4.0).timeout
			$"20 point/RichTextLabel".visible = false
			$"20 point/TextureRect2".visible = false


func _on_play_area_body_exited(body):
	var name = body.get_instance_id()
	if body.is_in_group("wood") :
		Global.woodPoints =  Global.woodPoints - 5
		#$"20 point/RichTextLabel".visible = false
		
		print(Global.woodPoints)
		body.queue_free()

	else :
		if body.is_in_group("black") :
			
			Global.blackPoints = Global.blackPoints - 5
			#$"20 point/RichTextLabel".visible = false
			body.queue_free()

