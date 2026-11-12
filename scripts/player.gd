extends CharacterBody2D

@export var speed := 500
var bank: float = 0.0

signal laser(pos)
var can_shoot: bool = true


func _ready():
	position = Vector2(650, 500)


func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	var target_bank = direction.x
	
	bank = move_toward(bank, target_bank, 5.0 * delta)
	$PlayerImage.material.set_shader_parameter("bank", bank)
	
	velocity = direction * speed
	move_and_slide()

	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()


func _on_laser_timer_timeout() -> void:
	can_shoot = true
