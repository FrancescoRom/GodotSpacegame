extends Node2D


# load the scene
var meteor_scene: PackedScene = load ("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load ("res://scenes/laser.tscn")

func _ready() -> void:
	#stars
	var size = get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		#position
		var random_x = rng.randi_range(0, size.x)
		var random_y = rng.randi_range(0, size.y)
		star.position = Vector2(random_x, random_y)

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	


func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.global_position = pos
	print("laser shot")	
