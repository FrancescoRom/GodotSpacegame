extends Area2D


@export var speed := 500

func _physics_process(delta: float) -> void:
	position.y -= speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("laser left the screen")
	queue_free()
