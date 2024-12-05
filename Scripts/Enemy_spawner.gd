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


func spawn_enemy():
	var enemy = Global.Gunslinger_scene.instantiate()
	Spawned_Enemies.add_child(enemy)
	

func is_valid_spawn_location(layer, position):
	var cell_coords = Vector2(position.x, position.y)
	if tilemap.get_cell_source_id(Global.below, cell_coords) != 1 || tilemap.get_cell_source_id(Global.ground, cell_coords) != 1 || tilemap.get_cell_source_id(Global.above, cell_coords) != 1:
		return false
	if tilemap.get_cell_source_id(Global.below, cell_coords) != 1 || tilemap.get_cell_source_id(Global.ground, cell_coords) != 1 || tilemap.get_cell_source_id(Global.above, cell_coords) != 1:
		return true
	
