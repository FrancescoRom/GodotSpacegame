extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal collision

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
	
	var screen_size = get_viewport_rect().size
	var margin = 100
	
	# meteor removing
	if global_position.y > screen_size.y + margin \
	or global_position.x < -margin \
	or global_position.x > screen_size.x + margin:
		queue_free()
		print("meteor removed")
	
func _on_body_entered(_body: Node2D) -> void:
	collision.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	Global.score += 1
	
	$CollisionShape2D.set_deferred("disabled", true)
	$MeteorImage.hide()
	
	$MeteorBoom.play()
	await $MeteorBoom.finished
	
	queue_free()
