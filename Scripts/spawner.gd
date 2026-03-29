extends Area2D

#preload objects
var sheep = preload("res://Scenes/sheep.tscn")
var blacksheep = preload("res://Scenes/blacksheep.tscn")
var cow = preload("res://Scenes/cow.tscn")
var commoner = preload("res://Scenes/commoner.tscn")
var commoner2 = preload("res://Scenes/commoner_2.tscn")
var wagon = preload("res://Scenes/wagon.tscn")

#instantiated objects
var new_sheep = sheep.instantiate()
var new_blacksheep = blacksheep.instantiate()
var new_cow = cow.instantiate()
var new_commoner = commoner.instantiate()
var new_commoner2 = commoner2.instantiate()
var new_wagon = wagon.instantiate()

# Called when the node enters the scene tree for the first time.
func spawner():
	var object = [new_sheep, new_blacksheep, new_cow, new_commoner, new_commoner2,new_wagon]
	var rng = RandomNumberGenerator.new()
	var n = rng.randi_range(0, 5)
	var new_object = object[n]
	new_object.set_global_position(Vector2(position.x, position.y))
	add_child(new_object)


func _on_timer_timeout() -> void:
	spawner()
