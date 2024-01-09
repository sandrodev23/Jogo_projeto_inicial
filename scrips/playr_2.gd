extends CharacterBody2D
const GRAVIDADE = 4000
var velocidade = Vector2.ZERO
var vel_max = 300
#variaveis personagem atacando
var atacando = false
var time = 0 
#variaveis jump

var jum_force = 1200
var is_jump = false #personagem não saltando

func _ready():
	pass
	
func _process(delta):
	#aplicando a gravidade
	velocity.y += GRAVIDADE * delta
	
	#direção do personagem
	var dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = dir * vel_max
	
	if is_on_floor() and !atacando:
		#espelhando o personagem 
		if dir > 0:
			$texture.flip_h = true
		if dir < 0:
			$texture.flip_h = false
		else:
			#animação(idle / wlak)
			if dir == 0:
				$anim.play("idle")
			else:
				$anim.play("walk")
				
			is_jump = false
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump()
		
	velocidade = move_and_slide()
	#ataque do personagem
	if Input.is_action_just_pressed("attack"):
		atacando = true
		$anim.play("attack1")
		time = 0.32
	if atacando:
		time -= delta
		if time <= 0:
			atacando = false
			time = 0	
		
func jump():
	$anim.play("jump")
	is_jump = true
	velocity.y = -jum_force
			




