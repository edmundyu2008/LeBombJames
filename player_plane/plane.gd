extends Node2D

@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	pass
	
func fire_lasers() -> void:
	spawner_component.spawn(muzzle.global_position)
