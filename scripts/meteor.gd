extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	# texture
	var path: String = "res://SpaceShooterRedux/PNG/Meteors/" + str(rng.randi_range(1, 6)) + ".png"
	$MeteorImage.texture = load(path)
	
	var texture_size = $MeteorImage.texture.get_size()
	var circle = CircleShape2D.new()
	circle.radius = min(texture_size.x, texture_size.y) * 0.4
	$CollisionShape2D.shape = circle
	
	
	# start pos
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = randi_range(0, width)
	var random_y = randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# speed / rotation / direction
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(-100, 100)
	
func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player hit")
