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
	var attempts = 0
	var max_attempts = 100
	var spawned = false
	
	while not spawned and attempts < max_attempts:
		var random_position = Vector2(rng.randi() % tilemap.get_used_rect().size.x, rng.randi() % tilemap.get_used_rect().size.y)
		if is_valid_spawn_location(Global.ground, random_position):
			var enemy = Global.Gunslinger_scene.instantiate()
			enemy.position = tilemap.map_to_local(random_position) + Vector2(tilemap.tile_size.x, tilemap.tile_size.y)/2 
			Spawned_Enemies.add_child(enemy)
			spawned = true
		else:
			attempts += 1
	if 
	

func is_valid_spawn_location(layer, position):
	var cell_coords = Vector2(position.x, position.y)
	if tilemap.get_cell_source_id(Global.below, cell_coords) != 1:
		return false
	if tilemap.get_cell_source_id(Global.ground, cell_coords) != 1:
		return true
	if tilemap.get_cell_source_id(Global.above, cell_coords) != 1:
		return false
	
