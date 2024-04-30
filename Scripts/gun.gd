extends Area2D
var BULLET
func _ready():
	BULLET = preload("res://Scenes/Bullet.tscn")
func _physics_process(delta):
	var enemies = get_overlapping_bodies()
	if enemies.size() > 0:
		var target = enemies[0]
		look_at(target.global_position)

func Shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout():
	Shoot()
