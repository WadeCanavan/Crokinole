extends RigidBody2D

var pressed = false
var clickPos

var lastValue = 0 
var curValue = 0 

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

func _integrate_forces(state):
	print(curValue)
	if curValue != 0 :
		var origin = Vector2( 576, 316.039 )
		print( origin.distance_to(Vector2(position.x,position.y)))
		var angle = origin.angle_to_point( Vector2(position.x,position.y))
		position.x = origin.x + cos(angle + (curValue)) * 246.105651855469
		position.y = origin.y + sin(angle + (curValue)) * 246.105651855469
		lastValue = curValue
		curValue = 0
		
func _on_h_slider_value_changed(value):
	curValue = value - lastValue
