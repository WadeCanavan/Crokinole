extends RigidBody2D

var pressed = false
var clickPos

var lastValue = 0 
var curValue = 0 
var shot = false
signal discShot
signal endShot
var signaled = false

func _ready():
	var main = get_tree().get_first_node_in_group("main")
	main.slider.connect(move_disc)
	#if self.is_in_group("black"):

	
func _process(delta):
	if shot && (linear_velocity.x > -1) && (linear_velocity.y > -1) && (linear_velocity.x < 1) && (linear_velocity.y < 1) && !signaled:
		endShot.emit()
		signaled = true
		print(linear_velocity)
		
	
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and  event.button_index == MOUSE_BUTTON_LEFT and event.pressed and not shot:
			#print("Left button was clicked at ", event.position)
			clickPos = event.position
			pressed = true
			
func _input(event):
	if event is InputEventMouseButton and  event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and pressed and not shot:
			pressed = false
			#print("Left button was released at ", event.position)
			var force = Vector2(clickPos.x - event.position.x, clickPos.y - event.position.y)
			var distance = sqrt(pow(clickPos.x - event.position.x,2) + pow(clickPos.y - event.position.y, 2))
			#print("distance to disc ", distance)
			#print(clickPos.x, event.position.x, clickPos.y, event.position.y)
			linear_velocity = force * 5
			shot = true
			discShot.emit()
			

func _integrate_forces(state):
	#print(curValue)
	if curValue != 0 and not shot:
		var origin = Vector2( 576, 316.039 )
		print( origin.distance_to(Vector2(position.x,position.y)))
		var angle = origin.angle_to_point( Vector2(position.x,position.y))
		position.x = origin.x + cos(angle + (curValue)) * 246.105651855469 
		position.y = origin.y + sin(angle + (curValue)) * 246.105651855469 
		curValue = 0

func move_disc(value):
	print(lastValue, "  ", value, "  ", curValue)
	if lastValue < value:
		curValue = value/200
	else:
		curValue = value/200 * -1 
	print(lastValue, "  ", value, "  ", curValue)
	lastValue = value
