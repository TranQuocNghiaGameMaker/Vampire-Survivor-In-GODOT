extends Node2D

const MOB = preload("res://Scenes/mob.tscn")
func _spawn_mobs():
	var mob = MOB.instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)


func _on_timer_timeout():
	_spawn_mobs()
