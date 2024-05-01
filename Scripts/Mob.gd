extends CharacterBody2D
@onready var player = get_node("/root/Game/Player")
@export var slime_Anim : Node2D
const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
var health = 3

func _ready():
	slime_Anim.play_walk()
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()
	
func take_damage():
	health -= 1
	slime_Anim.play_hurt()
	if health == 0:
		Die()
		
func Die():
	queue_free()
	var smoke = SMOKE_SCENE.instantiate()
	smoke.global_position = global_position
	get_parent().add_child(smoke)
