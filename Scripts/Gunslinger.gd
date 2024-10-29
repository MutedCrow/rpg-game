extends CharacterBody2D


@export var speed = 30.0
var direction: Vector2
var new_direction = Vector2(0, 1)

var rng = RandomNumberGenerator.new()

var timer = 0

var player = get_tree().root.get_node("main/player")

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready() -> void:
	rng.randomize()


func _physics_process(delta):
	var movement = speed * direction * delta
	var collision = move_and_collide(movement)





func _on_timer_timeout():
	var player_distance = player.position - position
	
	if player_distance.length() <= 20:
		new_direction = player_distance.normalized()
	elif player_distance.length() <= 100 and timer == 0:
		direction = player_distance.normalized()
	elif timer == 0:
		var random_direction = rng.randf()
		if random_direction < 0.05:
			direction = Vector2.ZERO
		elif random_direction < 0.1:
			direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
