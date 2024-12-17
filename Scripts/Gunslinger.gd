extends CharacterBody2D


@export var speed = 120.0
var direction: Vector2 = Vector2.ZERO
var new_direction = Vector2(0, 1)

var health = 100
var regen_health = 1
var max_health =  100

@onready var bullet_scene = preload("res://Scenes/Bullet.tscn")
var bullet_damage = 30
var damage = 30
var bullet_reload_time = 5
var bullet_fired_time = 0.5

var rng = RandomNumberGenerator.new()

var timer = 0

#@onready var player = $"../Player"
var player = get_tree().root.get_node("main/Player")
var animation
@onready var timer_node = $Timer
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
var is_attacking = false

signal death

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _process(delta: float) -> void:
	
	var updated_health = clamp(health + regen_health * delta,0, max_health)
	if updated_health != health: 
		health = updated_health


func _ready() -> void:
	rng.randomize()


func _physics_process(delta):
	
	var movement = speed * direction * delta
	var collision = move_and_collide(movement)
	
	if collision != null and collision.get_collider().name != "player":
		direction = direction.rotated(rng.randf_range(PI/4, PI/2))
		timer = rng.randf_range(2, 5)
	else:
		timer = 0
		
	if !is_attacking:
		enemyDirection(direction)





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
			
			
	
	
func enemyDirection(direction: Vector2):

	if direction != Vector2.ZERO:
		new_direction = direction
		animation = "walk_" + GSreturnedDirection(new_direction)
		animated_sprite.play(animation)
	else:
		animation = "idle_" + GSreturnedDirection(direction)
		animated_sprite.play(animation)
		



func GSreturnedDirection(direction: Vector2):
	var normalized_direction = direction.normalized()
	var default_return = "down"
	
	if abs(normalized_direction.x) > abs(normalized_direction.y):
		if normalized_direction.x > 0:
			animated_sprite.flip_h = false
			return "side"
		else: 
			animated_sprite.flip_h = true
			return "side"
	if normalized_direction.y > 0:
		return "down"
	elif normalized_direction.y < 0:
		return "up"
			
			
	return default_return
	
	
	
	


func hit(damage):
	health -= damage
	if health > 0:
		animated_sprite.play("hit")
		animation_player.play("1")
		is_attacking = false
		await get_tree().create_timer(2).timeout
		
	else:
		timer_node.stop()
		set_process(false)
		is_attacking = true
		direction = Vector2.ZERO
		animated_sprite.play("death")
		death.emit()
		







func _on_animated_sprite_2d_animation_finished():
	if animated_sprite.animation == "death":
		get_tree().queue_delete(self)
	is_attacking = false


func _on_animation_player_animation_finished(anim_name):
	animated_sprite.modulate = Color(1, 1, 1, 1)
