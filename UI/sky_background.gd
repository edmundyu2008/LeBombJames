extends ParallaxBackground

@onready var background = %Background
@onready var far_clouds = %FarClouds
@onready var close_clouds = %CloseClouds

func _process(delta: float) -> void:
	background.motion_offset.y += 2 * delta
	far_clouds.motion_offset.y += 10 * delta
	close_clouds.motion_offset.y += 20 * delta
	# The layers move vertically down at different speeds
