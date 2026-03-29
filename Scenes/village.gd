extends CharacterBody2D



func _physics_process(delta: float) -> void:
	# plays the default running animation
	$Sprite2D.play("default")
