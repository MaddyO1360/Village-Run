extends CharacterBody2D

const GRAVITY : int = 4200

var sheep = preload("res://Scenes/sheep.tscn")
var blacksheep = preload("res://Scenes/blacksheep.tscn")
var cow = preload("res://Scenes/cow.tscn")
var commoner = preload("res://Scenes/commoner.tscn")
var commoner2 = preload("res://Scenes/commoner_2.tscn")
var wagon = preload("res://Scenes/wagon.tscn")
var chef = preload("res://Scenes/chef.tscn")

var objects = []
var rng = RandomNumberGenerator.new()

func _ready():
	objects = [sheep, blacksheep, chef, cow, commoner, commoner2, wagon]

# Called when the node enters the scene tree for the first time.

func spawner():
	print("SPAWNING")
	var index = rng.randi_range(0, objects.size() - 1)
	var scene = objects[index]
	var new_object = scene.instantiate()
	#new_object.global_position = global_position
	new_object.global_position = Vector2(600, 400)
	new_object.z_index = 100
	get_parent().add_child(new_object)  # safer than add_sibling
	
	
func _on_timer_timeout() -> void:
	spawner()


func _physics_process(_delta: float) -> void:
	# plays the default running animation
	$Sprite2D.play("default")
	
	
