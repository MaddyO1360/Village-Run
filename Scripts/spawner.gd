extends Area2D
const GRAVITY : int = 4200
const SPEED : int = 300
var sheep = preload("res://Scenes/sheep.tscn")
var blacksheep = preload("res://Scenes/blacksheep.tscn")
var cow = preload("res://Scenes/cow.tscn")
var commoner = preload("res://Scenes/commoner.tscn")
var commoner2 = preload("res://Scenes/commoner_2.tscn")
var wagon = preload("res://Scenes/wagon.tscn")
var chef = preload("res://Scenes/chef.tscn")

var objects = []
var rng = RandomNumberGenerator.new()

var direction : Vector2

func _ready():
	objects = [sheep, blacksheep, chef, cow, commoner, commoner2, wagon]

# Called when the node enters the scene tree for the first time.
func launch(p_direction : Vector2):
	direction = p_direction
func spawner():
	
	var index = rng.randi_range(0, 6)
	var scene = objects[index]
	var new_object = scene.instantiate()
	
	new_object.global_position = Vector2(700, 300)
	new_object.scale = Vector2(0.75, 0.75)
	new_object.z_index = 100
	new_object.translate(Vector2.LEFT)
	new_object.move_and_slide()
	new_object.velocity.x -= SPEED
	get_tree().current_scene.add_child(new_object)
	if new_object.global_position.x < 300:
		new_object.self.queue()
func _on_timer_timeout() -> void:
	spawner()
