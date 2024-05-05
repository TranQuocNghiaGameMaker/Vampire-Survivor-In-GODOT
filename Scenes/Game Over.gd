extends CanvasLayer


func _on_player_health_depleted():
	visible = true
	get_tree().paused = true
