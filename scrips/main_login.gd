extends Node


func _process(delta):
	$loginl/anim.play("login")


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/leve_1.tscn")
