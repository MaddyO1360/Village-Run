extends ParallaxBackground

'''
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
'''
@export var scroll_speed := 200.0

func _process(delta):
	scroll_offset.x += scroll_speed * delta
