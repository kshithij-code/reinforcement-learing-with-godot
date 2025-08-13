extends Sprite2D

@export var speed: float = 1000.0
@export var rotation_speed: float = 3.0 # radians/sec

var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var steering: float = 0.0
	var move_dir: float = 0.0

	# Steering (right/left)
	if Input.is_action_pressed("ui_right"):
		steering -= 1.0
	if Input.is_action_pressed("ui_left"):
		steering += 1.0

	# Forward/backward
	if Input.is_action_pressed("ui_up"):
		print(position)
		move_dir -= 1.0
	if Input.is_action_pressed("ui_down"):
		move_dir += 1.0

	# Rotate (flip steering if reversing)
	if move_dir != 0.0:
		rotation += steering * rotation_speed * delta * sign(move_dir)

	# Move in facing direction
	velocity = Vector2.UP.rotated(rotation) * (move_dir * speed)
	position += velocity * delta
