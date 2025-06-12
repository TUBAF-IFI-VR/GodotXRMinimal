extends XRController3D

@onready var player = get_parent()
@onready var teleport_raycast = find_child("TeleportRayCast")
var use_ar = false

func toggle_raycast(enabled:bool):
	if teleport_raycast:
		if not enabled:
			teleport_raycast.teleport(player)
			
		teleport_raycast.enabled = enabled

func switch_to_ar() -> bool:
	var xr_interface = get_parent().get_parent().xr_interface
	if xr_interface:
		var modes = xr_interface.get_supported_environment_blend_modes()
		if XRInterface.XR_ENV_BLEND_MODE_ALPHA_BLEND in modes:
			xr_interface.environment_blend_mode = XRInterface.XR_ENV_BLEND_MODE_ALPHA_BLEND
		elif XRInterface.XR_ENV_BLEND_MODE_ADDITIVE in modes:
			xr_interface.environment_blend_mode = XRInterface.XR_ENV_BLEND_MODE_ADDITIVE
		else:
			return false
	else:
		return false
		
	use_ar = true
	get_parent().get_parent().get_node("Floor").visible = false
	get_viewport().transparent_bg = true
	get_parent().get_parent().get_node("WorldEnvironment").environment.background_mode = Environment.BG_CLEAR_COLOR
	get_parent().get_parent().get_node("WorldEnvironment").environment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	return true
	
func switch_to_vr():
	var xr_interface = get_parent().get_parent().xr_interface
	if xr_interface:
		var modes = xr_interface.get_supported_environment_blend_modes()
		if XRInterface.XR_ENV_BLEND_MODE_OPAQUE in modes:
			xr_interface.environment_blend_mode = XRInterface.XR_ENV_BLEND_MODE_OPAQUE
		else:
			return false
	else:
		return false
		
	use_ar = false
	get_parent().get_parent().get_node("Floor").visible = true
	get_viewport().transparent_bg = false
	get_parent().get_parent().get_node("WorldEnvironment").environment.background_mode = Environment.BG_SKY
	get_parent().get_parent().get_node("WorldEnvironment").environment.ambient_light_source = Environment.AMBIENT_SOURCE_BG
	return true

func _on_button_pressed(name):
	if name == "trigger_click":
		toggle_raycast(true)
	if name == "by_button":
		if use_ar:
			switch_to_vr()
		else:
			switch_to_ar()
	if name == "ax_button":
		get_node("/root/Main/XROrigin3D").rotate_y(deg_to_rad(30))

func _on_button_released(name):
	if name == "trigger_click":
		toggle_raycast(false)
