extends CharacterBody2D


const GRAVITY = 4200

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	move_and_slide()
