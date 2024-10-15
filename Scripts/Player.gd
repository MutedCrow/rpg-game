extends CharacterBody2D


@export var speed = 50

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	
	var direction: Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") + Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
		
	
		var movement = direction * speed * delta
		move_and_collide(movement)
