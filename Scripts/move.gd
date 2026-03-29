extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$Sprite2D.play("run")

	move_and_slide()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
