extends Area2D


enum Pickups { AMMO, STAMINA, HEALTH }
@export var Item : Pickups

@onready var sprite = $Sprite2D

var ammo_texture = "res://Assets/Icons/bulletUP.png"
var stamina_texture = "res://Assets/Icons/potion_02b.png"
var health_texture = "res://Assets/Icons/potion_01a.png"


func _ready():
		if not Engine.is_editor_hint():
			if Item == Pickups.AMMO:
				sprite.set_texture(ammo_texture)
			elif Item == Pickups.STAMINA:
				sprite.set_texture(stamina_texture)
			elif Item == Pickups.HEALTH:
				sprite.set_texture(health_texture)


func _process(_delta):
	if Engine.is_editor_hint():
		if Item == Pickups.AMMO:
			sprite.set_texture(ammo_texture)
		elif Item == Pickups.STAMINA:
			sprite.set_texture(stamina_texture)
		elif Item == Pickups.HEALTH:
			sprite.set_texture(health_texture)
			


func _on_body_entered(body):
	if body.name == "player":
		queue_free()
