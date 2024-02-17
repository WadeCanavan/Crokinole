extends RigidBody2D

var pressed = false
var clickPos
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and  event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print("Left button was clicked at ", event.position)
			clickPos = event.position
			pressed = true
			
func _input(event):
	if event is InputEventMouseButton and  event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and pressed:
			pressed = false
			#print("Left button was released at ", event.position)
			var force = Vector2(clickPos.x - event.position.x, clickPos.y - event.position.y)
			var distance = sqrt(pow(clickPos.x - event.position.x,2) + pow(clickPos.y - event.position.y, 2))
			#print("distance to disc ", distance)
			#print(clickPos.x, event.position.x, clickPos.y, event.position.y)
			linear_velocity = force * 5
