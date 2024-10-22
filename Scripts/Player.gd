extends CharacterBody2D


@export var speed = 200
@onready var animated_sprite = $AnimatedSprite2D
var new_direction: Vector2 = Vector2.ZERO
var animation: String
var is_attacking
# Get the gravity from the project settings to be synced with RigidBody nodes.




func _physics_process(delta):
	
	var direction: Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
		
	
	var movement = direction * speed * delta
	if is_attacking == false:
		move_and_collide(movement)
		playerDirection(direction)

func playerDirection(direction: Vector2):
	if direction != Vector2.ZERO:
		new_direction = direction
		animation = "walk_" + returnedDirection(new_direction)
		animated_sprite.play(animation)
	else:
		animation = "idle_" + returnedDirection(direction)
		animated_sprite.play(animation)


func returnedDirection(direction: Vector2):
	var normalized_direction = direction.normalized()
	var default_return = "down"
	
	if normalized_direction.y > 0:
		return "down"
	elif normalized_direction.y < 0:
		return "up"
	elif normalized_direction.x > 0:
		animated_sprite.flip_h = false
		return "side"
	elif normalized_direction.x < 0 and normalized_direction.y == 0:
		animated_sprite.flip_h = true
		return "side"
		
		
	return default_return

func _input(event):
	if event.is_action_pressed("shoot"):
		is_attacking = true
		animation = "attack_" + returnedDirection(new_direction)
		animated_sprite.play(animation)
		




func _on_animated_sprite_2d_animation_finished():
	print("finish attacking")
	is_attacking = false