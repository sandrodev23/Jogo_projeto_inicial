extends CharacterBody2D


const SPEED = 2000.0
const JUMP_VELOCITY = -400.0

@onready var raycart = $raycart
@onready var textura = $texture
var direction = -1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if raycart.is_colliding():
		direction *= -1
		raycart.scale.x *= -1
	if direction == 1:
		textura.flip_h = true
	else:
		textura.flip_h = false

	velocity.x = direction * SPEED * delta
	
	move_and_slide()
