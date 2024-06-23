extends Area2D

func _physics_process(delta):
	var enimes_in_range = get_overlapping_bodies()
	if enimes_in_range.size()>0:
		var target_enemy = enimes_in_range.front()
		look_at(target_enemy.global_position)
		

func shoot(): 
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = get_node("WeponPivot/Pistol/ShootingPoint").global_position
	new_bullet.global_rotation = get_node("WeponPivot/Pistol/ShootingPoint").global_rotation
	get_node("WeponPivot/Pistol/ShootingPoint").add_child(new_bullet)

func _on_timer_timeout():
	shoot()
