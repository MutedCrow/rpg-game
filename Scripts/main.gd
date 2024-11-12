extends Node2D

@onready var health_bar_value = $UI/THP/HP
@onready var stamina_bar_value = $UI/TStam/Stam
@onready var player = $Player



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_player_health_upd(health, max_health):
	#health_bar_value.size.x = 287 * player.HP / player.THP
	#287
#func _on_player_stamina_upd(stamina, max_stamina):
	#print("gjfdlighdffghdfkghdfkjgdffg")
	#print("changing bar", player.stamina)
	#stamina_bar_value.size.x = 212 * player.Stam / player.TStam
