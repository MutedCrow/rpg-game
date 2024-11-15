extends Area2D


#variables#

@onready var tilemap = get_tree().root.get_node("main/TileMap")
var direction : Vector2
var speed = 80


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + speed * delta * direction





func _on_body_entered(body):
	if body.name == "player":
		return
