extends RayCast3D

func teleport(player:XROrigin3D):
	if player and is_colliding():
		var p = get_collision_point()
		player.position = p

func _physics_process(_delta):
	if enabled:
		$RayCastMesh.visible = true
	else:
		$RayCastMesh.visible = false
	
	if is_colliding():
		var p = get_collision_point()
		$TeleportMarker.visible = true
		$TeleportMarker.position = p
		$TeleportMarker.rotation = Vector3(0,0,0)
	else:
		$TeleportMarker.visible = false
