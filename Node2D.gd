extends Node2D

# Declare member variables here.
var start_position = Vector2()
var end_position = Vector2()
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame.
func _process(delta):
	if is_dragging:
		end_position = get_global_mouse_position()
		

# Called when the mouse button is pressed.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				start_drag()
				
			else:
				end_drag()

func start_drag():
	start_position = get_global_mouse_position()
	is_dragging = true

func end_drag():
	is_dragging = false
	end_position = get_global_mouse_position()
	shoot()
	print("Shoot end")

func shoot():
	var direction = start_position - end_position
	var speed = 300 # Speed of the shot, can be adjusted
	var velocity = direction.normalized() * speed
	# Apply velocity to the node or launch a projectile here
	
