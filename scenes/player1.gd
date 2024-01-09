extends CharacterBody2D

const GRAVIDADE = 4000
var velocidade = Vector2.ZERO
var vel_max = 300

#variaveis jump

var jum_force = 1200
var is_jump = false #personagem não saltando

func _ready():
	pass
	
func _process(delta):
	#aplicando a gravidade
	velocidade.y += GRAVIDADE * delta
	
	#direção do personagem
	var dir = Input.get_axis("ui_left", "ui_right")
	velocidade.x = dir * vel_max
	
	if is_on_floor():
		#espelhando o personagem 
		if dir > 0:
			$sprite.scale.x = -1
		if dir < 0:
			$sprite.scale.x = 1
		
		else:
			#animação(idle / wlak)
			if dir != 0:
				$anim.play("walk")
			


