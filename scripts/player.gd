extends CharacterBody2D

@export var speed: int = 500
var laser_scene: PackedScene = load ("res://scenes/laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(650, 500)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()
		print("laser shot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func shoot() -> void:
	
	var laser = laser_scene.instantiate()
	
	get_tree().current_scene.add_child(laser)
	# position to spaceships current pos
	laser.global_position = global_position
	
