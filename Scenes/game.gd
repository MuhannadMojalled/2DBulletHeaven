extends Node2D


func spawn_mob():
	var new_mob = preload("res://Scenes/mob.tscn").instantiate()
	$Player/Path2D/EnemyPath.progress_ratio = randf()
	new_mob.global_position = $Player/Path2D/EnemyPath.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleated():
	%GameOver.visible = true
	get_tree().paused = true
