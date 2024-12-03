extends Node2D

@onready var Spawned_Enemies = $SpawnedEnemies
@onready var tilemap = get_tree().root.get_node("Main/TileMap")

@onready var max_enemies = 20
var enemy_count = 0
var rng = RandomNumberGenerator.new()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
